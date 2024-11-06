package bgaebalja.exsherpa.examination.repository;

import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExaminationRepository extends JpaRepository<ExaminationHistory, Long> {
}
