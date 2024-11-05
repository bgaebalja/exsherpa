package bgaebalja.exsherpa.util;

public class ContentExtractor {
    public static void extractBodyContent(String html, StringBuilder totalContent) {
        String startTag = "<body>";
        String endTag = "</body>";

        int startIndex = html.indexOf(startTag);
        int endIndex = html.lastIndexOf(endTag);

        if (startIndex != -1 && endIndex != -1) {
            String bodyContent = html.substring(startIndex + startTag.length(), endIndex);

            String[] divContents = bodyContent.split("(?=<div[^>]*>)");
            for (String divContent : divContents) {
                if (divContent.contains("class=\"paragraph\"")) {
                    int divEndIndex = divContent.indexOf("</div>");
                    if (divEndIndex != -1) {
                        String completeDiv = divContent.substring(0, divEndIndex + "</div>".length());
                        totalContent.append(completeDiv.trim()).append("<br />");
                    }
                }
            }
        }
    }
}
