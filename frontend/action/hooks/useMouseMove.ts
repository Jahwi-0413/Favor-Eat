import { cursorIsShowAtom } from "@/store/cursorStore";
import { useAtomValue } from "jotai";
import { useEffect, useState } from "react";

export default function useMouseMove() {
  const [mouseLocation, setMouseLocation] = useState({ x: null, y: null });
  const isShow = useAtomValue(cursorIsShowAtom);

  const onMouseMove = (e: MouseEvent) => {
    setMouseLocation({ x: e.clientX + 15, y: e.clientY + 15 });
  };

  useEffect(() => {
    if (isShow) {
      document.body.style.overflow = "hidden";
      window.addEventListener("mousemove", onMouseMove);

      return () => {
        document.body.style.overflow = "auto";
        window.removeEventListener("mousemove", onMouseMove);
      };
    } else {
      document.body.style.overflow = "auto";
    }
  }, [isShow]);

  return mouseLocation;
}
