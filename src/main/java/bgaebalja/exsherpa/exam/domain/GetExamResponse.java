package bgaebalja.exsherpa.exam.domain;

import bgaebalja.exsherpa.collection.domain.GetCollectionsResponse;
import bgaebalja.exsherpa.examination.domain.GetExaminationHistoriesResponse;
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
    private GetCollectionsResponse getCollectionsResponse;
    private GetExaminationHistoriesResponse getExaminationHistoriesResponse;

    @Builder
    private GetExamResponse(
            Long id, String username, String className, String grade, String examName,
            String subjectName, String timeLimit, GetCollectionsResponse getCollectionsResponse,
            GetExaminationHistoriesResponse getExaminationHistoriesResponse
    ) {
        this.id = id;
        this.username = username;
        this.className = className;
        this.grade = grade;
        this.examName = examName;
        this.subjectName = subjectName;
        this.timeLimit = timeLimit;
        this.getCollectionsResponse = getCollectionsResponse;
        this.getExaminationHistoriesResponse = getExaminationHistoriesResponse;
    }

    public static GetExamResponse from(Exam exam) {
        // TODO: 시간 제한 학년/과목 별로 연동
        // TODO: 회원에 추가되는 학교 등급과 학년 정보 연동
        return GetExamResponse.builder()
                .id(exam.getId())
                .username(exam.getUser().getUsername())
//                .className(exam.getUser().getClassName())
//                .grade(exam.getUser().getGrade())
                .className("중")
                .grade("3")
                .examName(exam.getExamName())
                .subjectName(exam.getBook().getSubject().getName())
                .timeLimit("60")
                .getCollectionsResponse(GetCollectionsResponse.from(exam.getCollections()))
                .getExaminationHistoriesResponse(GetExaminationHistoriesResponse.from(exam.getExaminationHistories()))
                .build();
    }
}
