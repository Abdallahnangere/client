"use client";

import { useEffect } from "react";
import Link from "next/link";

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    console.error(error);
  }, [error]);

  return (
    <div className="min-h-screen flex items-center justify-center p-6">
      <div className="text-center max-w-sm">
        <div
          className="w-12 h-12 rounded-full flex items-center justify-center mx-auto mb-6"
          style={{ background: "rgba(224,85,85,0.1)", border: "1px solid rgba(224,85,85,0.2)" }}
        >
          <svg width="20" height="20" viewBox="0 0 20 20" fill="none" style={{ color: "#E05555" }}>
            <path d="M10 6v5M10 14v1" stroke="currentColor" strokeWidth="1.5" strokeLinecap="square" />
            <path d="M8.5 2.5l-7 13h17l-7-13h-3z" stroke="currentColor" strokeWidth="1.5" strokeLinejoin="miter" />
          </svg>
        </div>
        <h1
          className="font-display text-2xl font-light mb-2"
          style={{ color: "#E8EDF8" }}
        >
          Something went wrong
        </h1>
        <p className="text-sm mb-2" style={{ color: "#6B83A8" }}>
          {error.message || "An unexpected error occurred."}
        </p>
        {error.digest && (
          <p className="font-mono text-[10px] mb-8" style={{ color: "#3D5070" }}>
            Error ID: {error.digest}
          </p>
        )}
        <div className="flex gap-3 justify-center">
          <button onClick={reset} className="btn btn-gold">
            Try Again
          </button>
          <Link href="/" className="btn btn-outline">
            Return Home
          </Link>
        </div>
      </div>
    </div>
  );
}
