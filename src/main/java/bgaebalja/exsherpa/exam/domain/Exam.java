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

    @Column(name = "exam_name")
    private String examName;

    @Column(name = "total_count")
    private Long totalCount;

    @Column(name = "open_yn")
    private Boolean openYn;

    @Column(name = "exam_type")
    private ExamType examType = ExamType.ALL;

    @OneToMany(mappedBy = "exam", cascade = PERSIST)
    private List<Collection> collections;

    @OneToMany(mappedBy = "exam", cascade = PERSIST)
    private List<ExaminationHistory> examinationHistories;

    public Exam(Users user, String examName, Long totalCount, Boolean openYn, List<Collection> collections) {
        this.user = user;
        this.examName = examName;
        this.totalCount = totalCount;
        this.openYn = openYn;
        this.collections = collections;
    }
}
