package bgaebalja.exsherpa.exam.passage.domain;

import bgaebalja.exsherpa.audit.BaseGeneralEntity;
import bgaebalja.exsherpa.collection.domain.Collection;
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
public class Passage extends BaseGeneralEntity {
    @Column(nullable = false)
    private Long passageId;

    @Column(nullable = false)
    private String html;

    @Column(nullable = false)
    private String url;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "collection_id")
    private Collection collection;

    @Builder
    private Passage(Long passageId, String html, String url, Collection collection) {
        this.passageId = passageId;
        this.html = html;
        this.url = url;
        this.collection = collection;
    }
}
