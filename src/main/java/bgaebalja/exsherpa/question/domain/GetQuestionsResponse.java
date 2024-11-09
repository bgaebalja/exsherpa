package bgaebalja.exsherpa.question.domain;

import bgaebalja.exsherpa.examination.domain.GetSolvedQuestionResponse;
import bgaebalja.exsherpa.examination.domain.GetSolvedQuestionsResponse;
import lombok.Getter;

import java.util.ArrayList;
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

    public static GetQuestionsResponse from(
            List<Question> questions, GetSolvedQuestionsResponse cachedSolvedQuestionsResponse
    ) {
        List<GetQuestionResponse> getQuestionResponses = new ArrayList<>();
        for (int i = 0; i < questions.size(); i++) {
            for (
                    GetSolvedQuestionResponse getSolvedQuestionResponse
                    : cachedSolvedQuestionsResponse.getGetSolvedQuestionResponses()
            ) {
                if (questions.get(i).getId().equals(getSolvedQuestionResponse.getQuestionId())) {
                    getQuestionResponses.add(GetQuestionResponse.from(questions.get(i), getSolvedQuestionResponse));
                    break;
                }
            }
        }

        return new GetQuestionsResponse(getQuestionResponses);
    }

    public static GetQuestionsResponse fromExams(List<Question> questions) {
        return new GetQuestionsResponse(
                questions.stream().map(GetQuestionResponse::fromExams).collect(Collectors.toList())
        );
    }

    public int size() {
        return getQuestionResponses.size();
    }

    public GetQuestionResponse get(int index) {
        return getQuestionResponses.get(index);
    }
}
