"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";

interface Props {
  txId: number;
  currentType: "CREDIT" | "DEBIT";
}

export default function ToggleTxType({ txId, currentType }: Props) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);

  const handleToggle = async () => {
    const nextType = currentType === "DEBIT" ? "CREDIT" : "DEBIT";
    if (!confirm(`Change this transaction from ${currentType} to ${nextType}?`)) return;

    setLoading(true);
    try {
      const res = await fetch(`/api/transactions/${txId}`, { method: "PATCH" });
      if (res.ok) router.refresh();
    } finally {
      setLoading(false);
    }
  };

  const isDebit = currentType === "DEBIT";

  return (
    <button
      type="button"
      onClick={handleToggle}
      disabled={loading}
      title={`Toggle to ${isDebit ? "CREDIT" : "DEBIT"}`}
      className="transition-all inline-flex items-center gap-1 px-1.5 py-0.5 rounded text-[9px] font-semibold tracking-wide border"
      style={{
        color: isDebit ? "#E05555" : "#2ECC8E",
        borderColor: isDebit ? "#E05555" : "#2ECC8E",
        background: isDebit ? "rgba(224,85,85,0.08)" : "rgba(46,204,142,0.08)",
        opacity: loading ? 0.5 : undefined,
        cursor: loading ? "wait" : "pointer",
      }}
    >
      {/* swap arrows */}
      <svg width="8" height="8" viewBox="0 0 8 8" fill="currentColor">
        <path d="M1 3h5L4 1M7 5H2l2 2" />
      </svg>
      {currentType}
    </button>
  );
}
