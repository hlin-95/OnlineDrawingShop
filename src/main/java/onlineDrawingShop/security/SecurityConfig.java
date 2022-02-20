package onlineDrawingShop.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
                .csrf().disable().authorizeRequests()
                .antMatchers(SecurityConstants.PAGE_URL).permitAll()
                .antMatchers(SecurityConstants.IMAGE_URL).permitAll()
                .antMatchers(SecurityConstants.GUEST_URL).permitAll()
                .antMatchers(SecurityConstants.USER_URL).hasAnyAuthority("ROLE_USER", "ROLE_ADMIN")
                .antMatchers(SecurityConstants.ADMIN_URL).hasAuthority("ROLE_ADMIN")
                .anyRequest().authenticated();

        http
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/guest/login-form")
                .defaultSuccessUrl("/user/loginSuccess?name=show")
                .failureUrl("/login?error=loginError");

        http
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/logoutSuccess");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .jdbcAuthentication().dataSource(dataSource)
                .passwordEncoder(passwordEncoder())
                .usersByUsernameQuery("SELECT username, password, enabled FROM users WHERE username=?")
                .authoritiesByUsernameQuery("SELECT username, authority FROM authorities WHERE username=?");

        auth
                .inMemoryAuthentication()
                .withUser("linAdmin")
                .password(passwordEncoder().encode("ppo19"))
                .authorities("ROLE_ADMIN");

    }
}

