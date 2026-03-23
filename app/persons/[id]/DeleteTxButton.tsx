"use client";

import { useRouter } from "next/navigation";

export default function DeleteTxButton({ txId }: { txId: number }) {
  const router = useRouter();

  const handleDelete = async () => {
    if (!confirm("Delete this transaction? This cannot be undone.")) return;

    const res = await fetch(`/api/transactions/${txId}`, { method: "DELETE" });
    if (res.ok) {
      router.refresh();
    }
  };

  return (
    <button
      type="button"
      onClick={handleDelete}
      className="btn btn-ghost p-1.5 hover:text-[#E05555] transition-all"
      title="Delete transaction"
    >
      <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
        <path d="M1 3h10M4 3V1.5h4V3M4.5 5v4.5M7.5 5v4.5M2 3l.5 7.5h7L10 3" stroke="currentColor" strokeWidth="1" strokeLinecap="square" />
      </svg>
    </button>
  );
}
