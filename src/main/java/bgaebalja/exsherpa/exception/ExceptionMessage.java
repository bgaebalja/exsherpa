package bgaebalja.exsherpa.exception;

public class ExceptionMessage {
    public static final String PARSING_LONG_EXCEPTION_MESSAGE
            = "숫자값만 Long 타입으로 변환할 수 있습니다. 현재 변환 대상 값: %s";
    public static final String PARSING_INTEGER_EXCEPTION_MESSAGE
            = "숫자값만 Integer 타입으로 변환할 수 있습니다. 현재 변환 대상 값: %s";
    public static final String PARSING_SHORT_EXCEPTION_MESSAGE
            = "숫자값만 Short 타입으로 변환할 수 있습니다. 현재 변환 대상 값: %s";
    public static final String PARSING_FLOAT_EXCEPTION_MESSAGE
            = "소수값만 float 타입으로 변환할 수 있습니다. 현재 변환 대상 값: %s";
    public static final String PARSING_BYTE_EXCEPTION_MESSAGE
            = "숫자값만 byte 타입으로 변환할 수 있습니다. 현재 변환 대상 값: %s";
    public static final String PARSING_LOCAL_DATE_TIME_EXCEPTION_MESSAGE
            = "시간값만 LocalDateTime 타입으로 변환할 수 있습니다. 현재 변환 대상 값: %s";
    public static final String PARSING_BOOLEAN_EXCEPTION_MESSAGE
            = "논리형 값만 Boolean 타입으로 변환할 수 있습니다. 현재 변환 대상 값: %s";

    public static final String USER_NOT_FOUND_EXCEPTION_MESSAGE
            = "해당하는 회원을 찾을 수 없습니다. 전송된 회원 이메일 주소: %s";

    public static final String ID_NO_VALUE_EXCEPTION_MESSAGE = "ID는 필수값입니다.";
    public static final String INVALID_ID_EXCEPTION_MESSAGE = "ID는 양의 정수(1 이상의 숫자값)여야 합니다. 전송된 ID: %s";
}
