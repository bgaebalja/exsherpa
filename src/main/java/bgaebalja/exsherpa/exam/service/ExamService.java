package bgaebalja.exsherpa.exam.service;

import bgaebalja.exsherpa.exam.domain.Exam;

import java.util.List;

public interface ExamService {
    List<Exam> getPastExams();

    List<Exam> getBsherpaExams();
}
