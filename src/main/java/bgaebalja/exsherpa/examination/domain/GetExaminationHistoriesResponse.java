package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
public class GetExaminationHistoriesResponse {
    private List<GetExaminationHistoryResponse> getExaminationHistoryResponses;

    private GetExaminationHistoriesResponse(List<GetExaminationHistoryResponse> getExaminationHistoryResponses) {
        this.getExaminationHistoryResponses = getExaminationHistoryResponses;
    }

    public static GetExaminationHistoriesResponse from(List<ExaminationHistory> examinationHistories) {
        return new GetExaminationHistoriesResponse(
                examinationHistories.stream().map(GetExaminationHistoryResponse::from).collect(Collectors.toList())
        );
    }
}
