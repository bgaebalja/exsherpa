package bgaebalja.exsherpa.solvedquestion.service;

import bgaebalja.exsherpa.examination.domain.AnswerRequest;
import bgaebalja.exsherpa.examination.domain.ExaminationHistory;

import java.util.List;

public interface SolvedQuestionService {
    void registerSolvedQuestions(List<AnswerRequest> answerRequests, ExaminationHistory examinationHistory);
}
