package bgaebalja.exsherpa.subject.repository;

import bgaebalja.exsherpa.subject.domain.Subject;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SubjectRepository extends JpaRepository<Subject, String> {
    Optional<Subject> findByName(String subjectName);
}
