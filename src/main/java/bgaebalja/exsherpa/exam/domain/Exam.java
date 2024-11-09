package bgaebalja.exsherpa.exam.domain;

import bgaebalja.exsherpa.audit.BaseGeneralEntity;
import bgaebalja.exsherpa.book.domain.Book;
import bgaebalja.exsherpa.collection.domain.Collection;
import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import bgaebalja.exsherpa.user.domain.Users;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

import static bgaebalja.exsherpa.util.EntityConstant.BOOLEAN_DEFAULT_FALSE;
import static javax.persistence.CascadeType.PERSIST;
import static javax.persistence.FetchType.LAZY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
@Getter
public class Exam extends BaseGeneralEntity {
    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "book_id")
    private Book book;

    @Column(nullable = false)
    private String examName;

    private Long totalCount;

    @Column(nullable = false, columnDefinition = BOOLEAN_DEFAULT_FALSE)
    private boolean customYn;

    @Column(nullable = false, columnDefinition = BOOLEAN_DEFAULT_FALSE)
    private boolean openYn;

    @OneToMany(mappedBy = "exam", cascade = PERSIST)
    private List<Collection> collections;

    @OneToMany(mappedBy = "exam", cascade = PERSIST)
    private List<ExaminationHistory> examinationHistories;

    public void addStatus() {
    }
}
