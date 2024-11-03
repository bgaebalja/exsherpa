package bgaebalja.exsherpa.user.dto;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserDTO extends User {

  private String eamil;
  private String password;
  private String username;

  private List<String> roles;

  public UserDTO(String email, String password, String username, List<String> roles) {
    super(
        email,
        password,
        roles.stream().map(role -> new SimpleGrantedAuthority("ROLE_" + role))
            .collect(Collectors.toList())
    );
    this.password = password;
    this.username = username;
    this.roles = roles;
  }

}
