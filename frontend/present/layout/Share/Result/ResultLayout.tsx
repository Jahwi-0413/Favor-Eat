import { ResultLayoutProps } from "@/types/Share/Result/dummy";
import Image from "next/image";
import KakaoLogo from "@/assets/icon/kakao-logo.svg";
import * as style from "./ResultLayout.style";
import { useEffect } from "react";
import Router, { useRouter } from "next/router";

export default function ResultLayout({
  resultContents,
  likedCount,
}: // shareHandler,
ResultLayoutProps) {
  const { resultIcon, title, text } = resultContents;
  const router = useRouter();

  useEffect(() => {
    if (!window.Kakao.isInitialized())
      window.Kakao.init("c992e424bb99312b69fe8e79653e1204");
  }, []);

  const onClickShare = () => {
    if (window.Kakao) {
      const kakao = window.Kakao;
      if (!kakao.isInitialized()) {
        kakao.init(process.env.REACT_APP_SHARE_KAKAO_LINK_KEY); // 카카오에서 제공받은 javascript key를 넣어줌 -> .env파일에서 호출시킴
      }

      const url =
        process.env.NODE_ENV === "production" ? "host-url" : "local-url";

      kakao.Share.sendDefault({
        objectType: "feed", // 카카오 링크 공유 여러 type들 중 feed라는 타입 -> 자세한 건 카카오에서 확인
        content: {
          title: "나는 으른 입맛일까?", // 인자값으로 받은 title
          description: "나의 입맛 연령 테스트 결과를 구경해보세요", // 인자값으로 받은 title
          imageUrl: "png",
          link: {
            webUrl: url,
          },
        },
        buttons: [
          {
            title: "웹으로 구경하기",
            link: {
              webUrl: `${url}/share/result?like=${likedCount}`,
              mobileWebUrl: `${url}/share/result?like=${likedCount}`,
            },
          },
        ],
      });
    }
  };
  const onClickLogin = () => {
    router.push("/guide");
  };

  return (
    <style.Container>
      <style.ContentBox>
        <span>테스트 결과</span>
        <div>
          <Image src={resultIcon} alt="테스트 결과" />
        </div>
        <span>{title}</span>
        <div>{text}</div>
      </style.ContentBox>
      <style.ButtonBox>
        <div onClick={onClickShare}>
          <KakaoLogo />
          친구에게 공유하기
        </div>
        <div onClick={onClickLogin}>로그인 하러가기</div>
      </style.ButtonBox>
    </style.Container>
  );
}
