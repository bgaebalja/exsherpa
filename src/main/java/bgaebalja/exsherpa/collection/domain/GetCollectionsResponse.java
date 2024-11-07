package bgaebalja.exsherpa.collection.domain;

import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
public class GetCollectionsResponse {
    private final List<GetCollectionResponse> getCollectionResponses;

    private GetCollectionsResponse(List<GetCollectionResponse> getCollectionResponses) {
        this.getCollectionResponses = getCollectionResponses;
    }

    public static GetCollectionsResponse from(List<Collection> collections) {
        return new GetCollectionsResponse(
                collections.stream().map(GetCollectionResponse::from).collect(Collectors.toList())
        );
    }

    public static GetCollectionsResponse fromExams(List<Collection> collections) {
        return new GetCollectionsResponse(
                collections.stream().map(GetCollectionResponse::fromExams).collect(Collectors.toList())
        );
    }

    public int size() {
        return getCollectionResponses.size();
    }

    public GetCollectionResponse get(int index) {
        return getCollectionResponses.get(index);
    }
}
