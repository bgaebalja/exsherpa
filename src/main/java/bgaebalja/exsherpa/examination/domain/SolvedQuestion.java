package bgaebalja.exsherpa.examination.domain;

import bgaebalja.exsherpa.audit.BaseGeneralEntity;
import bgaebalja.exsherpa.question.domain.Question;
import bgaebalja.exsherpa.util.FormatConverter;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import static javax.persistence.FetchType.LAZY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
@Getter
public class SolvedQuestion extends BaseGeneralEntity {
    @Column(nullable = false)
    private short questionNumber;

    @Column(nullable = false)
    private boolean subjectiveYn;
    private byte selectedOption;
    private boolean correctYn;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "question_id")
    private Question question;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "examination_id")
    private ExaminationHistory examinationHistory;

    @Builder
    private SolvedQuestion(
            short questionNumber, boolean subjectiveYn, byte selectedOption, boolean correctYn,
            Question question, ExaminationHistory examinationHistory
    ) {
        this.questionNumber = questionNumber;
        this.subjectiveYn = subjectiveYn;
        this.selectedOption = selectedOption;
        this.correctYn = correctYn;
        this.question = question;
        this.examinationHistory = examinationHistory;
    }

    public static SolvedQuestion from(
            short questionNumber, AnswerRequest answerRequest, Question question, ExaminationHistory examinationHistory
    ) {
        boolean isSubjective = FormatConverter.parseToBoolean(answerRequest.getIsSubjective());
        String submittedAnswer = answerRequest.getSubmittedAnswer();
        byte selectedOption = -1;
        if (!isSubjective && !submittedAnswer.equals("미응답")) {
            selectedOption = FormatConverter.parseToByte(answerRequest.getSubmittedAnswer());
        }

        return SolvedQuestion.builder()
                .questionNumber(questionNumber)
                .subjectiveYn(FormatConverter.parseToBoolean(answerRequest.getIsSubjective()))
                .selectedOption(selectedOption)
                .correctYn(answerRequest.getSubmittedAnswer().equals(answerRequest.getOriginalAnswer()))
                .question(question)
                .examinationHistory(examinationHistory)
                .build();
    }
}
