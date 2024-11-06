package bgaebalja.exsherpa.util;

import bgaebalja.exsherpa.examination.domain.AnswerRequest;

import java.util.List;

public class CountComputer {
    public static short computeAnswerCount(List<AnswerRequest> answerRequests) {
        short count = 0;
        for (AnswerRequest answerRequest : answerRequests) {
            if (answerRequest.getSubmittedAnswer().equals(answerRequest.getOriginalAnswer())) {
                ++count;
            }
        }

        return count;
    }
}
