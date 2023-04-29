package com.example.backend.config;

import com.example.backend.api.service.oauth2.CustomOAuth2UserService;
import com.example.backend.api.service.jwt.JwtService;
import com.example.backend.api.repository.users.UsersRepository;
import com.example.backend.filter.JwtAuthenticationProcessingFilter;
import com.example.backend.handler.oauth2.OAuth2LoginFailureHandler;
import com.example.backend.handler.oauth2.OAuth2LoginSuccessTestHandler;
import java.util.Arrays;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

/**
 * 인증은 CustomJsonUsernamePasswordAuthenticationFilter에서 authenticate()로 인증된 사용자로 처리
 * JwtAuthenticationProcessingFilter는 AccessToken, RefreshToken 재발급
 */
@Profile("test")
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityTestConfig {

    private final JwtService jwtService;
    private final UsersRepository usersRepository;
    private final OAuth2LoginSuccessTestHandler oAuth2LoginSuccessTestHandler;
    private final OAuth2LoginFailureHandler oAuth2LoginFailureHandler;
    private final CustomOAuth2UserService customOAuth2UserService;

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return web -> web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        // Access-Control-Allow-Origin 값을 설정한다.
        // setAllowedOrigins로 여러개를 한꺼번에 설정할 수 도 있다.
        corsConfiguration.setAllowedOrigins(
            Arrays.asList("url", "url"));
        // 어떤 HTTP 메서드를 허용할지 정할 수 있다.
        // setAllowedMethods로 여러개를 한꺼번에 설정할 수 있다.
        corsConfiguration.addAllowedMethod("*");
        // 허용할 헤더를 설정한다.
        corsConfiguration.addAllowedHeader("*");
        // 사용자 인증이 필요할 때 설정해줘야한다.
        // true면 브라우저에서 쿠키를 보내 사용자 인증이 필요한 리소스에 접근할 수 있다.
        corsConfiguration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
        // 허용할 path 설정
        urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfiguration);
        return urlBasedCorsConfigurationSource;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .formLogin().disable() // FormLogin 사용 X
            .httpBasic().disable() // httpBasic 사용 X
            .csrf().disable() // csrf 보안 사용 X
            .cors();
        http
            .headers().frameOptions().disable();
        http
            // 세션 사용하지 않으므로 STATELESS로 설정
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        http
            //== URL별 권한 관리 옵션 ==//
            .authorizeRequests()
            .antMatchers(HttpMethod.OPTIONS).permitAll()
            // 아이콘, css, js 관련
            // 기본 페이지, css, image, js 하위 폴더에 있는 자료들은 모두 접근 가능, h2-console에 접근 가능
            .antMatchers("/","/css/**","/images/**","/js/**","/favicon.ico","/h2-console/**").permitAll()
            .antMatchers("/swagger-ui/**", "/api-docs/**").permitAll() // 회원가입 접근 가능
            .anyRequest().authenticated(); // 위의 경로 이외에는 모두 인증된 사용자만 접근 가능
        http
            //== 소셜 로그인 설정 ==//
            .oauth2Login()
            .successHandler(oAuth2LoginSuccessTestHandler) // 동의하고 계속하기를 눌렀을 때 Handler 설정
            .failureHandler(oAuth2LoginFailureHandler) // 소셜 로그인 실패 시 핸들러 설정
            .userInfoEndpoint().userService(customOAuth2UserService); // customUserService 설정
        http.
            addFilterBefore(new JwtAuthenticationProcessingFilter(jwtService, usersRepository) // 수정 완료
                , UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

//    /**
//     * 로그인 성공 시 호출되는 LoginSuccessJWTProviderHandler 빈 등록
//     */
//    @Bean
//    public LoginSuccessHandler loginSuccessHandler() {
//        return new LoginSuccessHandler(jwtService, usersRepository);
//    }
//
//    /**
//     * 로그인 실패 시 호출되는 LoginFailureHandler 빈 등록
//     */
//    @Bean
//    public LoginFailureHandler loginFailureHandler() {
//        return new LoginFailureHandler();
//    }
}
