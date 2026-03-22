"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

interface Props {
  personId: number;
  personName: string;
}

type TxType = "CREDIT" | "DEBIT";

const emptyForm = {
  type: "DEBIT" as TxType,
  amount: "",
  sender: "",
  receiver: "",
  transaction_date: new Date().toISOString().slice(0, 16),
  bank: "",
  reference_number: "",
  status: "SUCCESSFUL",
  note: "",
};

export default function TransactionActions({ personId, personName }: Props) {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [form, setForm] = useState(emptyForm);

  const openModal = (type: TxType) => {
    setForm({
      ...emptyForm,
      type,
      transaction_date: new Date().toISOString().slice(0, 16),
      sender: type === "DEBIT" ? "MAHMOUD IBRAHIM WADA" : "",
      receiver: type === "DEBIT" ? personName : "MAHMOUD IBRAHIM WADA",
    });
    setError("");
    setOpen(true);
  };

  const closeModal = () => {
    setOpen(false);
    setError("");
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.amount || isNaN(parseFloat(form.amount)) || parseFloat(form.amount) <= 0) {
      setError("Please enter a valid amount greater than zero.");
      return;
    }
    if (!form.sender.trim() || !form.receiver.trim()) {
      setError("Sender and receiver are required.");
      return;
    }

    setLoading(true);
    setError("");

    try {
      const res = await fetch("/api/transactions", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          person_id: personId,
          ...form,
          amount: parseFloat(form.amount),
          transaction_date: new Date(form.transaction_date).toISOString(),
        }),
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || "Failed to record transaction");
      }

      closeModal();
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "An error occurred");
    } finally {
      setLoading(false);
    }
  };

  const isCredit = form.type === "CREDIT";

  return (
    <>
      {/* Action Buttons */}
      <button
        onClick={() => openModal("DEBIT")}
        className="btn btn-debit"
      >
        <svg width="13" height="13" viewBox="0 0 13 13" fill="none">
          <path d="M6.5 1v11M1 6.5h11" stroke="currentColor" strokeWidth="1.6" strokeLinecap="square" style={{ transform: "rotate(45deg)", transformOrigin: "center" }} />
          <path d="M1 6.5h11" stroke="currentColor" strokeWidth="1.6" strokeLinecap="square" />
          <path d="M3.5 3.5L9.5 9.5" stroke="currentColor" strokeWidth="1.6" strokeLinecap="square" />
        </svg>
        Record Debit
      </button>
      <button
        onClick={() => openModal("CREDIT")}
        className="btn btn-credit"
      >
        <svg width="13" height="13" viewBox="0 0 13 13" fill="none">
          <path d="M6.5 1v11M1 6.5h11" stroke="currentColor" strokeWidth="1.6" strokeLinecap="square" />
        </svg>
        Record Credit
      </button>

      {/* Modal */}
      {open && (
        <div className="modal-overlay" onClick={(e) => e.target === e.currentTarget && closeModal()}>
          <div className="modal-panel">
            {/* Modal Header */}
            <div
              className="px-6 py-5 flex items-start justify-between"
              style={{ borderBottom: "1px solid #152035" }}
            >
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <div
                    className="w-2 h-2 rounded-full"
                    style={{ background: isCredit ? "#2ECC8E" : "#E05555" }}
                  />
                  <span
                    className="text-[10px] font-semibold tracking-widest uppercase"
                    style={{ color: isCredit ? "#2ECC8E" : "#E05555" }}
                  >
                    {isCredit ? "Credit Transaction" : "Debit Transaction"}
                  </span>
                </div>
                <h2
                  className="font-display text-2xl font-light"
                  style={{ color: "#E8EDF8" }}
                >
                  {isCredit ? "Record Inflow" : "Record Outflow"}
                </h2>
                <p className="text-xs mt-0.5" style={{ color: "#6B83A8" }}>
                  {isCredit
                    ? "Money received INTO the fund from this client"
                    : "Money paid OUT from the fund to this client"}
                </p>
              </div>
              <button
                onClick={closeModal}
                className="btn btn-ghost p-2 mt-1"
                style={{ color: "#6B83A8" }}
              >
                <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                  <path d="M1 1l12 12M13 1L1 13" stroke="currentColor" strokeWidth="1.4" strokeLinecap="square" />
                </svg>
              </button>
            </div>

            {/* Ledger logic hint */}
            <div
              className="mx-6 mt-4 p-3 rounded-lg text-xs"
              style={{
                background: isCredit ? "rgba(46,204,142,0.06)" : "rgba(224,85,85,0.06)",
                border: `1px solid ${isCredit ? "rgba(46,204,142,0.15)" : "rgba(224,85,85,0.15)"}`,
                color: isCredit ? "#2ECC8E99" : "#E0555599",
              }}
            >
              {isCredit
                ? "CREDIT: Wada is the receiver — client is depositing capital into the fund"
                : "DEBIT: Wada is the sender — fund is disbursing capital to or for the client"}
            </div>

            {/* Form */}
            <form onSubmit={handleSubmit} className="p-6 space-y-4">
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

              {/* Amount */}
              <div className="space-y-1.5">
                <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                  Amount (₦) <span style={{ color: "#E05555" }}>*</span>
                </label>
                <div className="relative">
                  <span
                    className="absolute left-3 top-1/2 -translate-y-1/2 font-mono text-sm"
                    style={{ color: "#6B83A8" }}
                  >
                    ₦
                  </span>
                  <input
                    className="input pl-7"
                    type="number"
                    step="0.01"
                    min="0.01"
                    placeholder="0.00"
                    value={form.amount}
                    onChange={(e) => setForm({ ...form, amount: e.target.value })}
                    required
                    autoFocus
                    style={{ fontFamily: "var(--font-ibm-mono)" }}
                  />
                </div>
              </div>

              {/* Date */}
              <div className="space-y-1.5">
                <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                  Transaction Date & Time <span style={{ color: "#E05555" }}>*</span>
                </label>
                <input
                  className="input"
                  type="datetime-local"
                  value={form.transaction_date}
                  onChange={(e) => setForm({ ...form, transaction_date: e.target.value })}
                  required
                />
              </div>

              {/* Sender / Receiver */}
              <div className="grid grid-cols-2 gap-3">
                <div className="space-y-1.5">
                  <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                    Sender <span style={{ color: "#E05555" }}>*</span>
                  </label>
                  <input
                    className="input"
                    type="text"
                    placeholder="Who sent the money"
                    value={form.sender}
                    onChange={(e) => setForm({ ...form, sender: e.target.value.toUpperCase() })}
                    required
                    style={{ textTransform: "uppercase", fontSize: "0.75rem" }}
                  />
                </div>
                <div className="space-y-1.5">
                  <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                    Receiver <span style={{ color: "#E05555" }}>*</span>
                  </label>
                  <input
                    className="input"
                    type="text"
                    placeholder="Who received the money"
                    value={form.receiver}
                    onChange={(e) => setForm({ ...form, receiver: e.target.value.toUpperCase() })}
                    required
                    style={{ textTransform: "uppercase", fontSize: "0.75rem" }}
                  />
                </div>
              </div>

              {/* Bank */}
              <div className="space-y-1.5">
                <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                  Bank / Platform
                </label>
                <input
                  className="input"
                  type="text"
                  placeholder="e.g. TAJBank → OPay, Kuda → Fidelity"
                  value={form.bank}
                  onChange={(e) => setForm({ ...form, bank: e.target.value })}
                />
              </div>

              {/* Reference */}
              <div className="space-y-1.5">
                <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                  Reference Number
                </label>
                <input
                  className="input font-mono text-xs"
                  type="text"
                  placeholder="Transaction reference / session ID"
                  value={form.reference_number}
                  onChange={(e) => setForm({ ...form, reference_number: e.target.value })}
                />
              </div>

              {/* Status */}
              <div className="space-y-1.5">
                <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                  Status
                </label>
                <select
                  className="input"
                  value={form.status}
                  onChange={(e) => setForm({ ...form, status: e.target.value })}
                  style={{
                    background: "#07101C",
                    color: "#E8EDF8",
                    appearance: "none",
                    backgroundImage: `url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath d='M2 4l4 4 4-4' stroke='%236B83A8' strokeWidth='1.2' fill='none' strokeLinecap='square'/%3E%3C/svg%3E")`,
                    backgroundRepeat: "no-repeat",
                    backgroundPosition: "right 12px center",
                    paddingRight: "36px",
                  }}
                >
                  <option value="SUCCESSFUL">Successful</option>
                  <option value="PENDING">Pending</option>
                  <option value="FAILED">Failed</option>
                  <option value="REVERSED">Reversed</option>
                </select>
              </div>

              {/* Note */}
              <div className="space-y-1.5">
                <label className="block text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
                  Note
                </label>
                <textarea
                  className="input resize-none"
                  rows={2}
                  placeholder="Additional notes or context"
                  value={form.note}
                  onChange={(e) => setForm({ ...form, note: e.target.value })}
                />
              </div>

              <div
                className="h-px"
                style={{ background: "linear-gradient(90deg, transparent, #1E3050, transparent)" }}
              />

              <div className="flex gap-3">
                <button
                  type="submit"
                  className={`btn flex-1 ${isCredit ? "btn-credit" : "btn-debit"}`}
                  disabled={loading}
                >
                  {loading ? (
                    <>
                      <svg className="animate-spin" width="14" height="14" viewBox="0 0 14 14" fill="none">
                        <circle cx="7" cy="7" r="5" stroke="currentColor" strokeWidth="1.5" strokeDasharray="20 10" />
                      </svg>
                      Recording…
                    </>
                  ) : (
                    <>
                      {isCredit ? "Record Credit" : "Record Debit"}
                    </>
                  )}
                </button>
                <button type="button" onClick={closeModal} className="btn btn-outline">
                  Cancel
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </>
  );
}
