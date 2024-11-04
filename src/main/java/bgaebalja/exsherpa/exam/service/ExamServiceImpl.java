package bgaebalja.exsherpa.exam.service;

import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.exam.repository.ExamRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_COMMITTED, readOnly = true, timeout = 20)
public class ExamServiceImpl implements ExamService {
    private final ExamRepository examRepository;

    @Override
    public List<Exam> getPastExams() {
        return examRepository.findByDeleteYnFalseAndOpenYnTrue();
    }

    @Override
    public List<Exam> getBsherpaExams() {
        return examRepository.findByDeleteYnFalseAndOpenYnTrue();
    }
}
