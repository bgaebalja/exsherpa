package bgaebalja.exsherpa.user.controller;

import bgaebalja.exsherpa.user.annotation.Login;
import bgaebalja.exsherpa.user.domain.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/users")
public class UserController {

  @GetMapping("/login")
  public String getLogin(@Login Users user, Model model) {
    if (user == null) {
      return "redirect:user/login/login";
    }
    model.addAttribute("user", user);
    return "user/login/login";
  }

  @GetMapping("/accessDenied")
  public String accessDenied(Model model) {
    model.addAttribute("errorMessage", "학생으로 가입한 회원만 접근할 수 있습니다.");
    return "/user/access/denied-page";
  }

}
