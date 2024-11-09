package bgaebalja.exsherpa.exam.service;

import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.exam.exception.ExamNotFoundException;
import bgaebalja.exsherpa.exam.repository.ExamRepository;
import bgaebalja.exsherpa.user.domain.Users;
import bgaebalja.exsherpa.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static bgaebalja.exsherpa.exam.exception.ExceptionMessage.EXAM_NOT_FOUND_EXCEPTION_MESSAGE;
import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_COMMITTED, readOnly = true, timeout = 20)
public class ExamServiceImpl implements ExamService {
    private final ExamRepository examRepository;
    private final UserRepository userRepository;

    @Override
    public List<Exam> getPastExams(String email) {
        Users user = userRepository.getUserWithRoles(email);

        return examRepository.findByUserIdAndCustomYnFalseAndDeleteYnFalseAndOpenYnTrue(user.getId());
    }

    @Override
    public List<Exam> getBsherpaExams(String email) {
        Users user = userRepository.getUserWithRoles(email);

        return examRepository.findByUserIdAndCustomYnTrueAndDeleteYnFalseAndOpenYnTrue(user.getId());
    }

    @Override
    public Exam getExam(Long examId) {
        return examRepository.findByIdAndDeleteYnFalse(examId)
                .orElseThrow(() -> new ExamNotFoundException(String.format(EXAM_NOT_FOUND_EXCEPTION_MESSAGE, examId)));
    }
}
