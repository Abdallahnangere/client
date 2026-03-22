"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export default function EditPersonPage({
  params,
}: {
  params: { id: string };
}) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [fetching, setFetching] = useState(true);
  const [error, setError] = useState("");
  const [deleteConfirm, setDeleteConfirm] = useState(false);
  const [form, setForm] = useState({
    full_name: "",
    phone: "",
    email: "",
    notes: "",
  });

  useEffect(() => {
    fetch(`/api/persons/${params.id}`)
      .then((r) => r.json())
      .then((data) => {
        if (data.error) {
          router.push("/persons");
          return;
        }
        setForm({
          full_name: data.full_name || "",
          phone: data.phone || "",
          email: data.email || "",
          notes: data.notes || "",
        });
        setFetching(false);
      })
      .catch(() => router.push("/persons"));
  }, [params.id, router]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.full_name.trim()) {
      setError("Full name is required.");
      return;
    }

    setLoading(true);
    setError("");

    try {
      const res = await fetch(`/api/persons/${params.id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form),
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || "Failed to update client");
      }

      router.push(`/persons/${params.id}`);
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "An error occurred");
      setLoading(false);
    }
  };

  const handleDelete = async () => {
    setLoading(true);
    try {
      const res = await fetch(`/api/persons/${params.id}`, {
        method: "DELETE",
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || "Failed to delete client");
      }

      router.push("/persons");
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "An error occurred");
      setLoading(false);
      setDeleteConfirm(false);
    }
  };

  if (fetching) {
    return (
      <div className="min-h-screen p-6 lg:p-10 flex items-center justify-center">
        <div className="relative">
          <div className="w-10 h-10 rounded-full border-2" style={{ borderColor: "#152035" }} />
          <div className="absolute inset-0 w-10 h-10 rounded-full border-2 border-transparent animate-spin" style={{ borderTopColor: "#C8963C" }} />
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen p-6 lg:p-10">
      <div className="max-w-xl">
        {/* Breadcrumb */}
        <div className="flex items-center gap-2 mb-8 text-xs" style={{ color: "#3D5070" }}>
          <Link href="/persons" className="hover:text-[#C8963C] transition-colors">Clients</Link>
          <span>›</span>
          <Link href={`/persons/${params.id}`} className="hover:text-[#C8963C] transition-colors">
            {form.full_name ? form.full_name.split(" ").slice(0, 2).join(" ") : `Client #${params.id}`}
          </Link>
          <span>›</span>
          <span style={{ color: "#6B83A8" }}>Edit</span>
        </div>

        {/* Header */}
        <div className="mb-8">
          <div className="eyebrow">Fund Registry</div>
          <h1 className="font-display text-4xl font-light" style={{ color: "#E8EDF8", letterSpacing: "0.02em" }}>
            Edit Profile
          </h1>
          <p className="mt-1 text-sm" style={{ color: "#6B83A8" }}>
            Update client information
          </p>
        </div>

        <form onSubmit={handleSubmit}>
          <div className="card p-6 space-y-5">
            {error && (
              <div
                className="p-3 text-sm rounded-lg"
                style={{
                  background: "rgba(224,85,85,0.08)",
                  border: "1px solid rgba(224,85,85,0.2)",
                  color: "#E05555",
                }}
              >
                {error}
              </div>
            )}

            <div className="space-y-1.5">
              <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                Full Name <span style={{ color: "#E05555" }}>*</span>
              </label>
              <input
                className="input"
                type="text"
                value={form.full_name}
                onChange={(e) => setForm({ ...form, full_name: e.target.value })}
                onBlur={(e) => setForm({ ...form, full_name: e.target.value.toUpperCase() })}
                required
                style={{ textTransform: "uppercase" }}
              />
            </div>

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

            <div className="space-y-1.5">
              <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                Notes / Account Numbers
              </label>
              <textarea
                className="input resize-none"
                rows={4}
                value={form.notes}
                onChange={(e) => setForm({ ...form, notes: e.target.value })}
              />
            </div>

            <div className="h-px" style={{ background: "linear-gradient(90deg, transparent, #1E3050, transparent)" }} />

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
                    Saving…
                  </>
                ) : "Save Changes"}
              </button>
              <Link href={`/persons/${params.id}`} className="btn btn-outline">
                Cancel
              </Link>
            </div>
          </div>
        </form>

        {/* Danger zone */}
        <div className="card p-5 mt-6" style={{ borderColor: "rgba(224,85,85,0.15)" }}>
          <div
            className="absolute top-0 left-0 right-0 h-px"
            style={{ background: "linear-gradient(90deg, transparent, rgba(224,85,85,0.3), transparent)" }}
          />
          <h3 className="text-[11px] font-semibold tracking-widest uppercase mb-1" style={{ color: "#E05555" }}>
            Danger Zone
          </h3>
          <p className="text-xs mb-4" style={{ color: "#6B83A8" }}>
            Deleting a client is permanent and will remove all associated transactions.
          </p>
          {deleteConfirm ? (
            <div className="space-y-3">
              <p className="text-xs font-medium" style={{ color: "#E05555" }}>
                Are you absolutely sure? All transaction history will be permanently deleted.
              </p>
              <div className="flex gap-3">
                <button
                  onClick={handleDelete}
                  disabled={loading}
                  className="btn btn-danger"
                >
                  {loading ? "Deleting…" : "Yes, Delete Permanently"}
                </button>
                <button
                  onClick={() => setDeleteConfirm(false)}
                  className="btn btn-outline"
                >
                  Cancel
                </button>
              </div>
            </div>
          ) : (
            <button
              onClick={() => setDeleteConfirm(true)}
              className="btn btn-danger"
            >
              <svg width="13" height="13" viewBox="0 0 13 13" fill="none">
                <path d="M1 3h11M4 3V1.5h5V3M5 5.5v4M8 5.5v4M2 3l.5 8h8l.5-8" stroke="currentColor" strokeWidth="1.1" strokeLinecap="square" />
              </svg>
              Delete Client
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
