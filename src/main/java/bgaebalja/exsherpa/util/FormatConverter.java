package bgaebalja.exsherpa.util;

import bgaebalja.exsherpa.exception.*;
import org.springframework.data.domain.Sort;

import static bgaebalja.exsherpa.exception.ExceptionMessage.*;

public class FormatConverter {
    private static final String TRUE = "true";
    private static final String FALSE = "false";

    public static long parseToLong(String number) {
        try {
            return Long.parseLong(number);
        } catch (NumberFormatException nfe) {
            throw new ParsingLongException((String.format(PARSING_LONG_EXCEPTION_MESSAGE, number)));
        }
    }

    public static int parseToInt(String number) {
        try {
            return Integer.parseInt(number);
        } catch (NumberFormatException nfe) {
            throw new ParsingIntegerException((String.format(PARSING_INTEGER_EXCEPTION_MESSAGE, number)));
        }
    }

    public static short parseToShort(String number) throws ParsingShortException {
        try {
            return Short.parseShort(number);
        } catch (NumberFormatException nfe) {
            throw new ParsingShortException((String.format(PARSING_SHORT_EXCEPTION_MESSAGE, number)));
        }
    }

    public static byte parseToByte(String value) {
        try {
            return Byte.parseByte(value);
        } catch (NumberFormatException nfe) {
            throw new ParsingByteException((String.format(PARSING_BYTE_EXCEPTION_MESSAGE, value)));
        }
    }

    public static float parseToFloat(String primeNumber) {
        try {
            return Float.parseFloat(primeNumber);
        } catch (NumberFormatException nfe) {
            throw new ParsingFloatException((String.format(PARSING_FLOAT_EXCEPTION_MESSAGE, primeNumber)));
        }
    }

    public static boolean parseToBoolean(String value) {
        if (!value.equals(TRUE) && !value.equals(FALSE)) {
            throw new ParsingBooleanException((String.format(PARSING_BOOLEAN_EXCEPTION_MESSAGE, value)));
        }

        return Boolean.parseBoolean(value);
    }

    public static String sanitizeFileName(String filename) {
        return filename.replaceAll("\\s+", "-")
                .replaceAll("[^a-zA-Z0-9._-]", "");
    }

    public static String parseClassName(String clazz) {
        if (clazz.equals("elementary")) {
            return "초등";
        }
        if (clazz.equals("middle")) {
            return "중";
        }

        return "고등";
    }

    public static Sort parseSortString(String sort) {
        String[] parts = sort.split(",");
        return Sort.by(Sort.Direction.fromString(parts[1]), parts[0]);
    }
}
