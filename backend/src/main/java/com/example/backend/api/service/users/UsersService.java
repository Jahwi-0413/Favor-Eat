package com.example.backend.api.service.users;

import com.example.backend.api.dto.foods.response.ResponseTasteInfo;
import com.example.backend.api.dto.users.request.RequestTasteEvaluations;
import com.example.backend.api.dto.users.response.ResponseUserInfo;
import com.example.backend.api.entity.users.Evaluations;
import com.example.backend.api.entity.users.Role;
import com.example.backend.api.entity.users.Users;
import com.example.backend.api.repository.users.EvaluationsRepository;
import com.example.backend.api.repository.users.UsersRepository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import javax.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Slf4j
@Service
@RequiredArgsConstructor
public class UsersService {

    private final UsersRepository usersRepository;
    private final EvaluationsRepository evaluationsRepository;

    /**
     * Remove refresh token
     *
     * @param no must not be null
     * @return entity with No equal to given value
     * @throws NullPointerException can't find user
     */
    @Transactional
    public Users signOutUser(Long no) {
        Users users = usersRepository.findByNo(no).orElseThrow(NullPointerException::new);
        users.updateRefreshToken(null);
        return usersRepository.save(users);
    }

    /**
     * Returns the user's flavor information and whether they agree to the alarm using the given
     * value.
     *
     * @param no must not be null
     * @return the user's flavor information and whether they agree to the alarm.
     * @throws NullPointerException can't find user
     */
    public ResponseUserInfo getUserInfo(Long no) {
        log.info("getUserInfo() 호출");
        Users users = usersRepository.findByNo(no).orElseThrow(NullPointerException::new);

        Map<String, Float> averageFlavorValues = evaluationsRepository.getAverageByNo(no);
        ResponseTasteInfo userTasteInfo = ResponseTasteInfo.builder()
            .salty(averageFlavorValues.get("saltiness"))
            .spicy(averageFlavorValues.get("spiciness"))
            .sweet(averageFlavorValues.get("sweetness"))
            .oily(averageFlavorValues.get("fatness")).build();

        return ResponseUserInfo.builder()
            .alarm(users.isAlarm())
            .responseTasteInfo(userTasteInfo)
            .build();
    }


    /**
     * Save evaluations and change user's role
     *
     * @param no                      must not be null
     * @param requestTasteEvaluations must not be null
     * @return saved entity
     */
    @Transactional(rollbackOn = RuntimeException.class)
    public Users registInitialEvaluations(Long no,
        List<RequestTasteEvaluations> requestTasteEvaluations) {

        evaluationsRepository.saveAll(requestTasteEvaluations.stream()
            .map(evaluation -> evaluation.toEntity(no))
            .collect(Collectors.toList()));

        Optional<Users> users = usersRepository.findByNo(no);
        users.ifPresentOrElse(user -> user.updateRole(Role.USER), () -> {
            throw new RuntimeException();
        });

        return users.get();

    }

    /**
     * Save evaluation
     *
     * @param no                      must not be null
     * @param requestTasteEvaluations must not be null
     */
    @Transactional
    public void registEvaluations(Long no, RequestTasteEvaluations requestTasteEvaluations) {
        evaluationsRepository.save(requestTasteEvaluations.toEntity(no));
    }

    /**
     * Return an evaluation with the given values.
     *
     * @param no      must not be null
     * @param foodsId must not be null
     * @return evaluation
     * @throws NullPointerException entity is not exist
     */
    public ResponseTasteInfo getEvaluations(Long no, Long foodsId) {
        return evaluationsRepository.findByNoAndFoodsId(no, foodsId)
            .map(Evaluations::toDTO).orElseThrow(NullPointerException::new);
    }

    /**
     * Request bigdata server to store the recommendation list.
     *
     * @param no must not be null
     * @throws RuntimeException response 500 error
     */
    public void requestRegistRecommends(Long no) {
        log.info("빅데이터와 연결 시작");
        Map<String, Long> params = new HashMap<>();
        params.put("no", no);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, Long>> entity = new HttpEntity<>(params, headers);

        RestTemplate rt = new RestTemplate();
        ResponseEntity<Object> response = rt.exchange(
            "url/predict",
            HttpMethod.POST,
            entity,
            Object.class
        );

        log.info("빅데이터와 연결 종료");
        if (response.getStatusCode().equals(HttpStatus.INTERNAL_SERVER_ERROR)) {
            throw new RuntimeException("빅데이터 에러 발생");
        }
    }
}
