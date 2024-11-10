package bgaebalja.exsherpa.exam.repository;

import bgaebalja.exsherpa.exam.domain.Exam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ExamRepository extends JpaRepository<Exam, Long> {
    Optional<Exam> findById(Long id);

    List<Exam> findByBookIdAndCustomYnFalseAndDeleteYnFalseAndOpenYnTrueOrderByBookIdAsc(Long bookId);

    Page<Exam> findByCustomYnTrueAndDeleteYnFalseAndOpenYnTrue(Pageable pageable);

    Page<Exam> findByUserIdAndCustomYnTrueAndDeleteYnFalseAndOpenYnTrue(Long userId, Pageable pageable);

    Optional<Exam> findByIdAndDeleteYnFalse(Long examId);
}
