package bgaebalja.exsherpa.examination.domain;

import bgaebalja.exsherpa.exam.domain.Exam;
import lombok.Builder;
import lombok.Getter;
import org.springframework.data.domain.Page;

@Getter
public class PageInformation {
    private Long totalElements;
    private int totalPages;
    private int size;
    private int pageNumber;
    private boolean isFirst;
    private boolean isLast;

    @Builder
    private PageInformation(
            Long totalElements, int totalPages, int size, int pageNumber, boolean isFirst, boolean isLast
    ) {
        this.totalElements = totalElements;
        this.totalPages = totalPages;
        this.size = size;
        this.pageNumber = pageNumber;
        this.isFirst = isFirst;
        this.isLast = isLast;
    }

    public static PageInformation from(Page<Exam> pagedExams) {
        return PageInformation.builder()
                .totalElements(pagedExams.getTotalElements())
                .totalPages(pagedExams.getTotalPages())
                .size(pagedExams.getSize())
                .pageNumber(pagedExams.getNumber())
                .isFirst(pagedExams.isFirst())
                .isLast(pagedExams.isLast())
                .build();
    }
}
