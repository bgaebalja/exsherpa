package bgaebalja.exsherpa.subject.exception;

import javax.persistence.EntityNotFoundException;

public class SubjectNotFoundException extends EntityNotFoundException {
    public SubjectNotFoundException(String message) {
        super(message);
    }
}
