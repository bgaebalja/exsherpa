package bgaebalja.exsherpa.passage.domain;

import lombok.Getter;

@Getter
public class GetPassageResponse {
    private Long id;
    private Long passageId;
    private String html;
    private String url;

    private GetPassageResponse(Long id, Long passageId, String html, String url) {
        this.id = id;
        this.passageId = passageId;
        this.html = html;
        this.url = url;
    }

    public static GetPassageResponse from(Passage passage) {
        return new GetPassageResponse(passage.getId(), passage.getPassageId(), passage.getHtml(), passage.getUrl());
    }

    public static GetPassageResponse fromExams(Passage passage) {
        return new GetPassageResponse(passage.getId(), passage.getPassageId(), "", passage.getUrl());
    }
}
