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
}
