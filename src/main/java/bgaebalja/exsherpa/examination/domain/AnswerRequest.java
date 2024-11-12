package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

@Getter
public class AnswerRequest {
    private String questionId;
    private String questionNumber;
    private String isSubjective;
    private String submittedAnswer;
    private String originalAnswer;
}
