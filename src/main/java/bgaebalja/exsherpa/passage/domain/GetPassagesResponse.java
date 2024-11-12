package bgaebalja.exsherpa.passage.domain;

import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
public class GetPassagesResponse {
    private final List<GetPassageResponse> getPassageResponses;

    private GetPassagesResponse(List<GetPassageResponse> getPassageResponses) {
        this.getPassageResponses = getPassageResponses;
    }

    public static GetPassagesResponse from(List<Passage> passages) {
        return new GetPassagesResponse(
                passages.stream().map(GetPassageResponse::from).collect(Collectors.toList())
        );
    }

    public static GetPassagesResponse fromExams(List<Passage> passages) {
        return new GetPassagesResponse(
                passages.stream().map(GetPassageResponse::fromExams).collect(Collectors.toList())
        );
    }

    public int size() {
        return getPassageResponses.size();
    }

    public GetPassageResponse get(int index) {
        return getPassageResponses.get(index);
    }
}
