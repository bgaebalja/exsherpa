package bgaebalja.exsherpa.examination.domain;

import lombok.Builder;
import lombok.Getter;

@Getter
public class GetSolvedQuestionResponse {
    private Long questionId;
    private short questionNumber;
    private boolean isCorrect;
    private String difficulty;

    @Builder
    private GetSolvedQuestionResponse(Long questionId, short questionNumber, boolean isCorrect, String difficulty) {
        this.questionId = questionId;
        this.questionNumber = questionNumber;
        this.isCorrect = isCorrect;
        this.difficulty = difficulty;
    }

    public static GetSolvedQuestionResponse from(SolvedQuestion solvedQuestion) {
        return GetSolvedQuestionResponse.builder()
                .questionId(solvedQuestion.getQuestion().getId())
                .questionNumber(solvedQuestion.getQuestionNumber())
                .isCorrect(solvedQuestion.isCorrectYn())
                .difficulty(solvedQuestion.getQuestion().getDifficulty().getName())
                .build();
    }
}
