package bgaebalja.exsherpa.util;

public class ContentExtractor {
    public static void extractBodyContent(String html, StringBuilder totalContent) {
        String startTag = "<body>";
        String endTag = "</body>";

        int startIndex = html.indexOf(startTag);
        int endIndex = html.lastIndexOf(endTag);

        if (startIndex != -1 && endIndex != -1) {
            String bodyContent = html.substring(startIndex + startTag.length(), endIndex);
            totalContent.append(bodyContent.trim()).append("\n");
        }
    }

    public static String createOption(int index) {
        return "<div class=\"paragraph\" style=\"border-left:0.2mm none;border-right:0.2mm none;border-top:0.2mm none;border-bottom:0.2mm none;text-indent: 0px;margin-left: 0px;margin-right: 0px;\">\n" +
                "   <span class=\"txt \"></span><span class=\"txt \">" + index + "번 선택</span>\n" +
                "  </div>";
    }
}
