package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

import java.util.List;

@Getter
public class SubmitResultRequest {
    private List<AnswerRequest> answerRequests;
}

