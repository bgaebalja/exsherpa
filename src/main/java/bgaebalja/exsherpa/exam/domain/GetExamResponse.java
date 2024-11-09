package bgaebalja.exsherpa.exam.domain;

import bgaebalja.exsherpa.collection.domain.Collection;
import bgaebalja.exsherpa.collection.domain.GetCollectionsResponse;
import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import bgaebalja.exsherpa.examination.domain.GetExaminationHistoriesResponse;
import bgaebalja.exsherpa.examination.domain.GetExaminationHistoryResponse;
import bgaebalja.exsherpa.util.FormatConverter;
import bgaebalja.exsherpa.util.FormatValidator;
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
    private boolean isCached;
    private GetCollectionsResponse getCollectionsResponse;
    private GetExaminationHistoriesResponse getExaminationHistoriesResponse;
    private GetExaminationHistoryResponse cachedExaminationHistoryResponse;

    @Builder
    private GetExamResponse(
            Long id, String username, String className, String grade, String examName,
            String subjectName, String timeLimit, int size, boolean isCached,
            GetCollectionsResponse getCollectionsResponse,
            GetExaminationHistoriesResponse getExaminationHistoriesResponse,
            GetExaminationHistoryResponse cachedExaminationHistoryResponse
    ) {
        this.id = id;
        this.username = username;
        this.className = className;
        this.grade = grade;
        this.examName = examName;
        this.subjectName = subjectName;
        this.timeLimit = timeLimit;
        this.size = size;
        this.isCached = isCached;
        this.getCollectionsResponse = getCollectionsResponse;
        this.getExaminationHistoriesResponse = getExaminationHistoriesResponse;
        this.cachedExaminationHistoryResponse = cachedExaminationHistoryResponse;
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

    public static GetExamResponse from(Exam exam, ExaminationHistory examinationHistory) {
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
                .isCached(FormatValidator.hasValue(examinationHistory))
                .getCollectionsResponse(GetCollectionsResponse.from(exam.getCollections()))
                .getExaminationHistoriesResponse(GetExaminationHistoriesResponse.from(exam.getExaminationHistories()))
                .build();
    }

    public static GetExamResponse from(Exam exam, GetExaminationHistoryResponse cachedExaminationHistory) {
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
                .getCollectionsResponse(
                        GetCollectionsResponse.from(exam.getCollections(), cachedExaminationHistory)
                )
                .getExaminationHistoriesResponse(GetExaminationHistoriesResponse.from(exam.getExaminationHistories()))
                .cachedExaminationHistoryResponse(cachedExaminationHistory)
                .build();
    }

    public static GetExamResponse fromExams(Exam exam) {
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
                .getCollectionsResponse(GetCollectionsResponse.fromExams(exam.getCollections()))
                .getExaminationHistoriesResponse(GetExaminationHistoriesResponse.from(exam.getExaminationHistories()))
                .build();
    }

    public void addCacheData(GetExaminationHistoryResponse cachedExaminationHistoryResponse) {
        this.cachedExaminationHistoryResponse = cachedExaminationHistoryResponse;
    }
}
