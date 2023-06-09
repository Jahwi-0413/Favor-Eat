import { useScrollState } from "@/types/Hooks/dummy";
import { useState, useEffect, useCallback, useMemo } from "react";

export function useScroll(): Array<number> {
  const [scroll, setScroll] = useState<useScrollState>({
    lastScrollTop: 0,
    bodyOffset: undefined,
    scrollY: 0,
    direction: "",
    eventHeight: 0,
  });

  //화면 전체 길이
  let viewHeight = 0;

  if (typeof document !== "undefined") {
    viewHeight = document.documentElement.clientHeight;
  }

  const handleScrollEvent = useCallback((e: any) => {
    setScroll((prevState) => {
      const prevLastScrollTop = prevState.lastScrollTop;
      const bodyOffset = document.body.getBoundingClientRect();

      return {
        lastScrollTop: -bodyOffset.top,
        bodyOffset: bodyOffset,
        scrollY: -bodyOffset.top,
        direction: prevLastScrollTop > -bodyOffset.top ? "down" : "top",
        eventHeight: -bodyOffset.top-viewHeight
      };
    });
  }, []);

  useEffect(() => {
    const scrollListener = (e: any) => {
      handleScrollEvent(e);
    };

    window.addEventListener("scroll", scrollListener, { passive: true });

    return () => {
      window.removeEventListener("scroll", scrollListener);
    };
  }, [handleScrollEvent]);

  return [scroll.scrollY, viewHeight, scroll.eventHeight];
}
