package bgaebalja.exsherpa.solvedquestion.service;

import bgaebalja.exsherpa.examination.domain.AnswerRequest;
import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import bgaebalja.exsherpa.examination.domain.SolvedQuestion;
import bgaebalja.exsherpa.question.domain.Question;
import bgaebalja.exsherpa.question.exception.QuestionNotFoundException;
import bgaebalja.exsherpa.question.repository.QuestionRepository;
import bgaebalja.exsherpa.solvedquestion.repository.SolvedQuestionRepository;
import bgaebalja.exsherpa.util.FormatConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static bgaebalja.exsherpa.question.exception.ExceptionMessage.QUESTION_NOT_FOUND_EXCEPTION_MESSAGE;

@Service
@RequiredArgsConstructor
public class SolvedQuestionServiceImpl implements SolvedQuestionService {
    private final QuestionRepository questionRepository;
    private final SolvedQuestionRepository solvedQuestionRepository;

    @Override
    public void registerSolvedQuestions(
            List<AnswerRequest> answerRequests, ExaminationHistory examinationHistory
    ) {
        List<SolvedQuestion> solvedQuestions = new ArrayList<>();
        for (AnswerRequest answerRequest : answerRequests) {
            String questionId = answerRequest.getQuestionId();
            Question question
                    = questionRepository.findById(FormatConverter.parseToLong(questionId))
                    .orElseThrow(
                            () -> new QuestionNotFoundException(
                                    String.format(QUESTION_NOT_FOUND_EXCEPTION_MESSAGE, questionId)
                            )
                    );
            solvedQuestions.add(SolvedQuestion.from(answerRequest, question, examinationHistory));
        }

        solvedQuestionRepository.saveAll(solvedQuestions);
    }
}
