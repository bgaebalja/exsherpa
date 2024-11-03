package bgaebalja.exsherpa.user.repository;

import bgaebalja.exsherpa.user.domain.Users;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends CrudRepository<Users, Long> {

  Optional<Users> findByUserId(String email);

  @Query("select u from Users u join fetch u.roles r where u.userId=:email")
  Users getUserWithRoles(@Param("email") String email);

}
