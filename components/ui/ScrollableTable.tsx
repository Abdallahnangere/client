"use client";

import { useRef, useEffect, useState } from "react";

export default function ScrollableTable({ children }: { children: React.ReactNode }) {
  const scrollRef = useRef<HTMLDivElement>(null);
  const [canLeft, setCanLeft] = useState(false);
  const [canRight, setCanRight] = useState(false);

  const update = () => {
    const el = scrollRef.current;
    if (!el) return;
    setCanLeft(el.scrollLeft > 4);
    setCanRight(el.scrollLeft + el.clientWidth < el.scrollWidth - 4);
  };

  useEffect(() => {
    const el = scrollRef.current;
    if (!el) return;
    update();
    el.addEventListener("scroll", update, { passive: true });
    const ro = new ResizeObserver(update);
    ro.observe(el);
    return () => { el.removeEventListener("scroll", update); ro.disconnect(); };
  }, []);

  const scrollBy = (dir: "left" | "right") => {
    const el = scrollRef.current;
    if (!el) return;
    el.scrollBy({ left: dir === "right" ? 320 : -320, behavior: "smooth" });
  };

  return (
    <div style={{ position: "relative" }}>
      {/* Left arrow */}
      <button
        type="button"
        aria-label="Scroll left"
        onClick={() => scrollBy("left")}
        style={{
          position: "absolute",
          left: 0,
          top: "50%",
          transform: "translateY(-50%)",
          zIndex: 10,
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          width: 28,
          height: 28,
          borderRadius: "50%",
          border: "1px solid #1A2D4A",
          background: "#08121F",
          color: "#C8963C",
          cursor: "pointer",
          transition: "opacity 0.2s, box-shadow 0.2s",
          opacity: canLeft ? 1 : 0,
          pointerEvents: canLeft ? "auto" : "none",
          boxShadow: canLeft ? "0 0 12px rgba(200,150,60,0.18)" : "none",
        }}
      >
        <svg width="10" height="10" viewBox="0 0 10 10" fill="none">
          <path d="M6.5 1.5L3 5l3.5 3.5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
      </button>

      {/* Right arrow */}
      <button
        type="button"
        aria-label="Scroll right"
        onClick={() => scrollBy("right")}
        style={{
          position: "absolute",
          right: 0,
          top: "50%",
          transform: "translateY(-50%)",
          zIndex: 10,
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          width: 28,
          height: 28,
          borderRadius: "50%",
          border: "1px solid #1A2D4A",
          background: "#08121F",
          color: "#C8963C",
          cursor: "pointer",
          transition: "opacity 0.2s, box-shadow 0.2s",
          opacity: canRight ? 1 : 0,
          pointerEvents: canRight ? "auto" : "none",
          boxShadow: canRight ? "0 0 12px rgba(200,150,60,0.18)" : "none",
        }}
      >
        <svg width="10" height="10" viewBox="0 0 10 10" fill="none">
          <path d="M3.5 1.5L7 5l-3.5 3.5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
      </button>

      {/* Scroll area */}
      <div
        ref={scrollRef}
        style={{
          overflowX: "scroll",
          overflowY: "auto",
          paddingLeft: 4,
          paddingRight: 4,
          scrollbarWidth: "auto",
          scrollbarColor: "#1A2D4A #08121F",
        }}
      >
        {children}
      </div>
    </div>
  );
}
