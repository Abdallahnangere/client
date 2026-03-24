"use client";

import { useState, useMemo } from "react";
import { useRouter } from "next/navigation";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import ToggleTxType from "@/app/persons/[id]/ToggleTxType";
import DeleteTxButton from "@/app/persons/[id]/DeleteTxButton";
import ScrollableTable from "@/components/ui/ScrollableTable";

interface Transaction {
  id: number;
  transaction_date: string | null;
  type: string;
  amount: string | number;
  sender: string;
  receiver: string;
  bank: string | null;
  reference_number: string | null;
  status: string;
  note: string | null;
  person_id: number;
  person_name: string;
}

interface LedgerContentProps {
  allTx: Transaction[];
}

function monthLabel(key: string): string {
  if (key === "undated") return "Date Unknown";
  const [year, month] = key.split("-");
  return new Date(parseInt(year), parseInt(month) - 1, 1).toLocaleDateString("en-GB", {
    month: "long",
    year: "numeric",
  });
}

function monthKey(date: string | null): string {
  if (!date) return "undated";
  const d = new Date(date);
  return d.getFullYear() + "-" + String(d.getMonth() + 1).padStart(2, "0");
}

export default function LedgerContent({ allTx }: LedgerContentProps) {
  const router = useRouter();
  const [query, setQuery] = useState("");
  const [selectMode, setSelectMode] = useState(false);
  const [selectedIds, setSelectedIds] = useState<Set<number>>(new Set());
  const [deleting, setDeleting] = useState(false);

  const filtered = useMemo(() => {
    if (!query.trim()) return allTx;
    const q = query.toLowerCase();
    return allTx.filter(
      (tx) =>
        tx.id.toString().includes(q) ||
        tx.sender.toLowerCase().includes(q) ||
        tx.receiver.toLowerCase().includes(q) ||
        (tx.bank || "").toLowerCase().includes(q) ||
        (tx.reference_number || "").toLowerCase().includes(q) ||
        (tx.person_name || "").toLowerCase().includes(q) ||
        tx.amount.toString().includes(q) ||
        tx.type.toLowerCase().includes(q)
    );
  }, [query, allTx]);

  const grouped = useMemo(() => {
    const g: Record<string, Transaction[]> = {};
    for (const tx of filtered) {
      const k = monthKey(tx.transaction_date);
      if (!g[k]) g[k] = [];
      g[k].push(tx);
    }
    return g;
  }, [filtered]);

  const months = useMemo(
    () => Object.keys(grouped).sort().reverse(),
    [grouped]
  );

  function toggleSelect(id: number) {
    setSelectedIds((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  }

  function toggleMonthAll(txs: Transaction[]) {
    const ids = txs.map((t) => t.id);
    const allSelected = ids.every((id) => selectedIds.has(id));
    setSelectedIds((prev) => {
      const next = new Set(prev);
      if (allSelected) ids.forEach((id) => next.delete(id));
      else ids.forEach((id) => next.add(id));
      return next;
    });
  }

  function exitSelectMode() {
    setSelectMode(false);
    setSelectedIds(new Set());
  }

  async function handleBatchDelete() {
    if (selectedIds.size === 0) return;
    const count = selectedIds.size;
    if (!confirm(`Delete ${count} transaction${count > 1 ? "s" : ""}? This cannot be undone.`)) return;
    setDeleting(true);
    try {
      const res = await fetch("/api/transactions/batch-delete", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ids: Array.from(selectedIds) }),
      });
      if (!res.ok) throw new Error("Failed");
      exitSelectMode();
      router.refresh();
    } catch {
      alert("Failed to delete transactions. Please try again.");
    } finally {
      setDeleting(false);
    }
  }

  return (
    <div style={{ position: "relative", paddingBottom: selectedIds.size > 0 ? "72px" : undefined }}>
      {/* Search bar */}
      <div className="mb-6 flex items-start gap-3">
        <input
          type="text"
          placeholder="Search by ID, client, sender, receiver, bank, reference, amount..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          className="input w-full"
        />
        <button
          onClick={() => { if (selectMode) exitSelectMode(); else setSelectMode(true); }}
          style={{
            flexShrink: 0,
            padding: "8px 14px",
            fontSize: "12px",
            fontWeight: 600,
            borderRadius: "6px",
            border: "1px solid var(--border)",
            background: selectMode ? "var(--surface-2)" : "transparent",
            color: selectMode ? "var(--red)" : "var(--text-2)",
            cursor: "pointer",
            whiteSpace: "nowrap",
          }}
        >
          {selectMode ? "Cancel" : "Select"}
        </button>
        {query && (
          <p className="mt-2 text-sm" style={{ color: "var(--text-3)" }}>
            Showing {filtered.length} of {allTx.length} transactions
          </p>
        )}
      </div>

      {/* Results */}
      {filtered.length === 0 ? (
        <div className="card flex flex-col items-center justify-center py-16">
          <p className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>No matching transactions</p>
          <p className="text-xs mt-1" style={{ color: "var(--text-3)" }}>Try a different search term</p>
        </div>
      ) : (
        <div className="space-y-4">
          {months.map((month) => {
            const txs = grouped[month];
            const inflow = txs.reduce((s, t) => t.type === "CREDIT" ? s + parseFloat(String(t.amount)) : s, 0);
            const outflow = txs.reduce((s, t) => t.type === "DEBIT" ? s + parseFloat(String(t.amount)) : s, 0);
            const net = inflow - outflow;
            const monthIds = txs.map((t) => t.id);
            const allMonthSelected = selectMode && monthIds.length > 0 && monthIds.every((id) => selectedIds.has(id));
            const someMonthSelected = selectMode && monthIds.some((id) => selectedIds.has(id));

            return (
              <div key={month} className="card overflow-hidden">
                {/* Month header */}
                <div
                  className="px-6 py-3 flex items-center justify-between"
                  style={{ background: "var(--surface-2)", borderBottom: "1px solid var(--border)" }}
                >
                  <div className="flex items-center gap-3">
                    {selectMode && (
                      <input
                        type="checkbox"
                        checked={allMonthSelected}
                        ref={(el) => { if (el) el.indeterminate = someMonthSelected && !allMonthSelected; }}
                        onChange={() => toggleMonthAll(txs)}
                        style={{ width: "15px", height: "15px", cursor: "pointer", accentColor: "var(--accent)" }}
                        title="Select all in this month"
                      />
                    )}
                    <span
                      className="text-xs font-semibold tracking-widest uppercase"
                      style={{ color: "var(--text-2)" }}
                    >
                      {monthLabel(month)}
                    </span>
                  </div>
                  <div className="flex items-center gap-4 text-xs font-mono">
                    {inflow > 0 && (
                      <span style={{ color: "var(--green)" }}>+{formatCurrency(inflow)}</span>
                    )}
                    {outflow > 0 && (
                      <span style={{ color: "var(--red)" }}>-{formatCurrency(outflow)}</span>
                    )}
                    <span
                      style={{
                        color: net >= 0 ? "var(--green)" : "var(--red)",
                        borderLeft: "1px solid var(--border)",
                        paddingLeft: "1rem",
                      }}
                    >
                      Net: {net >= 0 ? "+" : "-"}{formatCurrency(Math.abs(net))}
                    </span>
                  </div>
                </div>

                {/* Table */}
                <ScrollableTable>
                  <table className="data-table">
                    <thead>
                      <tr>
                        {selectMode && <th style={{ width: "36px" }}></th>}
                        <th>Date</th>
                        <th>Client</th>
                        <th>Type</th>
                        <th>Sender</th>
                        <th>Receiver</th>
                        <th style={{ textAlign: "right" }}>Amount</th>
                        <th>Bank</th>
                        <th>Reference</th>
                        <th>Status</th>
                        <th>Note</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      {txs.map((tx) => (
                        <tr
                          key={tx.id}
                          className="group"
                          style={selectedIds.has(tx.id) ? { background: "rgba(239,68,68,0.06)" } : undefined}
                        >
                          {selectMode && (
                            <td>
                              <input
                                type="checkbox"
                                checked={selectedIds.has(tx.id)}
                                onChange={() => toggleSelect(tx.id)}
                                style={{ width: "15px", height: "15px", cursor: "pointer", accentColor: "var(--accent)" }}
                              />
                            </td>
                          )}
                          <td>
                            <span className="font-mono text-xs" style={{ color: "var(--text-2)" }}>
                              {formatDateTime(tx.transaction_date)}
                            </span>
                          </td>
                          <td>
                            <Link
                              href={"/persons/" + tx.person_id}
                              className="text-xs font-medium hover:opacity-70 transition-opacity"
                              style={{ color: "var(--brand)" }}
                            >
                              {toTitleCase(tx.person_name).split(" ").slice(0, 2).join(" ")}
                            </Link>
                          </td>
                          <td>
                            <span className={"badge badge-" + tx.type.toLowerCase()}>
                              {tx.type}
                            </span>
                          </td>
                          <td>
                            <span className="text-xs" style={{ color: "var(--text)" }}>
                              {toTitleCase(tx.sender)}
                            </span>
                          </td>
                          <td>
                            <span className="text-xs" style={{ color: "var(--text)" }}>
                              {toTitleCase(tx.receiver)}
                            </span>
                          </td>
                          <td style={{ textAlign: "right" }}>
                            <span
                              className="font-mono text-sm font-medium"
                              style={{ color: tx.type === "CREDIT" ? "var(--green)" : "var(--red)" }}
                            >
                              {tx.type === "CREDIT" ? "+" : "-"}{formatCurrency(tx.amount)}
                            </span>
                          </td>
                          <td>
                            <span className="text-xs" style={{ color: "var(--text-2)" }}>
                              {tx.bank || "-"}
                            </span>
                          </td>
                          <td>
                            {tx.reference_number ? (
                              <span className="font-mono text-xs" style={{ color: "var(--text-3)" }}>
                                {tx.reference_number.slice(0, 14)}{tx.reference_number.length > 14 ? "..." : ""}
                              </span>
                            ) : (
                              <span style={{ color: "var(--text-3)" }}>-</span>
                            )}
                          </td>
                          <td>
                            <span className="badge badge-success text-xs">
                              {tx.status}
                            </span>
                          </td>
                          <td>
                            {tx.note ? (
                              <span
                                className="text-xs max-w-[160px] truncate block"
                                style={{ color: "var(--text-2)" }}
                                title={tx.note}
                              >
                                {tx.note}
                              </span>
                            ) : (
                              <span style={{ color: "var(--text-3)" }}>-</span>
                            )}
                          </td>
                          <td>
                            {!selectMode && (
                              <div className="flex items-center gap-1">
                                <ToggleTxType txId={tx.id} currentType={tx.type as "CREDIT" | "DEBIT"} />
                                <DeleteTxButton txId={tx.id} />
                              </div>
                            )}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </ScrollableTable>
              </div>
            );
          })}
        </div>
      )}

      {selectMode && selectedIds.size > 0 && (
        <div
          style={{
            position: "fixed",
            bottom: "24px",
            left: "50%",
            transform: "translateX(-50%)",
            zIndex: 50,
            display: "flex",
            alignItems: "center",
            gap: "12px",
            padding: "12px 20px",
            borderRadius: "10px",
            background: "var(--surface)",
            border: "1px solid var(--border)",
            boxShadow: "0 8px 32px rgba(0,0,0,0.25)",
          }}
        >
          <span style={{ fontSize: "13px", fontWeight: 500, color: "var(--text)" }}>
            {selectedIds.size} selected
          </span>
          <button
            onClick={handleBatchDelete}
            disabled={deleting}
            style={{
              padding: "7px 16px",
              fontSize: "13px",
              fontWeight: 600,
              borderRadius: "6px",
              border: "none",
              background: "var(--red)",
              color: "#fff",
              cursor: deleting ? "not-allowed" : "pointer",
              opacity: deleting ? 0.6 : 1,
            }}
          >
            {deleting ? "Deleting..." : "Delete Selected"}
          </button>
          <button
            onClick={exitSelectMode}
            style={{
              padding: "7px 12px",
              fontSize: "13px",
              borderRadius: "6px",
              border: "1px solid var(--border)",
              background: "transparent",
              color: "var(--text-2)",
              cursor: "pointer",
            }}
          >
            Cancel
          </button>
        </div>
      )}
    </div>
  );
}