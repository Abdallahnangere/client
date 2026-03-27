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
                className="block text-xs font-semibold tracking-widest uppercase mb-2"
                style={{ color: "var(--text-2)" }}
              >
                Access Password
              </label>
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
                className="input w-full"
                style={{
                  borderColor: error ? "var(--red)" : "var(--border)",
                }}
              />
              {error && (
                <p className="mt-2 text-xs font-medium" style={{ color: "var(--red)" }}>
                  {error}
                </p>
              )}
            </div>

            {/* Submit Button */}
            <button
              type="submit"
              disabled={loading || !password}
              className="btn btn-primary w-full"
              style={{
                opacity: loading || !password ? 0.6 : 1,
                cursor: loading || !password ? "not-allowed" : "pointer",
              }}
            >
              {loading ? (
                <span className="flex items-center gap-2">
                  <span className="inline-block w-3 h-3 border-2 border-white/30 border-t-white rounded-full animate-spin"></span>
                  Verifying...
                </span>
              ) : (
                "Access System"
              )}
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
