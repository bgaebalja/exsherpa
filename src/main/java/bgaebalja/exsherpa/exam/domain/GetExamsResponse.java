package bgaebalja.exsherpa.exam.domain;

import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
public class GetExamsResponse {
    private List<GetExamResponse> getExamResponses;

    private GetExamsResponse(List<GetExamResponse> getExamResponses) {
        this.getExamResponses = getExamResponses;
    }

    public static GetExamsResponse from(List<Exam> exams) {
        return new GetExamsResponse(exams.stream().map(GetExamResponse::fromExams).collect(Collectors.toList()));
    }

    public static GetExamsResponse of(List<GetExamResponse> getExamResponses) {
        return new GetExamsResponse(getExamResponses);
    }

    public int size() {
        return getExamResponses.size();
    }

    public GetExamResponse get(int index) {
        return getExamResponses.get(index);
    }
}
