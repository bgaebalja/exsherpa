package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

@Getter
public class GetSolvedQuestionResponse {
    private Long questionId;
    private short questionNumber;
    private boolean isCorrect;

    private GetSolvedQuestionResponse(Long questionId, short questionNumber, boolean isCorrect) {
        this.questionId = questionId;
        this.questionNumber = questionNumber;
        this.isCorrect = isCorrect;
    }

    public static GetSolvedQuestionResponse from(SolvedQuestion solvedQuestion) {
        return new GetSolvedQuestionResponse(
                solvedQuestion.getQuestion().getId(), solvedQuestion.getQuestionNumber(), solvedQuestion.isCorrectYn()
        );
    }
}
