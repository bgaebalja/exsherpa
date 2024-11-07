package bgaebalja.exsherpa.question.service;

import bgaebalja.exsherpa.question.domain.Question;
import bgaebalja.exsherpa.question.exception.QuestionNotFoundException;
import bgaebalja.exsherpa.question.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import static bgaebalja.exsherpa.question.exception.ExceptionMessage.QUESTION_NOT_FOUND_EXCEPTION_MESSAGE;

@Service
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService {
    private final QuestionRepository questionRepository;

    @Override
    public Question getQuestion(Long id) {
        return questionRepository.findByIdAndDeleteYnFalse(id)
                .orElseThrow(() -> new QuestionNotFoundException(
                        String.format(QUESTION_NOT_FOUND_EXCEPTION_MESSAGE, id)
                ));
    }
}
