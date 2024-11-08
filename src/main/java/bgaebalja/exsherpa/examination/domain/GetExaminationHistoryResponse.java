package bgaebalja.exsherpa.examination.domain;

import bgaebalja.exsherpa.util.FormatConverter;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class GetExaminationHistoryResponse {
    private String username;
    private String className;
    private String grade;
    private String subjectName;
    private String examName;
    private boolean isSolved;
    private short questionCount;
    private short answerCount;
    private GetSolvedQuestionsResponse getSolvedQuestionsResponse;
    private LocalDateTime modifiedAt;

    @Builder
    private GetExaminationHistoryResponse(
            String username, String className, String grade, String subjectName, String examName,
            boolean isSolved, short questionCount, short answerCount,
            GetSolvedQuestionsResponse getSolvedQuestionsResponse, LocalDateTime modifiedAt
    ) {
        this.username = username;
        this.className = className;
        this.grade = grade;
        this.subjectName = subjectName;
        this.examName = examName;
        this.isSolved = isSolved;
        this.questionCount = questionCount;
        this.answerCount = answerCount;
        this.getSolvedQuestionsResponse = getSolvedQuestionsResponse;
        this.modifiedAt = modifiedAt;
    }

    public static GetExaminationHistoryResponse from(ExaminationHistory examinationHistory) {
        String className = FormatConverter.parseClassName(examinationHistory.getUser().getClazz());
        return GetExaminationHistoryResponse.builder()
                .username(examinationHistory.getUser().getUsername())
                .className(className)
                .grade(examinationHistory.getUser().getGrade())
                .subjectName(examinationHistory.getSubjectName())
                .examName(examinationHistory.getExam().getExamName())
                .isSolved(examinationHistory.isSolvedYn())
                .questionCount(examinationHistory.getQuestionCount())
                .answerCount(examinationHistory.getAnswerCount())
                .getSolvedQuestionsResponse(GetSolvedQuestionsResponse.from(examinationHistory.getSolvedQuestions()))
                .modifiedAt(examinationHistory.getModifiedAt())
                .build();
    }
}
