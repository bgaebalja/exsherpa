package bgaebalja.exsherpa.util;

import bgaebalja.exsherpa.exception.IdNoValueException;
import bgaebalja.exsherpa.exception.InvalidIdException;

import java.util.List;

import static bgaebalja.exsherpa.exception.ExceptionMessage.ID_NO_VALUE_EXCEPTION_MESSAGE;
import static bgaebalja.exsherpa.exception.ExceptionMessage.INVALID_ID_EXCEPTION_MESSAGE;
import static bgaebalja.exsherpa.util.RegularExpressionConstant.POSITIVE_INTEGER_PATTERN;

public class FormatValidator {
    public static void validatePositiveInteger(String positiveOrZeroInteger) {
        if (!hasValue(positiveOrZeroInteger)) {
            throw new IdNoValueException(ID_NO_VALUE_EXCEPTION_MESSAGE);
        }
        if (!isValid(positiveOrZeroInteger, POSITIVE_INTEGER_PATTERN)) {
            throw new InvalidIdException(String.format(INVALID_ID_EXCEPTION_MESSAGE, positiveOrZeroInteger));
        }
    }

    public static boolean hasValue(String value) {
        return value != null && !value.isBlank();
    }

    public static boolean hasValue(Object value) {
        return value != null;
    }

    public static boolean hasValue(String[] value) {
        return value != null && value.length > 0;
    }

    public static boolean hasValue(List value) {
        return value != null && !value.isEmpty();
    }

    private static boolean isValid(String value, String pattern) {
        return value.matches(pattern);
    }
}
