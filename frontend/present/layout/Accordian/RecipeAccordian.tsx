import React, {useRef} from "react";
import AccordianCompo from "@/present/component/AccordianCompo/AccordianCompo";
import { RecipeContentProps } from "@/types/Recipe/dummy";

export default function RecipeAccordian({RecipeArr, selectIdx, setSelectedIdx}:RecipeContentProps) {
  const accordianHandler = (idx:number) => {
    setSelectedIdx(idx)
  }
  
  // 아코디언 컴포넌트 생성
  const accordians = RecipeArr.map((elem, idx) => {
    return (
      <AccordianCompo
        key={idx}
        elem={elem}
        idx={idx}
        accordianHandler={()=>accordianHandler(idx)}
      />
    );
  });

  return <div id="accordian">{accordians}</div>;
}
