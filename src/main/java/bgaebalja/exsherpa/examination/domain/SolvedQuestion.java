package bgaebalja.exsherpa.examination.domain;

import bgaebalja.exsherpa.audit.BaseGeneralEntity;
import bgaebalja.exsherpa.question.domain.Question;
import bgaebalja.exsherpa.util.FormatConverter;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import static javax.persistence.FetchType.LAZY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
public class SolvedQuestion extends BaseGeneralEntity {
    private boolean subjective_yn;
    private byte selectedOption;
    private boolean correct_yn;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "question_id")
    private Question question;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "examination_id")
    private ExaminationHistory examinationHistory;

    @Builder
    private SolvedQuestion(
            boolean subjective_yn, byte selectedOption, boolean correct_yn,
            Question question, ExaminationHistory examinationHistory
    ) {
        this.subjective_yn = subjective_yn;
        this.selectedOption = selectedOption;
        this.correct_yn = correct_yn;
        this.question = question;
        this.examinationHistory = examinationHistory;
    }

    public static SolvedQuestion from(
            AnswerRequest answerRequest, Question question, ExaminationHistory examinationHistory
    ) {
        boolean isSubjective = FormatConverter.parseToBoolean(answerRequest.getIsSubjective());
        String submittedAnswer = answerRequest.getSubmittedAnswer();
        byte selectedOption = -1;
        if (!isSubjective && !submittedAnswer.equals("미응답")) {
            selectedOption = FormatConverter.parseToByte(answerRequest.getSubmittedAnswer());
        }

        return SolvedQuestion.builder()
                .subjective_yn(FormatConverter.parseToBoolean(answerRequest.getIsSubjective()))
                .selectedOption(selectedOption)
                .correct_yn(answerRequest.getSubmittedAnswer().equals(answerRequest.getOriginalAnswer()))
                .question(question)
                .examinationHistory(examinationHistory)
                .build();
    }
}
