export const apiURL =
  process.env.NODE_ENV === "production"
    ? "product-url"
    : "dev-url";

export const kakaoLoginUrl = `${apiURL}/oauth2/authorization/kakao`;

export const ACCESS_TOKEN = "accessToken";
