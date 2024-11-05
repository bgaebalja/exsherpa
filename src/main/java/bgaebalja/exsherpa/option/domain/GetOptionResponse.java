package bgaebalja.exsherpa.option.domain;

import bgaebalja.exsherpa.util.ContentExtractor;
import bgaebalja.exsherpa.util.FormatValidator;
import lombok.Getter;

@Getter
public class GetOptionResponse {
    private String optionNo;
    private String html;

    private GetOptionResponse(String optionNo, String html) {
        this.optionNo = optionNo;
        this.html = html;
    }

    public static GetOptionResponse from(Option option) {
        String html = option.getHtml();
        System.out.println(html + "asdfl;kj");
        StringBuilder totalContent = new StringBuilder();

        if (FormatValidator.hasValue(html)) {
            ContentExtractor.extractBodyContent(html, totalContent);
        }
        System.out.println(totalContent + "abcde");

        return new GetOptionResponse(option.getOptionNo(), totalContent.toString());
    }
}
