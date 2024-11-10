package bgaebalja.exsherpa.exam.service;

import bgaebalja.exsherpa.exam.domain.Exam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ExamService {
    Page<Exam> getPastExams(Pageable pageable, String subjectName);

    Page<Exam> getBsherpaExams(Pageable pageable, String email, boolean isMine);

    Exam getExam(Long examId);
}
