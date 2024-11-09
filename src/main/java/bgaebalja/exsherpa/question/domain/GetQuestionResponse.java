package bgaebalja.exsherpa.question.domain;

import bgaebalja.exsherpa.examination.domain.GetSolvedQuestionResponse;
import bgaebalja.exsherpa.option.domain.GetOptionsResponse;
import bgaebalja.exsherpa.option.domain.Option;
import bgaebalja.exsherpa.util.ContentExtractor;
import bgaebalja.exsherpa.util.FormatValidator;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
public class GetQuestionResponse {
    private Long id;
    private Long itemId;
    private String content;
    private String url;
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
            Long id, Long itemId, String content, String url, String descriptionUrl, QuestionType questionType,
            GetOptionsResponse getOptionsResponse, Difficulty difficulty, String answer, String answerUrl,
            int errorReportCount, boolean blockYn, Integer placementNumber, String largeChapterCode,
            String largeChapterName, String mediumChapterCode, String mediumChapterName, String smallChapterCode,
            String smallChapterName, String topicChapterCode, String topicChapterName, boolean isSubjective
    ) {
        this.id = id;
        this.itemId = itemId;
        this.content = content;
        this.url = url;
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

        if (FormatValidator.hasValue(html)) {
            ContentExtractor.extractBodyContent(html, totalContent);
        }

        boolean isSubjective = question.getQuestionType().isSubjective();
        GetOptionsResponse getOptionsResponse = null;
        if (!isSubjective) {
            List<Option> options = question.getOptions();
            getOptionsResponse = addOptions(options, getOptionsResponse);
        }

        return GetQuestionResponse.builder()
                .id(question.getId())
                .itemId(question.getItemId())
                .content(totalContent.toString())
                .url(question.getUrl())
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

    public static GetQuestionResponse from(Question question, GetSolvedQuestionResponse cachedSolvedQuestion) {
        String html = question.getHtml();
        StringBuilder totalContent = new StringBuilder();

        if (FormatValidator.hasValue(html)) {
            ContentExtractor.extractBodyContent(html, totalContent, cachedSolvedQuestion.getSubmittedAnswer());
        }

        boolean isSubjective = question.getQuestionType().isSubjective();
        GetOptionsResponse getOptionsResponse = null;
        if (!isSubjective) {
            List<Option> options = question.getOptions();
            getOptionsResponse = addOptions(options, getOptionsResponse);
        }

        return GetQuestionResponse.builder()
                .id(question.getId())
                .itemId(question.getItemId())
                .content(totalContent.toString())
                .url(question.getUrl())
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

    public static GetQuestionResponse fromExams(Question question) {
        return GetQuestionResponse.builder()
                .id(question.getId())
                .itemId(question.getItemId())
                .content("")
                .descriptionUrl(question.getDescriptionUrl())
                .questionType(question.getQuestionType())
                .getOptionsResponse(null)
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
                .isSubjective(false)
                .build();
    }

    private static GetOptionsResponse addOptions(List<Option> options, GetOptionsResponse getOptionsResponse) {
        if (!FormatValidator.hasValue(options)) {
            for (int i = 0; i < 4; i++) {
                getOptionsResponse = GetOptionsResponse.fromNoValue();
            }

            return getOptionsResponse;
        }
        return GetOptionsResponse.from(options);
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
