"use client";

import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import ToggleTxType from "@/app/persons/[id]/ToggleTxType";
import ScrollableTable from "@/components/ui/ScrollableTable";
import SearchTransactions from "@/components/ui/SearchTransactions";

interface Transaction {
  id: number;
  transaction_date: string | null;
  type: "CREDIT" | "DEBIT";
  amount: number;
  sender: string;
  receiver: string;
  bank: string | null;
  reference_number: string | null;
  status: string;
  note: string | null;
  person_id: number;
  person_name: string;
}

interface GroupedTxProps {
  allTx: Transaction[];
  grouped: Record<string, Transaction[]>;
  months: string[];
  monthLabel: (key: string) => string;
}

export default function LedgerContent({
  allTx,
  grouped,
  months,
  monthLabel,
}: GroupedTxProps) {
  return (
    <SearchTransactions transactions={allTx}>
      {(filtered) => (
        <div className="space-y-4">
          {months.map((month) => {
            const txs = grouped[month].filter((tx) =>
              filtered.some((f) => f.id === tx.id)
            );
            if (txs.length === 0) return null;

            const monthInflow = txs.reduce(
              (s, t) => (t.type === "CREDIT" ? s + parseFloat(t.amount.toString()) : s),
              0
            );
            const monthOutflow = txs.reduce(
              (s, t) => (t.type === "DEBIT" ? s + parseFloat(t.amount.toString()) : s),
              0
            );
            const monthNet = monthInflow - monthOutflow;

            return (
              <div key={month} className="card overflow-hidden">
                {/* Month header */}
                <div
                  className="px-6 py-3 flex items-center justify-between"
                  style={{ background: "var(--surface-2)", borderBottom: "1px solid var(--border)" }}
                >
                  <span
                    className="text-[11px] font-semibold tracking-widest uppercase"
                    style={{ color: "var(--text-2)" }}
                  >
                    {monthLabel(month)}
                  </span>
                  <div className="flex items-center gap-5 text-[11px] font-mono">
                    {monthInflow > 0 && (
                      <span style={{ color: "var(--green)" }}>
                        +{formatCurrency(monthInflow)}
                      </span>
                    )}
                    {monthOutflow > 0 && (
                      <span style={{ color: "var(--red)" }}>
                        -{formatCurrency(monthOutflow)}
                      </span>
                    )}
                    <span
                      style={{
                        color: monthNet >= 0 ? "var(--green)" : "var(--red)",
                        borderLeft: "1px solid var(--border)",
                        paddingLeft: "1rem",
                      }}
                    >
                      Net: {monthNet >= 0 ? "+" : "-"}
                      {formatCurrency(Math.abs(monthNet))}
                    </span>
                  </div>
                </div>

                {/* Table */}
                <ScrollableTable>
                  <table className="data-table">
                    <thead>
                      <tr>
                        <th>Date & Time</th>
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
                        <tr key={tx.id} className="group">
                          <td>
                            <span
                              className="font-mono text-[11px]"
                              style={{ color: "var(--text-2)" }}
                            >
                              {formatDateTime(tx.transaction_date)}
                            </span>
                          </td>
                          <td>
                            <Link
                              href={`/persons/${tx.person_id}`}
                              className="text-xs font-medium hover:opacity-70 transition-opacity"
                              style={{ color: "var(--brand)" }}
                            >
                              {toTitleCase(tx.person_name)
                                .split(" ")
                                .slice(0, 2)
                                .join(" ")}
                            </Link>
                          </td>
                          <td>
                            <span className={`badge badge-${tx.type.toLowerCase()}`}>
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
                              style={{
                                color:
                                  tx.type === "CREDIT"
                                    ? "var(--green)"
                                    : "var(--red)",
                              }}
                            >
                              {tx.type === "CREDIT" ? "+" : "−"}
                              {formatCurrency(tx.amount)}
                            </span>
                          </td>
                          <td>
                            <span
                              className="text-xs"
                              style={{ color: "var(--text-2)" }}
                            >
                              {tx.bank || "—"}
                            </span>
                          </td>
                          <td>
                            {tx.reference_number ? (
                              <span
                                className="font-mono text-[10px]"
                                style={{ color: "var(--text-3)" }}
                              >
                                {tx.reference_number.slice(0, 14)}
                                {tx.reference_number.length > 14 ? "…" : ""}
                              </span>
                            ) : (
                              <span style={{ color: "var(--text-3)" }}>—</span>
                            )}
                          </td>
                          <td>
                            <span className="badge badge-success text-[9px]">
                              {tx.status}
                            </span>
                          </td>
                          <td>
                            {tx.note ? (
                              <span
                                className="text-[11px] max-w-[200px] truncate block"
                                style={{ color: "var(--text-2)" }}
                                title={tx.note}
                              >
                                {tx.note}
                              </span>
                            ) : (
                              <span style={{ color: "var(--text-3)" }}>—</span>
                            )}
                          </td>
                          <td>
                            <ToggleTxType
                              txId={tx.id}
                              currentType={tx.type as "CREDIT" | "DEBIT"}
                            />
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
    </SearchTransactions>
  );
}
