package bgaebalja.exsherpa.user.service;

import bgaebalja.exsherpa.user.dto.UserDTO;

public interface UserService {

  UserDTO getUserByEmail(String email);

}
