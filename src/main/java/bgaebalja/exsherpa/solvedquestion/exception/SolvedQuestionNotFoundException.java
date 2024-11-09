package bgaebalja.exsherpa.solvedquestion.exception;

import javax.persistence.EntityNotFoundException;

public class SolvedQuestionNotFoundException extends EntityNotFoundException {
    public SolvedQuestionNotFoundException(String message) {
        super(message);
    }
}
