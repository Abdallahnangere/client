"use client";

import { useState, useMemo } from "react";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import ToggleTxType from "./ToggleTxType";
import DeleteTxButton from "./DeleteTxButton";
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
}

interface PersonTransactionsProps {
  transactions: Transaction[];
}

function monthKey(date: string | null): string {
  if (!date) return "undated";
  const d = new Date(date);
  return d.getFullYear() + "-" + String(d.getMonth() + 1).padStart(2, "0");
}

function monthLabel(key: string): string {
  if (key === "undated") return "Date Unknown";
  const [year, month] = key.split("-");
  return new Date(parseInt(year), parseInt(month) - 1, 1).toLocaleDateString("en-GB", {
    month: "long",
    year: "numeric",
  });
}

export default function PersonTransactions({ transactions }: PersonTransactionsProps) {
  const [query, setQuery] = useState("");

  const filtered = useMemo(() => {
    if (!query.trim()) return transactions;
    const q = query.toLowerCase();
    return transactions.filter(
      (tx) =>
        tx.id.toString().includes(q) ||
        tx.sender.toLowerCase().includes(q) ||
        tx.receiver.toLowerCase().includes(q) ||
        (tx.bank || "").toLowerCase().includes(q) ||
        (tx.reference_number || "").toLowerCase().includes(q) ||
        tx.amount.toString().includes(q) ||
        tx.type.toLowerCase().includes(q)
    );
  }, [query, transactions]);

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

  return (
    <div>
      {/* Search bar */}
      <div className="px-6 pt-4 pb-0">
        <input
          type="text"
          placeholder="Search by ID, sender, receiver, bank, reference, amount..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          className="input w-full"
        />
        {query && (
          <p className="mt-2 text-xs" style={{ color: "var(--text-3)" }}>
            Showing {filtered.length} of {transactions.length} transactions
          </p>
        )}
      </div>

      {/* Results */}
      {filtered.length === 0 ? (
        <div className="flex flex-col items-center justify-center py-16">
          <p className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>No matching transactions</p>
          <p className="text-xs mt-1" style={{ color: "var(--text-3)" }}>Try a different search term</p>
        </div>
      ) : (
        <div>
          {months.map((month) => {
            const txs = grouped[month];
            const inflow = txs.reduce((s, t) => t.type === "CREDIT" ? s + parseFloat(String(t.amount)) : s, 0);
            const outflow = txs.reduce((s, t) => t.type === "DEBIT" ? s + parseFloat(String(t.amount)) : s, 0);

            return (
              <div key={month}>
                {/* Month header */}
                <div
                  className="px-6 py-3 flex items-center justify-between"
                  style={{ background: "var(--surface-2)", borderBottom: "1px solid var(--border)" }}
                >
                  <span
                    className="text-xs font-semibold tracking-widest uppercase"
                    style={{ color: "var(--text-2)" }}
                  >
                    {monthLabel(month)}
                  </span>
                  <div className="flex items-center gap-4 text-xs font-mono">
                    {inflow > 0 && (
                      <span style={{ color: "var(--green)" }}>+{formatCurrency(inflow)}</span>
                    )}
                    {outflow > 0 && (
                      <span style={{ color: "var(--red)" }}>-{formatCurrency(outflow)}</span>
                    )}
                  </div>
                </div>

                {/* Transactions */}
                <ScrollableTable>
                  <table className="data-table">
                    <thead>
                      <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Sender</th>
                        <th>Receiver</th>
                        <th style={{ textAlign: "right" }}>Amount</th>
                        <th>Bank</th>
                        <th>Reference</th>
                        <th>Status</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      {txs.map((tx) => (
                        <tr key={tx.id}>
                          <td>
                            <span className="font-mono text-xs" style={{ color: "var(--text-2)" }}>
                              {formatDateTime(tx.transaction_date)}
                            </span>
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
                                {tx.reference_number.slice(0, 16)}{tx.reference_number.length > 16 ? "..." : ""}
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
                            <div className="flex items-center gap-1">
                              <ToggleTxType txId={tx.id} currentType={tx.type as "CREDIT" | "DEBIT"} />
                              <DeleteTxButton txId={tx.id} />
                            </div>
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
    </div>
  );
}