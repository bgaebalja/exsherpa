package bgaebalja.exsherpa.user.annotation;

import static bgaebalja.exsherpa.util.SessionConstant.LOGIN_USER;

import bgaebalja.exsherpa.user.domain.Users;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

@Slf4j
public class LoginUserArgumentResolver implements HandlerMethodArgumentResolver {

  @Override
  public boolean supportsParameter(MethodParameter parameter) {
    boolean hasLoginAnnotation = parameter.hasParameterAnnotation(Login.class);
    boolean hasUsersType = Users.class.isAssignableFrom(parameter.getParameterType());
    return hasLoginAnnotation && hasUsersType;
  }

  @Override
  public Object resolveArgument(
      MethodParameter parameter, ModelAndViewContainer mavContainer,
      NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
    HttpServletRequest request =  webRequest.getNativeRequest(HttpServletRequest.class);
    assert request != null;
    HttpSession session = request.getSession(false);
    if (session == null) {
      return null;
    }
    return session.getAttribute(LOGIN_USER);
  }
}
