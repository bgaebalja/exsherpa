package bgaebalja.exsherpa.option.domain;

import lombok.Getter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
public class GetOptionsResponse {
    private List<GetOptionResponse> getOptiosResponses;

    private GetOptionsResponse(List<GetOptionResponse> getOptiosResponses) {
        this.getOptiosResponses = getOptiosResponses;
    }

    public static GetOptionsResponse from(List<Option> options) {
        return new GetOptionsResponse(options.stream().map(GetOptionResponse::from).collect(Collectors.toList()));
    }

    public static GetOptionsResponse fromNoValue() {
        List<GetOptionResponse> getOptiosResponses = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            getOptiosResponses.add(GetOptionResponse.fromNoValue(i));
        }
        return new GetOptionsResponse(getOptiosResponses);
    }

    public int size() {
        return getOptiosResponses.size();
    }

    public GetOptionResponse get(int index) {
        return getOptiosResponses.get(index);
    }
}
