package bgaebalja.exsherpa.examination.domain;

import bgaebalja.exsherpa.audit.BaseGeneralEntity;
import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.user.domain.Users;
import bgaebalja.exsherpa.util.MathComputer;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.util.List;

import static bgaebalja.exsherpa.util.EntityConstant.BOOLEAN_DEFAULT_FALSE;
import static javax.persistence.CascadeType.*;
import static javax.persistence.FetchType.LAZY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
@Getter
public class ExaminationHistory extends BaseGeneralEntity {
    @Column(nullable = false, length = 20)
    private String subjectName;

    @Column(nullable = false, columnDefinition = BOOLEAN_DEFAULT_FALSE)
    private boolean solvedYn;

    @Column(nullable = false)
    private short questionCount;

    private short answerCount;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "exam_id")
    private Exam exam;

    @OneToMany(mappedBy = "examinationHistory", cascade = {PERSIST, MERGE, REMOVE}, fetch = FetchType.LAZY)
    @JsonManagedReference
    private List<SolvedQuestion> solvedQuestions;

    @Builder
    private ExaminationHistory(
            String subjectName, boolean solvedYn, short questionCount, short answerCount, Users user, Exam exam
    ) {
        this.subjectName = subjectName;
        this.user = user;
        this.exam = exam;
        this.solvedYn = solvedYn;
        this.questionCount = questionCount;
        this.answerCount = answerCount;
    }

    public static ExaminationHistory from(SubmitResultRequest submitResultRequest, Users user, Exam exam) {
        return ExaminationHistory.builder()
                .subjectName(exam.getBook().getSubject().getName())
                .solvedYn(true)
                .questionCount(submitResultRequest.size())
                .answerCount(MathComputer.computeAnswerCount(submitResultRequest.getAnswerRequests()))
                .user(user)
                .exam(exam)
                .build();
    }

    @PostLoad
    private void init() {
        Hibernate.initialize(solvedQuestions);
    }

    public void addSolvedQuestions(List<SolvedQuestion> solvedQuestions) {
        this.solvedQuestions = solvedQuestions;
    }
}
