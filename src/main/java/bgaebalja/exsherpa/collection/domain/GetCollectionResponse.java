package bgaebalja.exsherpa.collection.domain;

import bgaebalja.exsherpa.passage.domain.GetPassagesResponse;
import bgaebalja.exsherpa.question.domain.GetQuestionsResponse;
import bgaebalja.exsherpa.util.FormatValidator;
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
        GetPassagesResponse getPassagesResponse = null;
        if (FormatValidator.hasValue(collection.getPassages())) {
            getPassagesResponse = GetPassagesResponse.from(collection.getPassages());
        }

        return GetCollectionResponse.builder()
                .getPassagesResponse(getPassagesResponse)
                .getQuestionsResponse(GetQuestionsResponse.from(collection.getQuestions()))
                .build();
    }

    public static GetCollectionResponse fromExams(Collection collection) {
        GetPassagesResponse getPassagesResponse = null;
        if (FormatValidator.hasValue(collection.getPassages())) {
            getPassagesResponse = GetPassagesResponse.fromExams(collection.getPassages());
        }

        return GetCollectionResponse.builder()
                .getPassagesResponse(getPassagesResponse)
                .getQuestionsResponse(GetQuestionsResponse.fromExams(collection.getQuestions()))
                .build();
    }
}
