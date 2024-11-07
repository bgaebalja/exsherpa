package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
public class GetSolvedQuestionsResponse {
    private List<GetSolvedQuestionResponse> getSolvedQuestionResponses;

    private GetSolvedQuestionsResponse(List<GetSolvedQuestionResponse> getSolvedQuestionResponses) {
        this.getSolvedQuestionResponses = getSolvedQuestionResponses;
    }

    public static GetSolvedQuestionsResponse from(List<SolvedQuestion> solvedQuestions) {
        return new GetSolvedQuestionsResponse(
                solvedQuestions.stream().map(GetSolvedQuestionResponse::from).collect(Collectors.toList())
        );
    }

    public int size() {
        return getSolvedQuestionResponses.size();
    }

    public GetSolvedQuestionResponse get(int index) {
        return getSolvedQuestionResponses.get(index);
    }
}
