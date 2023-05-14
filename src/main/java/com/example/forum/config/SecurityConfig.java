package com.example.forum.config;
import com.example.forum.services.UserDetailsServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig {

    private final UserDetailsServiceImpl userDetailsService;


    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .authorizeRequests()
                .requestMatchers("/login", "/registration").permitAll()
                .requestMatchers("/images/**", "/css/**").permitAll()
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().hasAnyRole("USER", "ADMIN")
                .and()
                .formLogin().loginPage("/login")
                .loginProcessingUrl("/process_login")
                .defaultSuccessUrl("/mainpage")
                .permitAll()
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/login")
                .and()
                .csrf().disable()
                .build();
    }
    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService);
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(8);
    }
}