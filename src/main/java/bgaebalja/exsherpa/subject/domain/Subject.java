package bgaebalja.exsherpa.subject.domain;

import bgaebalja.exsherpa.audit.BaseEntity;
import bgaebalja.exsherpa.book.domain.Book;
import bgaebalja.exsherpa.clazz.domain.Clazz;
import lombok.Getter;

import javax.persistence.*;
import java.util.List;

import static javax.persistence.CascadeType.PERSIST;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Getter
public class Subject extends BaseEntity {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;

    private String name;

    private String code;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "class_id")
    private Clazz clazz;

    @OneToMany(mappedBy = "subject", cascade = PERSIST)
    private List<Book> books;
}
