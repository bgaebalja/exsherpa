package bgaebalja.exsherpa.clazz.domain;

import bgaebalja.exsherpa.audit.BaseEntity;
import lombok.Getter;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "class")
@Getter
public class Clazz extends BaseEntity {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String name;

}
