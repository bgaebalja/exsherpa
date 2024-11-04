package bgaebalja.exsherpa.collection.domain;

import bgaebalja.exsherpa.exam.passage.domain.GetPassagesResponse;
import bgaebalja.exsherpa.question.domain.GetQuestionsResponse;
import lombok.Builder;
import lombok.Getter;

@Getter
public class GetCollectionResponse {
    private GetPassagesResponse getPassagesResponse;
    private GetQuestionsResponse getQuestionsResponse;

    @Builder
    private GetCollectionResponse(GetPassagesResponse getPassagesResponse, GetQuestionsResponse getQuestionsResponse) {
        this.getPassagesResponse = getPassagesResponse;
        this.getQuestionsResponse = getQuestionsResponse;
    }

    public static GetCollectionResponse from(Collection collection) {
        return GetCollectionResponse.builder()
                .getPassagesResponse(GetPassagesResponse.from(collection.getPassages()))
                .getQuestionsResponse(GetQuestionsResponse.from(collection.getQuestions()))
                .build();
    }
}
