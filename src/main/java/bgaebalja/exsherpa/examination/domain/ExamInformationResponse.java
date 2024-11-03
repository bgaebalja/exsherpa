package bgaebalja.exsherpa.examination.domain;

import lombok.Getter;

@Getter
public class ExamInformationResponse {
    private final String schoolLevel;
    private final String examRound;
    private final String year;
    private final Long examId;

    private ExamInformationResponse(String schoolLevel, String examRound, String year) {
        this.schoolLevel = schoolLevel;
        this.examRound = examRound;
        this.year = year;
        examId = 1L;
    }

    public static ExamInformationResponse of(String schoolLevel, String examRound, String year) {
        return new ExamInformationResponse(schoolLevel, examRound, year);
    }
}
