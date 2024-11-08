package bgaebalja.exsherpa.examination.repository;

import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExaminationRepository extends JpaRepository<ExaminationHistory, Long> {
    List<ExaminationHistory> findByUserIdAndSolvedYnTrueAndDeleteYnFalseOrderByModifiedAtAsc(Long userId);

    List<ExaminationHistory> findBySolvedYnTrueAndDeleteYnFalse();

    List<ExaminationHistory> findByExamIdAndSolvedYnTrueAndDeleteYnFalse(Long examId);
}
