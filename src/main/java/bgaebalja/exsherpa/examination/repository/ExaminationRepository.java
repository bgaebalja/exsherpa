package bgaebalja.exsherpa.examination.repository;

import bgaebalja.exsherpa.examination.domain.ExaminationHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ExaminationRepository extends JpaRepository<ExaminationHistory, Long> {
    @Query("SELECT eh FROM ExaminationHistory eh "
            + "WHERE eh.user.id = :userId "
            + "AND eh.solvedYn = true "
            + "AND eh.deleteYn = false "
            + "AND eh.createdAt = (SELECT MAX(subEh.createdAt) "
            + "FROM ExaminationHistory subEh "
            + "WHERE subEh.exam.id = eh.exam.id AND subEh.user.id = :userId "
            + "AND subEh.solvedYn = true AND subEh.deleteYn = false) "
            + "ORDER BY eh.createdAt DESC")
    List<ExaminationHistory> findLatestExaminationsByUserId(
            @Param("userId") Long userId);

    List<ExaminationHistory> findBySolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc();

    List<ExaminationHistory> findByExamIdAndSolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc(Long examId);

    List<ExaminationHistory> findByExamIdAndUserIdAndSolvedYnTrueAndDeleteYnFalseOrderByCreatedAtDesc(
            Long examId, Long userId
    );
}
