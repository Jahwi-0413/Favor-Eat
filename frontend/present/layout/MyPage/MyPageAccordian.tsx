import React from "react";

import * as style from "./MyPage.style";

import AccordianPurpleCompo from "@/present/component/AccordianPurpleCompo/AccordianPurpleCompo";
import { MyPageContentProps } from "@/types/MyPage/dummy";

import RightTitleBox from "@/present/common/TitleBox/RightTitleBox/RightTitleBox";

export default function MyPageAccordian({
  myPageArr,
  selectIdx,
  setSelectedIdx,
}: MyPageContentProps) {
  const accordianHandler = (idx: number) => {
    setSelectedIdx(idx);
  };

  const accordians = myPageArr.map((elem, idx) => {
    return (
      <AccordianPurpleCompo
        key={idx}
        elem={elem}
        idx={idx}
        accordianHandler={() => accordianHandler(idx)}
      />
    );
  });

  return (
    <style.MyPageAccordian>
      <RightTitleBox title="마이페이지" />
      {accordians}
    </style.MyPageAccordian>
  );
}
