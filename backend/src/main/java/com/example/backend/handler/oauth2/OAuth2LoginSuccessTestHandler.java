package com.example.backend.handler.oauth2;

import com.example.backend.api.entity.users.Users;
import com.example.backend.api.entity.users.oauth2.CustomOAuth2User;
import com.example.backend.api.repository.users.UsersRepository;
import com.example.backend.api.service.jwt.JwtService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Profile;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Profile("test")
@Slf4j
@Component
@RequiredArgsConstructor
public class OAuth2LoginSuccessTestHandler implements AuthenticationSuccessHandler {

    private final JwtService jwtService;
    private final UsersRepository usersRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
        Authentication authentication) throws IOException, ServletException {
        log.info("OAuth2 Login 성공!");
        try {
            CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal();

            Users findUser = usersRepository.findByEmail(oAuth2User.getEmail())
                .orElseThrow(() -> new IllegalArgumentException("이메일에 해당하는 유저가 없습니다."));

            String refreshToken = jwtService.createRefreshToken();
            String accessToken = jwtService.createAccessToken(oAuth2User.getEmail(),
                oAuth2User.getNickName(), findUser.getRole().getKey());

            jwtService.updateRefreshToken(oAuth2User.getEmail(), refreshToken);

            findUser.authorizeUser();
            response.sendRedirect(returnURL() + accessToken + "&refresh=" + refreshToken);

        } catch (Exception e) {
            throw new IOException(e.getMessage());
        }
    }

    public String returnURL() {
        return "http://localhost:3000/auth/kakao?access=";
    }
}
