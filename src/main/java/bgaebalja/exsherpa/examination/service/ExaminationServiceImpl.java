package bgaebalja.exsherpa.examination.service;

import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.exam.service.ExamService;
import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import bgaebalja.exsherpa.examination.domain.SubmitResultRequest;
import bgaebalja.exsherpa.examination.repository.ExaminationRepository;
import bgaebalja.exsherpa.exception.UserNotFoundException;
import bgaebalja.exsherpa.solvedquestion.service.SolvedQuestionService;
import bgaebalja.exsherpa.user.domain.Users;
import bgaebalja.exsherpa.user.repository.UserRepository;
import bgaebalja.exsherpa.util.FormatConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

import static bgaebalja.exsherpa.exception.ExceptionMessage.USER_NOT_FOUND_EXCEPTION_MESSAGE;
import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_UNCOMMITTED, timeout = 20)
public class ExaminationServiceImpl implements ExaminationService {
    private final ExaminationRepository examinationRepository;
    private final ExamService examService;
    private final SolvedQuestionService solvedQuestionService;
    private final UserRepository userRepository;

    private final EntityManager entityManager;


    @Override
    public Long registerResult(SubmitResultRequest submitResultRequest) {
        String email = submitResultRequest.getEmail();
        Users user = userRepository.findByUserId(email)
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_EXCEPTION_MESSAGE, email)));
        Exam exam = examService.getExam(FormatConverter.parseToLong(submitResultRequest.getExamId()));
        ExaminationHistory examinationHistory = ExaminationHistory.from(submitResultRequest, user, exam);

        examinationRepository.save(examinationHistory);
        solvedQuestionService.registerSolvedQuestions(submitResultRequest.getAnswerRequests(), examinationHistory);
        entityManager.refresh(examinationHistory);

        return examinationHistory.getId();
    }

    @Override
    public List<ExaminationHistory> getSolvedExaminationHistories(String email) {
        Users user = userRepository.findByUserId(email)
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_EXCEPTION_MESSAGE, email)));
        return examinationRepository.findByUserIdAndSolvedYnTrueAndDeleteYnFalseOrderByModifiedAtDesc(
                user.getId()
        );
    }
}
