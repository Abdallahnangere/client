"use client";

import { useState } from "react";
import Link from "next/link";

export default function SettingsPage() {
  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [message, setMessage] = useState<{ type: "success" | "error"; text: string } | null>(null);
  const [loading, setLoading] = useState(false);

  const handleChangePassword = async (e: React.FormEvent) => {
    e.preventDefault();
    setMessage(null);
    setLoading(true);

    try {
      const response = await fetch("/api/auth/change-password", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          currentPassword,
          newPassword,
          confirmPassword,
        }),
      });

      const data = await response.json();

      if (!response.ok) {
        setMessage({ type: "error", text: data.error || "Failed to change password" });
        setLoading(false);
        return;
      }

      setMessage({ type: "success", text: "Password changed successfully! 🎉" });
      setCurrentPassword("");
      setNewPassword("");
      setConfirmPassword("");
      setLoading(false);
    } catch (err) {
      setMessage({ type: "error", text: "An error occurred. Please try again." });
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Breadcrumb */}
      <div className="flex items-center gap-2 mb-8 text-xs" style={{ color: "var(--text-3)" }}>
        <Link href="/" className="hover:opacity-70 transition-opacity" style={{ color: "var(--brand)" }}>
          Dashboard
        </Link>
        <span>&rsaquo;</span>
        <span style={{ color: "var(--text-2)" }}>Settings</span>
      </div>

      {/* Header */}
      <div className="mb-10">
        <div className="eyebrow">Account Settings</div>
        <h1
          className="font-display text-4xl font-light mt-3"
          style={{ color: "var(--text)", letterSpacing: "0.02em" }}
        >
          Security & Access
        </h1>
        <p className="mt-1 text-sm" style={{ color: "var(--text-2)" }}>
          Manage your account password and security settings
        </p>
      </div>

      {/* Change Password Card */}
      <div className="card max-w-md p-8">
        <h2 className="text-lg font-semibold mb-6" style={{ color: "var(--text)" }}>
          Change Password
        </h2>

        <form onSubmit={handleChangePassword} className="space-y-5">
          {/* Current Password */}
          <div>
            <label
              htmlFor="current-password"
              className="block text-xs font-semibold tracking-widest uppercase mb-2 transition-colors duration-200"
              style={{ color: currentPassword ? "var(--brand)" : "var(--text-2)" }}
            >
              Current Password
            </label>
            <div className="relative group">
              <input
                id="current-password"
                type="password"
                placeholder="Enter current password"
                value={currentPassword}
                onChange={(e) => {
                  setCurrentPassword(e.target.value);
                  if (message) setMessage(null);
                }}
                disabled={loading}
                className="input w-full transition-all duration-200"
                style={{
                  borderColor: currentPassword ? "var(--brand)" : "var(--border)",
                  boxShadow: currentPassword ? "0 0 0 3px rgba(27, 79, 216, 0.1)" : "none",
                  background: currentPassword ? "rgba(27, 79, 216, 0.02)" : "var(--surface)",
                }}
              />
            </div>
          </div>

          {/* New Password */}
          <div>
            <label
              htmlFor="new-password"
              className="block text-xs font-semibold tracking-widest uppercase mb-2 transition-colors duration-200"
              style={{ color: newPassword ? "var(--brand)" : "var(--text-2)" }}
            >
              New Password
            </label>
            <div className="relative group">
              <input
                id="new-password"
                type="password"
                placeholder="Enter new password (min 6 characters)"
                value={newPassword}
                onChange={(e) => {
                  setNewPassword(e.target.value);
                  if (message) setMessage(null);
                }}
                disabled={loading}
                className="input w-full transition-all duration-200"
                style={{
                  borderColor: newPassword ? "var(--brand)" : "var(--border)",
                  boxShadow: newPassword ? "0 0 0 3px rgba(27, 79, 216, 0.1)" : "none",
                  background: newPassword ? "rgba(27, 79, 216, 0.02)" : "var(--surface)",
                }}
              />
            </div>
          </div>

          {/* Confirm Password */}
          <div>
            <label
              htmlFor="confirm-password"
              className="block text-xs font-semibold tracking-widest uppercase mb-2 transition-colors duration-200"
              style={{ color: confirmPassword ? "var(--brand)" : "var(--text-2)" }}
            >
              Confirm Password
            </label>
            <div className="relative group">
              <input
                id="confirm-password"
                type="password"
                placeholder="Re-enter new password"
                value={confirmPassword}
                onChange={(e) => {
                  setConfirmPassword(e.target.value);
                  if (message) setMessage(null);
                }}
                disabled={loading}
                className="input w-full transition-all duration-200"
                style={{
                  borderColor: confirmPassword ? "var(--brand)" : "var(--border)",
                  boxShadow: confirmPassword ? "0 0 0 3px rgba(27, 79, 216, 0.1)" : "none",
                  background: confirmPassword ? "rgba(27, 79, 216, 0.02)" : "var(--surface)",
                }}
              />
            </div>
          </div>

          {/* Message */}
          {message && (
            <div
              className="p-4 rounded-lg text-sm font-medium animate-pulse"
              style={{
                background: message.type === "success" ? "rgba(34, 197, 94, 0.1)" : "rgba(239, 68, 68, 0.1)",
                color: message.type === "success" ? "var(--green)" : "var(--red)",
                border: `1px solid ${message.type === "success" ? "rgba(34, 197, 94, 0.2)" : "rgba(239, 68, 68, 0.2)"}`,
              }}
            >
              {message.text}
            </div>
          )}

          {/* Submit Button */}
          <button
            type="submit"
            disabled={loading || !currentPassword || !newPassword || !confirmPassword}
            className="relative w-full h-11 rounded-lg font-medium text-sm tracking-wide transition-all duration-300 overflow-hidden group"
            style={{
              background:
                loading || !currentPassword || !newPassword || !confirmPassword
                  ? "var(--brand-dim, rgba(27, 79, 216, 0.3))"
                  : "var(--brand)",
              color: "white",
              cursor: loading || !currentPassword || !newPassword || !confirmPassword ? "not-allowed" : "pointer",
              opacity: loading || !currentPassword || !newPassword || !confirmPassword ? 0.6 : 1,
              transform: loading || !currentPassword || !newPassword || !confirmPassword ? "scale(0.98)" : "scale(1)",
            }}
            onMouseEnter={(e) => {
              if (
                !loading &&
                currentPassword &&
                newPassword &&
                confirmPassword
              ) {
                (e.currentTarget as HTMLButtonElement).style.transform = "scale(1.02)";
                (e.currentTarget as HTMLButtonElement).style.boxShadow =
                  "0 8px 20px rgba(27, 79, 216, 0.35)";
              }
            }}
            onMouseLeave={(e) => {
              if (
                !loading &&
                currentPassword &&
                newPassword &&
                confirmPassword
              ) {
                (e.currentTarget as HTMLButtonElement).style.transform = "scale(1)";
                (e.currentTarget as HTMLButtonElement).style.boxShadow = "none";
              }
            }}
          >
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
                  <span>Updating...</span>
                </>
              ) : (
                <>
                  <span>Change Password</span>
                  <svg
                    width="16"
                    height="16"
                    viewBox="0 0 16 16"
                    fill="none"
                    className="transition-transform duration-300 group-hover:translate-x-1"
                    style={{
                      opacity:
                        currentPassword && newPassword && confirmPassword ? 1 : 0.5,
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

            <style>{`
              @keyframes spin {
                to { transform: rotate(360deg); }
              }
            `}</style>
          </button>
        </form>

        {/* Info */}
        <div
          className="mt-6 pt-6 text-xs text-center"
          style={{
            color: "var(--text-3)",
            borderTop: "1px solid var(--border)",
          }}
        >
          <p>Password must be at least 6 characters</p>
          <p className="mt-1">Passwords are securely hashed in the database</p>
        </div>
      </div>
    </div>
  );
}
