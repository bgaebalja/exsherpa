package bgaebalja.exsherpa.exam.repository;

import bgaebalja.exsherpa.exam.domain.Exam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ExamRepository extends JpaRepository<Exam, Long> {
    Optional<Exam> findById(Long id);

    List<Exam> findByDeleteYnFalseAndOpenYnTrue();

    List<Exam> findByUserIdAndDeleteYnFalseAndOpenYnTrue(Long userId);

    Optional<Exam> findByIdAndDeleteYnFalse(Long examId);
}
