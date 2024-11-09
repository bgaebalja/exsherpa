package bgaebalja.exsherpa.examination.domain;

import lombok.Builder;
import lombok.Getter;

@Getter
public class GetSolvedQuestionResponse {
    private Long id;
    private Long questionId;
    private short questionNumber;
    private boolean isCorrect;
    private String difficulty;
    private String smallChapterName;
    private String topicChapterName;
    private String submittedAnswer;
    private String questionType;

    @Builder
    private GetSolvedQuestionResponse(
            Long id, Long questionId, short questionNumber, boolean isCorrect, String difficulty,
            String smallChapterName, String topicChapterName, String submittedAnswer, String questionType
    ) {
        this.id = id;
        this.questionId = questionId;
        this.questionNumber = questionNumber;
        this.isCorrect = isCorrect;
        this.difficulty = difficulty;
        this.smallChapterName = smallChapterName;
        this.topicChapterName = topicChapterName;
        this.submittedAnswer = submittedAnswer;
        this.questionType = questionType;
    }

    public static GetSolvedQuestionResponse from(SolvedQuestion solvedQuestion) {
        return GetSolvedQuestionResponse.builder()
                .id(solvedQuestion.getId())
                .questionId(solvedQuestion.getQuestion().getId())
                .questionNumber(solvedQuestion.getQuestionNumber())
                .isCorrect(solvedQuestion.isCorrectYn())
                .difficulty(solvedQuestion.getQuestion().getDifficulty().getName())
                .smallChapterName(solvedQuestion.getQuestion().getSmallChapterName())
                .topicChapterName(solvedQuestion.getQuestion().getTopicChapterName())
                .submittedAnswer(solvedQuestion.getSubmittedAnswer())
                .questionType(solvedQuestion.getQuestion().getQuestionType().getName())
                .build();
    }
}
