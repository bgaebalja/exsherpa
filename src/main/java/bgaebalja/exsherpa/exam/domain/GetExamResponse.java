package bgaebalja.exsherpa.exam.domain;

import bgaebalja.exsherpa.collection.domain.Collection;
import bgaebalja.exsherpa.collection.domain.GetCollectionsResponse;
import bgaebalja.exsherpa.examination.domain.GetExaminationHistoriesResponse;
import bgaebalja.exsherpa.util.FormatConverter;
import bgaebalja.exsherpa.util.TimeSelector;
import lombok.Builder;
import lombok.Getter;

@Getter
public class GetExamResponse {
    private Long id;
    private String username;
    private String className;
    private String grade;
    private String examName;
    private String subjectName;
    private String timeLimit;
    private int size;
    private GetCollectionsResponse getCollectionsResponse;
    private GetExaminationHistoriesResponse getExaminationHistoriesResponse;

    @Builder
    private GetExamResponse(
            Long id, String username, String className, String grade, String examName,
            String subjectName, String timeLimit, int size, GetCollectionsResponse getCollectionsResponse,
            GetExaminationHistoriesResponse getExaminationHistoriesResponse
    ) {
        this.id = id;
        this.username = username;
        this.className = className;
        this.grade = grade;
        this.examName = examName;
        this.subjectName = subjectName;
        this.timeLimit = timeLimit;
        this.size = size;
        this.getCollectionsResponse = getCollectionsResponse;
        this.getExaminationHistoriesResponse = getExaminationHistoriesResponse;
    }

    public static GetExamResponse from(Exam exam) {
        String className = FormatConverter.parseClassName(exam.getUser().getClazz());
        String timeLimit = TimeSelector.selectTimeLimit(exam);

        return GetExamResponse.builder()
                .id(exam.getId())
                .username(exam.getUser().getUsername())
                .className(className)
                .grade(exam.getUser().getGrade())
                .examName(exam.getExamName())
                .subjectName(exam.getBook().getSubject().getName())
                .timeLimit(timeLimit)
                .size(exam.getCollections().stream().map(Collection::getQuestionCount).reduce(0, Integer::sum))
                .getCollectionsResponse(GetCollectionsResponse.from(exam.getCollections()))
                .getExaminationHistoriesResponse(GetExaminationHistoriesResponse.from(exam.getExaminationHistories()))
                .build();
    }
}
