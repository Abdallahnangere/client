"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

export default function LoginPage() {
  const router = useRouter();
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      const response = await fetch("/api/auth/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ password }),
      });

      const data = await response.json();

      if (!response.ok) {
        setError(data.error || "Login failed");
        setLoading(false);
        return;
      }

      // Clear password field
      setPassword("");

      // Redirect to dashboard
      router.push("/");
      router.refresh();
    } catch (err) {
      setError("An error occurred. Please try again.");
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center p-6" style={{ background: "var(--surface)" }}>
      <div className="w-full max-w-md">
        {/* Header */}
        <div className="mb-8 text-center">
          <div className="eyebrow">Capital Management System</div>
          <h1
            className="font-display text-3xl font-light mt-3"
            style={{ color: "var(--text)", letterSpacing: "0.02em" }}
          >
            Secure Access
          </h1>
          <p className="mt-2 text-sm" style={{ color: "var(--text-2)" }}>
            Enter your password to access the fund ledger
          </p>
        </div>

        {/* Login Card */}
        <div className="card p-8">
          <form onSubmit={handleSubmit} className="space-y-5">
            {/* Password Field */}
            <div>
              <label
                htmlFor="password"
                className="block text-xs font-semibold tracking-widest uppercase mb-2 transition-colors duration-200"
                style={{ color: password ? "var(--brand)" : "var(--text-2)" }}
              >
                Access Password
              </label>
              <div className="relative group">
                <input
                  id="password"
                  type="password"
                  placeholder="Enter password"
                  value={password}
                  onChange={(e) => {
                    setPassword(e.target.value);
                    if (error) setError("");
                  }}
                  disabled={loading}
                  className="input w-full transition-all duration-200"
                  style={{
                    borderColor: error ? "var(--red)" : password ? "var(--brand)" : "var(--border)",
                    boxShadow: password ? "0 0 0 3px rgba(27, 79, 216, 0.1)" : "none",
                    background: password ? "rgba(27, 79, 216, 0.02)" : "var(--surface)",
                  }}
                />
                {password && !error && (
                  <span
                    className="absolute right-3 top-1/2 transform -translate-y-1/2"
                    style={{ color: "var(--brand)" }}
                  >
                    ✓
                  </span>
                )}
              </div>
              {error && (
                <p className="mt-2 text-xs font-medium animate-pulse" style={{ color: "var(--red)" }}>
                  {error}
                </p>
              )}
            </div>

            {/* Submit Button */}
            <button
              type="submit"
              disabled={loading || !password}
              className="relative w-full h-11 rounded-lg font-medium text-sm tracking-wide transition-all duration-300 overflow-hidden group"
              style={{
                background: loading || !password ? "var(--brand-dim, rgba(27, 79, 216, 0.3))" : "var(--brand)",
                color: "white",
                cursor: loading || !password ? "not-allowed" : "pointer",
                opacity: loading || !password ? 0.6 : 1,
                transform: loading || !password ? "scale(0.98)" : "scale(1)",
              }}
              onMouseEnter={(e) => {
                if (!loading && password) {
                  (e.currentTarget as HTMLButtonElement).style.transform = "scale(1.02)";
                  (e.currentTarget as HTMLButtonElement).style.boxShadow = "0 8px 20px rgba(27, 79, 216, 0.35)";
                }
              }}
              onMouseLeave={(e) => {
                if (!loading && password) {
                  (e.currentTarget as HTMLButtonElement).style.transform = "scale(1)";
                  (e.currentTarget as HTMLButtonElement).style.boxShadow = "none";
                }
              }}
            >
              {/* Background shimmer effect */}
              {!loading && (
                <span
                  className="absolute inset-0 bg-gradient-to-r from-transparent via-white to-transparent opacity-0 group-hover:opacity-20 transition-opacity duration-300"
                  style={{
                    animation: "shimmer 2s infinite",
                  }}
                />
              )}
              
              {/* Button content */}
              <span className="relative flex items-center justify-center gap-2">
                {loading ? (
                  <>
                    <span
                      className="inline-block w-4 h-4 rounded-full border-2 border-white/40"
                      style={{
                        borderTopColor: "white",
                        animation: "spin 0.8s linear infinite",
                      }}
                    />
                    <span>Verifying...</span>
                  </>
                ) : (
                  <>
                    <span>Login</span>
                    <svg
                      width="16"
                      height="16"
                      viewBox="0 0 16 16"
                      fill="none"
                      className="transition-transform duration-300 group-hover:translate-x-1"
                      style={{
                        opacity: password ? 1 : 0.5,
                      }}
                    >
                      <path
                        d="M10 3l3 3m0 0l-3 3m3-3H3"
                        stroke="white"
                        strokeWidth="1.5"
                        strokeLinecap="round"
                        strokeLinejoin="round"
                      />
                    </svg>
                  </>
                )}
              </span>

              {/* CSS for animations */}
              <style>{`
                @keyframes shimmer {
                  0% { transform: translateX(-100%); }
                  50% { transform: translateX(100%); }
                  100% { transform: translateX(100%); }
                }
                @keyframes spin {
                  to { transform: rotate(360deg); }
                }
              `}</style>
            </button>
          </form>

          {/* Footer Info */}
          <div
            className="mt-6 pt-6 text-center text-xs"
            style={{
              color: "var(--text-3)",
              borderTop: "1px solid var(--border)",
            }}
          >
            <p>Private fund management ledger</p>
            <p className="mt-1">Restricted access only</p>
          </div>
        </div>
      </div>
    </div>
  );
}
