"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export default function NewPersonPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [form, setForm] = useState({
    full_name: "",
    phone: "",
    email: "",
    notes: "",
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.full_name.trim()) {
      setError("Full name is required.");
      return;
    }

    setLoading(true);
    setError("");

    try {
      const res = await fetch("/api/persons", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form),
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || "Failed to create client");
      }

      const person = await res.json();
      router.push(`/persons/${person.id}`);
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "An error occurred");
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen p-6 lg:p-10">
      <div className="max-w-xl">
        {/* Breadcrumb */}
        <div className="flex items-center gap-2 mb-8 text-xs" style={{ color: "#3D5070" }}>
          <Link href="/persons" className="hover:text-[#C8963C] transition-colors">
            Clients
          </Link>
          <span>›</span>
          <span style={{ color: "#6B83A8" }}>New Client</span>
        </div>

        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center gap-2 mb-2">
            <div className="w-4 h-px" style={{ background: "linear-gradient(90deg, #C8963C, transparent)" }} />
            <span className="text-[10px] font-semibold tracking-widest uppercase" style={{ color: "#C8963C" }}>
              Fund Registry
            </span>
          </div>
          <h1 className="font-display text-4xl font-light" style={{ color: "#E8EDF8", letterSpacing: "0.02em" }}>
            Register Client
          </h1>
          <p className="mt-1 text-sm" style={{ color: "#6B83A8" }}>
            Add a new client to the fund ledger
          </p>
        </div>

        <form onSubmit={handleSubmit}>
          <div className="card p-6 space-y-5">
            {error && (
              <div
                className="p-3 text-sm rounded-[2px]"
                style={{
                  background: "rgba(224,85,85,0.08)",
                  border: "1px solid rgba(224,85,85,0.2)",
                  color: "#E05555",
                }}
              >
                {error}
              </div>
            )}

            {/* Full Name */}
            <div className="space-y-1.5">
              <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                Full Name <span style={{ color: "#E05555" }}>*</span>
              </label>
              <input
                className="input"
                type="text"
                placeholder="e.g. SAID ABDULLAHI ABDULMUDALLIB"
                value={form.full_name}
                onChange={(e) => setForm({ ...form, full_name: e.target.value })}
                required
                autoFocus
                style={{ textTransform: "uppercase" }}
                onBlur={(e) => setForm({ ...form, full_name: e.target.value.toUpperCase() })}
              />
              <p className="text-[10px]" style={{ color: "#3D5070" }}>Enter in uppercase as appears on bank documents</p>
            </div>

            {/* Phone */}
            <div className="space-y-1.5">
              <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                Phone Number
              </label>
              <input
                className="input"
                type="tel"
                placeholder="08000000000"
                value={form.phone}
                onChange={(e) => setForm({ ...form, phone: e.target.value })}
              />
            </div>

            {/* Email */}
            <div className="space-y-1.5">
              <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                Email Address
              </label>
              <input
                className="input"
                type="email"
                placeholder="client@email.com"
                value={form.email}
                onChange={(e) => setForm({ ...form, email: e.target.value })}
              />
            </div>

            {/* Notes */}
            <div className="space-y-1.5">
              <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                Notes / Account Numbers
              </label>
              <textarea
                className="input resize-none"
                rows={4}
                placeholder="OPay: 8xxxxxxxxx | Fidelity: xxxxxxxxxx | FCMB: xxxxxxxxxx"
                value={form.notes}
                onChange={(e) => setForm({ ...form, notes: e.target.value })}
              />
              <p className="text-[10px]" style={{ color: "#3D5070" }}>
                Record bank accounts, OPay numbers, and other relevant details
              </p>
            </div>

            <div
              className="h-px"
              style={{ background: "linear-gradient(90deg, transparent, #1E3050, transparent)" }}
            />

            <div className="flex gap-3">
              <button
                type="submit"
                className="btn btn-gold flex-1"
                disabled={loading}
              >
                {loading ? (
                  <>
                    <svg className="animate-spin" width="14" height="14" viewBox="0 0 14 14" fill="none">
                      <circle cx="7" cy="7" r="5" stroke="currentColor" strokeWidth="1.5" strokeDasharray="20 10" />
                    </svg>
                    Registering…
                  </>
                ) : (
                  "Register Client"
                )}
              </button>
              <Link href="/persons" className="btn btn-outline">
                Cancel
              </Link>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}
