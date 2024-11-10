package bgaebalja.exsherpa.examination.service;

import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.exam.service.ExamService;
import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import bgaebalja.exsherpa.examination.domain.SolvedQuestion;
import bgaebalja.exsherpa.examination.domain.SubmitResultRequest;
import bgaebalja.exsherpa.examination.repository.ExaminationRepository;
import bgaebalja.exsherpa.exception.UserNotFoundException;
import bgaebalja.exsherpa.solvedquestion.service.SolvedQuestionService;
import bgaebalja.exsherpa.user.domain.Users;
import bgaebalja.exsherpa.user.repository.UserRepository;
import bgaebalja.exsherpa.util.FormatConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

import static bgaebalja.exsherpa.exception.ExceptionMessage.USER_NOT_FOUND_EXCEPTION_MESSAGE;
import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;
import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_UNCOMMITTED, readOnly = true, timeout = 20)
public class ExaminationServiceImpl implements ExaminationService {
    private final ExaminationRepository examinationRepository;
    private final ExamService examService;
    private final SolvedQuestionService solvedQuestionService;
    private final UserRepository userRepository;

    private final EntityManager entityManager;

    private static final String CREATE_EXAMINATION_KEY
            = "#submitResultRequest.email + '_' + #submitResultRequest.examId";
    private static final String CREATE_KEY_CONDITION = "#submitResultRequest != null";

    private static final String GET_EXAMINATION_KEY = "#email + '_' + #examId";
    private static final String GET_KEY_CONDITION = "#email != null && #examId != null";

    private static final String KEY_VALUE = "examination";
    private static final String UNLESS_CONDITION = "#result == null";

    @Override
    @Transactional(isolation = READ_COMMITTED, timeout = 15)
    public int registerResult(SubmitResultRequest submitResultRequest) {
        String email = submitResultRequest.getEmail();
        Users user = userRepository.findByUserId(email)
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_EXCEPTION_MESSAGE, email)));
        Exam exam = examService.getExam(FormatConverter.parseToLong(submitResultRequest.getExamId()));
        ExaminationHistory examinationHistory = ExaminationHistory.from(submitResultRequest, user, exam);

        examinationRepository.save(examinationHistory);
        solvedQuestionService.registerSolvedQuestions(submitResultRequest.getAnswerRequests(), examinationHistory);
        entityManager.refresh(examinationHistory);

        return examinationRepository.findByUserIdAndSolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc(
                        user.getId()
                )
                .size();
    }

    @Override
    @Transactional(isolation = READ_UNCOMMITTED, timeout = 15)
    @CachePut(
            key = CREATE_EXAMINATION_KEY, condition = CREATE_KEY_CONDITION, unless = UNLESS_CONDITION, value = KEY_VALUE
    )
    public ExaminationHistory registerCacheData(SubmitResultRequest submitResultRequest) {
        String email = submitResultRequest.getEmail();
        Users user = userRepository.findByUserId(email)
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_EXCEPTION_MESSAGE, email)));
        Exam exam = examService.getExam(FormatConverter.parseToLong(submitResultRequest.getExamId()));
        ExaminationHistory examinationHistory = ExaminationHistory.from(submitResultRequest, user, exam);
        List<SolvedQuestion> solvedQuestions
                = solvedQuestionService.registerCachedSolvedQuestions(submitResultRequest.getAnswerRequests(), examinationHistory);
        examinationHistory.addSolvedQuestions(solvedQuestions);

        return examinationHistory;
    }

    @Override
    @Cacheable(key = GET_EXAMINATION_KEY, condition = GET_KEY_CONDITION, unless = UNLESS_CONDITION, value = KEY_VALUE)
    public ExaminationHistory getCachedExaminationHistory(String email, Long examId) {
        return null;
    }

    @Override
    public List<ExaminationHistory> getSolvedExaminationHistories() {
        return examinationRepository.findBySolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc();
    }

    @Override
    public List<ExaminationHistory> getSolvedExaminationHistories(String email) {
        Users user = userRepository.findByUserId(email)
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_EXCEPTION_MESSAGE, email)));
        return examinationRepository.findByUserIdAndSolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc(
                user.getId()
        );
    }

    @Override
    public List<ExaminationHistory> getSolvedExaminationHistoriesFromExam(Long examId) {
        return examinationRepository.findByExamIdAndSolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc(examId);
    }

    @Override
    public List<ExaminationHistory> getSolvedExaminationHistoriesFromExam(Long examId, String email) {
        Users user = userRepository.findByUserId(email)
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_EXCEPTION_MESSAGE, email)));

        return examinationRepository.findByExamIdAndUserIdAndSolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc(examId, user.getId());
    }
}
