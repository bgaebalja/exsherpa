package bgaebalja.exsherpa.question.domain;

import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
public class GetQuestionsResponse {
    private final List<GetQuestionResponse> getQuestionResponses;

    private GetQuestionsResponse(List<GetQuestionResponse> getQuestionResponses) {
        this.getQuestionResponses = getQuestionResponses;
    }

    public static GetQuestionsResponse from(List<Question> questions) {
        return new GetQuestionsResponse(
                questions.stream().map(GetQuestionResponse::from).collect(Collectors.toList())
        );
    }

    public int size() {
        return getQuestionResponses.size();
    }

    public GetQuestionResponse get(int index) {
        return getQuestionResponses.get(index);
    }
}
