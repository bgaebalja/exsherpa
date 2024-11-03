package bgaebalja.exsherpa.user.service;

import bgaebalja.exsherpa.user.domain.UserRole;
import bgaebalja.exsherpa.user.domain.Users;
import bgaebalja.exsherpa.user.dto.UserDTO;
import bgaebalja.exsherpa.user.repository.UserRepository;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {

  private final UserRepository userRepository;
  private final PasswordEncoder passwordEncoder;

  @Override
  public UserDTO getUserByEmail(String email) {
    Users user = userRepository.getUserWithRoles(email);
    return new UserDTO(
      user.getUserId(),
      user.getPassword(),
      user.getUsername(),
        user.getRoles().stream().map(UserRole::getRole).collect(Collectors.toList())
    );
  }
}
