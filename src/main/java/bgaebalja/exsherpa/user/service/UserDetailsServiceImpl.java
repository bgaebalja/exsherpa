package bgaebalja.exsherpa.user.service;

import bgaebalja.exsherpa.user.domain.UserRole;
import bgaebalja.exsherpa.user.domain.Users;
import bgaebalja.exsherpa.user.dto.UserDTO;
import bgaebalja.exsherpa.user.repository.UserRepository;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class UserDetailsServiceImpl implements UserDetailsService {

  private final UserRepository userRepository;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    log.info("loadUserByUsername {}",username);
    Users loginUser = userRepository.getUserWithRoles(username);
    if (loginUser == null) {
      throw new UsernameNotFoundException(username);
    }
    return new UserDTO(
        loginUser.getUserId(),
        loginUser.getPassword(),
        loginUser.getUsername(),
        loginUser.getRoles().stream().map(UserRole::getRole).collect(Collectors.toList())
    );
  }
}