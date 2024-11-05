package bgaebalja.exsherpa.question.domain;

import bgaebalja.exsherpa.option.domain.GetOptionsResponse;
import bgaebalja.exsherpa.util.ContentExtractor;
import bgaebalja.exsherpa.util.FormatValidator;
import lombok.Builder;
import lombok.Getter;

@Getter
public class GetQuestionResponse {
    private Long itemId;
    private String content;
    private String descriptionUrl;
    private QuestionType questionType;
    private GetOptionsResponse getOptionsResponse;
    private Difficulty difficulty;
    private String answer;
    private String answerUrl;
    private int errorReportCount;
    private boolean blockYn;
    private Integer placementNumber;
    private String largeChapterCode;
    private String largeChapterName;
    private String mediumChapterCode;
    private String mediumChapterName;
    private String smallChapterCode;
    private String smallChapterName;
    private String topicChapterCode;
    private String topicChapterName;
    private boolean isSubjective;

    @Builder
    private GetQuestionResponse(
            Long itemId, String content, String descriptionUrl, QuestionType questionType,
            GetOptionsResponse getOptionsResponse, Difficulty difficulty, String answer, String answerUrl,
            int errorReportCount, boolean blockYn, Integer placementNumber, String largeChapterCode,
            String largeChapterName, String mediumChapterCode, String mediumChapterName, String smallChapterCode,
            String smallChapterName, String topicChapterCode, String topicChapterName, boolean isSubjective
    ) {
        this.itemId = itemId;
        this.content = content;
        this.descriptionUrl = descriptionUrl;
        this.questionType = questionType;
        this.getOptionsResponse = getOptionsResponse;
        this.difficulty = difficulty;
        this.answer = answer;
        this.answerUrl = answerUrl;
        this.errorReportCount = errorReportCount;
        this.blockYn = blockYn;
        this.placementNumber = placementNumber;
        this.largeChapterCode = largeChapterCode;
        this.largeChapterName = largeChapterName;
        this.mediumChapterCode = mediumChapterCode;
        this.mediumChapterName = mediumChapterName;
        this.smallChapterCode = smallChapterCode;
        this.smallChapterName = smallChapterName;
        this.topicChapterCode = topicChapterCode;
        this.topicChapterName = topicChapterName;
        this.isSubjective = isSubjective;
    }

    public static GetQuestionResponse from(Question question) {
        String html = question.getHtml();
        StringBuilder totalContent = new StringBuilder();
        System.out.println(html + "asdfl;kj");

        if (FormatValidator.hasValue(html)) {
            ContentExtractor.extractBodyContent(html, totalContent);
        }

        boolean isSubjective = question.getQuestionType().isSubjective();
        GetOptionsResponse getOptionsResponse = null;
        if (!isSubjective) {
            getOptionsResponse = GetOptionsResponse.from(question.getOptions());
        }
        System.out.println(totalContent + "abcde");

        return GetQuestionResponse.builder()
                .itemId(question.getItemId())
                .content(totalContent.toString())
                .descriptionUrl(question.getDescriptionUrl())
                .questionType(question.getQuestionType())
                .getOptionsResponse(getOptionsResponse)
                .difficulty(question.getDifficulty())
                .answer(question.getAnswer())
                .answerUrl(question.getAnswerUrl())
                .errorReportCount(question.getErrorReportCount())
                .blockYn(question.isBlockYn())
                .placementNumber(question.getPlacementNumber())
                .largeChapterCode(question.getLargeChapterCode())
                .largeChapterName(question.getLargeChapterName())
                .mediumChapterCode(question.getMediumChapterCode())
                .smallChapterCode(question.getSmallChapterCode())
                .topicChapterCode(question.getTopicChapterCode())
                .isSubjective(isSubjective)
                .build();
    }

    private static void extractContent(String html, StringBuilder totalContent) {
        String[] contents = html.split("<span class=\"txt \">");
        for (String content : contents) {
            String[] splitContents = content.split("</span>");
            addContent(splitContents, totalContent);
        }
    }

    private static void addContent(String[] splitContents, StringBuilder totalContent) {
        if (FormatValidator.hasValue(splitContents)) {
            String[] contents = splitContents[0].split(">");
            totalContent.append(contents[contents.length - 1]);
        }
    }
}
