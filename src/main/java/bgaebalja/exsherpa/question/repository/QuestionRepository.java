package bgaebalja.exsherpa.question.repository;

import bgaebalja.exsherpa.question.domain.Question;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Long> {
}
