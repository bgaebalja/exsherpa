package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

@Getter
public class GetExaminationHistoryResponse {
    private boolean isSolved;
    private short answerCount;

    private GetExaminationHistoryResponse(boolean isSolved, short answerCount) {
        this.isSolved = isSolved;
        this.answerCount = answerCount;
    }

    public static GetExaminationHistoryResponse from(ExaminationHistory examinationHistory) {
        return new GetExaminationHistoryResponse(examinationHistory.isSolvedYn(), examinationHistory.getAnswerCount());
    }
}
