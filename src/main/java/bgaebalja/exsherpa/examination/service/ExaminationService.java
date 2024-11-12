package bgaebalja.exsherpa.examination.service;

import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import bgaebalja.exsherpa.examination.domain.SubmitResultRequest;

import java.util.List;

public interface ExaminationService {
    int registerResult(SubmitResultRequest submitResultRequest);

    ExaminationHistory registerCacheData(SubmitResultRequest submitResultRequest);

    ExaminationHistory getCachedExaminationHistory(String email, Long examId);

    List<ExaminationHistory> getSolvedExaminationHistories();

    List<ExaminationHistory> getSolvedExaminationHistories(String email);

    List<ExaminationHistory> getSolvedExaminationHistoriesFromExam(Long examId);

    List<ExaminationHistory> getSolvedExaminationHistoriesFromExam(Long examId, String email);
}
