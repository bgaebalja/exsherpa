package bgaebalja.exsherpa.solvedquestion.repository;

import bgaebalja.exsherpa.examination.domain.SolvedQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SolvedQuestionRepository extends JpaRepository<SolvedQuestion, Long> {
}
