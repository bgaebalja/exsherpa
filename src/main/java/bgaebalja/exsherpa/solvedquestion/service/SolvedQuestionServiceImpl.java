package bgaebalja.exsherpa.solvedquestion.service;

import bgaebalja.exsherpa.examination.domain.AnswerRequest;
import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import bgaebalja.exsherpa.examination.domain.SolvedQuestion;
import bgaebalja.exsherpa.question.domain.Question;
import bgaebalja.exsherpa.question.exception.QuestionNotFoundException;
import bgaebalja.exsherpa.question.repository.QuestionRepository;
import bgaebalja.exsherpa.solvedquestion.exception.SolvedQuestionNotFoundException;
import bgaebalja.exsherpa.solvedquestion.repository.SolvedQuestionRepository;
import bgaebalja.exsherpa.util.FormatConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import static bgaebalja.exsherpa.question.exception.ExceptionMessage.QUESTION_NOT_FOUND_EXCEPTION_MESSAGE;
import static bgaebalja.exsherpa.solvedquestion.exception.ExceptionMessage.SOLVED_QUESTION_NOT_FOUND_EXCEPTION_MESSAGE;
import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;
import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_UNCOMMITTED, readOnly = true, timeout = 20)
public class SolvedQuestionServiceImpl implements SolvedQuestionService {
    private final QuestionRepository questionRepository;
    private final SolvedQuestionRepository solvedQuestionRepository;

    @Override
    @Transactional(isolation = READ_COMMITTED, timeout = 20)
    public void registerSolvedQuestions(
            List<AnswerRequest> answerRequests, ExaminationHistory examinationHistory
    ) {
        List<SolvedQuestion> solvedQuestions = new ArrayList<>();
        short questionNumber = 0;
        for (AnswerRequest answerRequest : answerRequests) {
            String questionId = answerRequest.getQuestionId();
            Question question
                    = questionRepository.findById(FormatConverter.parseToLong(questionId))
                    .orElseThrow(
                            () -> new QuestionNotFoundException(
                                    String.format(QUESTION_NOT_FOUND_EXCEPTION_MESSAGE, questionId)
                            )
                    );
            solvedQuestions.add(SolvedQuestion.from(++questionNumber, answerRequest, question, examinationHistory));
        }

        solvedQuestionRepository.saveAll(solvedQuestions);
    }

    @Override
    public SolvedQuestion getSolvedQuestion(Long id) {
        return solvedQuestionRepository.findByIdAndDeleteYnFalse(id).orElseThrow(
                () -> new SolvedQuestionNotFoundException(
                        String.format(SOLVED_QUESTION_NOT_FOUND_EXCEPTION_MESSAGE, id))
        );
    }
}
