package bgaebalja.exsherpa.examinationhistory.domain;

import bgaebalja.exsherpa.audit.BaseGeneralEntity;
import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.user.domain.Users;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import static bgaebalja.exsherpa.util.EntityConstant.BOOLEAN_DEFAULT_FALSE;
import static javax.persistence.FetchType.LAZY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
public class ExaminationHistory extends BaseGeneralEntity {
    @Column(nullable = false, columnDefinition = BOOLEAN_DEFAULT_FALSE)
    private boolean SolvedYn;

    private short answerCount;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "exam_id")
    private Exam exam;
}
