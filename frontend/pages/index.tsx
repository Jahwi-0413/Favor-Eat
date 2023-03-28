import { deleteAsync } from "@/action/apis/apis";
import { apiURL } from "@/store/constants";
import { userDataSave, userTokenSave } from "@/store/userStore";
import { ApiStateRes } from "@/types/Common/dummy";
import { useAtom } from "jotai";
import { useRouter } from "next/router";
import { useEffect, useState } from "react";

import { initializeApp } from "firebase/app";
import { getMessaging, onMessage, getToken } from "firebase/messaging";

export default function Home() {
  // const onMessageFCM = async () => {
  //   // 브라우저에 알림 권한을 요청합니다.
  //   const permission = await Notification.requestPermission();
  //   if (permission !== "granted") return;

  //   // 이곳에도 아까 위에서 앱 등록할때 받은 'firebaseConfig' 값을 넣어주세요.
  //   const firebaseApp = initializeApp({
  //     apiKey: "AIzaSyBkvLz36_zD93UwXx4wf8P101EeX1pDLyQ",
  //     authDomain: "test-pwa-7907d.firebaseapp.com",
  //     projectId: "test-pwa-7907d",
  //     storageBucket: "test-pwa-7907d.appspot.com",
  //     messagingSenderId: "11003173258",
  //     appId: "1:11003173258:web:c4468671141151e5141073",
  //     measurementId: "G-H66VD1BMY3",
  //   });

  //   const messaging = getMessaging(firebaseApp);

  //   // 이곳 vapidKey 값으로 아까 토큰에서 사용한다고 했던 인증서 키 값을 넣어주세요.
  //   getToken(messaging, {
  //     vapidKey:
  //       "BBmsINcSMQVkwjV0vncMSWz37t9l0ckye4rlOlwWDvONtHXX97k-VFFJUf6Sgukq5X9E2OFTQpP0De-_2rw72Yg",
  //   })
  //     .then((currentToken) => {
  //       if (currentToken) {
  //         // 정상적으로 토큰이 발급되면 콘솔에 출력합니다.
  //         console.log(currentToken);
  //       } else {
  //         console.log(
  //           "No registration token available. Request permission to generate one.",
  //         );
  //       }
  //     })
  //     .catch((err) => {
  //       console.log("An error occurred while retrieving token. ", err);
  //     });

  //   // 메세지가 수신되면 역시 콘솔에 출력합니다.
  //   onMessage(messaging, (payload) => {
  //     console.log("Message received. ", payload);
  //   });
  // };

  // useEffect(() => {
  //   onMessageFCM();
  // }, []);

  const [test, setTest] = useState<ApiStateRes>({
    isSuccess: false,
    result: "",
  });
  const router = useRouter();
  const [token] = useAtom(userTokenSave);
  const [userData] = useAtom(userDataSave);

  useEffect(() => {
    if (!router.isReady) return;
  }, [router.isReady]);

  useEffect(() => {
    if (token.accessToken) {
      const { role } = userData;

      if (role === "USER") {
        router.push("/main");
      }
      if (role === "GUEST") {
        router.push("/taste/choose");
      }
      return;
    } else router.push("/guide");
  }, [token, userData]);

  useEffect(() => {
    deleteAsync(apiURL + "posts/1").then((res) => {
      console.log(res);
      setTest(res);
    });
  }, []);

  return <div>{test.isSuccess && test.result.title}</div>;
}
