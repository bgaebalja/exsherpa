package bgaebalja.exsherpa.exam.exception;

import javax.persistence.EntityNotFoundException;

public class ExamNotFoundException extends EntityNotFoundException {
    public ExamNotFoundException(String message) {
        super(message);
    }
}
