package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

@Getter
public class ExamInformationResponse {
    private final String schoolLevel;
    private final String examRound;
    private final String year;
    private final String examId;

    private ExamInformationResponse(String schoolLevel, String examRound, String year) {
        this.schoolLevel = schoolLevel;
        this.examRound = examRound;
        this.year = year;
        examId = "1";
    }

    private ExamInformationResponse(String schoolLevel, String examRound, String year, String examId) {
        this.schoolLevel = schoolLevel;
        this.examRound = examRound;
        this.year = year;
        this.examId = examId;
    }

    public static ExamInformationResponse of(String schoolLevel, String examRound, String year) {
        return new ExamInformationResponse(schoolLevel, examRound, year);
    }

    public static ExamInformationResponse of(String schoolLevel, String examRound, String year, String examId) {
        return new ExamInformationResponse(schoolLevel, examRound, year, examId);
    }
}
