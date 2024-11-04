package bgaebalja.exsherpa.collection.domain;

import bgaebalja.exsherpa.audit.BaseGeneralEntity;
import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.exam.passage.domain.Passage;
import bgaebalja.exsherpa.question.domain.Question;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.List;

import static javax.persistence.FetchType.LAZY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
@Getter
public class Collection extends BaseGeneralEntity {
    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "exam_id")
    private Exam exam;

    @OneToMany(mappedBy = "collection")
    private List<Question> questions;

    @OneToMany(mappedBy = "collection")
    private List<Passage> passages;

    @Builder
    private Collection(Exam exam, List<Question> questions, List<Passage> passages) {
        this.exam = exam;
        this.questions = questions;
        this.passages = passages;
    }
}
