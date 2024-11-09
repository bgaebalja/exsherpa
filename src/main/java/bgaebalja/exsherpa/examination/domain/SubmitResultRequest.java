package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

import java.util.List;

@Getter
public class SubmitResultRequest {
    private String email;
    private String examId;
    private String isCache;
    private List<AnswerRequest> answerRequests;

    public short size() {
        return (short) answerRequests.size();
    }
}

