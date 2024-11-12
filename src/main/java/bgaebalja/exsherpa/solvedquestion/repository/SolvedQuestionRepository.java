package bgaebalja.exsherpa.solvedquestion.repository;

import bgaebalja.exsherpa.examination.domain.SolvedQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SolvedQuestionRepository extends JpaRepository<SolvedQuestion, Long> {
    Optional<SolvedQuestion> findByIdAndDeleteYnFalse(Long questionId);
}
