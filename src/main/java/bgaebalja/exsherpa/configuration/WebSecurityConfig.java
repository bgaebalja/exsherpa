package bgaebalja.exsherpa.configuration;

import bgaebalja.exsherpa.security.handler.CustomAccessDeniedHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@RequiredArgsConstructor
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
        .and()
        .csrf().disable()
        .authorizeRequests()
        .antMatchers(
            "/users/login", "/users/register",
            "/**"
        ).
        permitAll()
        .anyRequest().authenticated()
        .and()
        .formLogin()
        .loginPage("/users/login")
        .defaultSuccessUrl("/", true)
        .failureUrl("/users/login?error=true")
        .permitAll()
        .and()
        .logout()
        .logoutUrl("/users/logout")
        .logoutSuccessUrl("/users/login?logout=true")
        .invalidateHttpSession(true)
        .deleteCookies("JSESSIONID")
        .clearAuthentication(true)
        .permitAll()
        .and()
        .exceptionHandling()
        .accessDeniedHandler(new CustomAccessDeniedHandler());
  }

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

}
