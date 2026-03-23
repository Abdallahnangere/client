import { getPerson, getTransactionsByPerson, getPersonBalanceSummary } from "@/lib/db";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import { notFound } from "next/navigation";
import TransactionActions from "./TransactionActions";
import DeleteTxButton from "./DeleteTxButton";
import ToggleTxType from "./ToggleTxType";
import ScrollableTable from "@/components/ui/ScrollableTable";
import SearchTransactions from "@/components/ui/SearchTransactions";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function PersonDetailPage({
  params,
}: {
  params: { id: string };
}) {
  const id = parseInt(params.id);
  if (isNaN(id)) notFound();

  const [person, transactions, summary] = await Promise.all([
    getPerson(id),
    getTransactionsByPerson(id),
    getPersonBalanceSummary(id),
  ]);

  if (!person) notFound();

  const deficit = summary ? parseFloat(summary.deficit) : 0;
  const surplus = summary ? parseFloat(summary.surplus) : 0;
  const inflow = summary ? parseFloat(summary.total_inflow) : 0;
  const outflow = summary ? parseFloat(summary.total_outflow) : 0;
  const netBalance = inflow - outflow;

  // Group by month
  const grouped: Record<string, typeof transactions> = {};
  for (const tx of transactions) {
    const key = tx.transaction_date
      ? (() => { const d = new Date(tx.transaction_date); return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}`; })()
      : "undated";
    if (!grouped[key]) grouped[key] = [];
    grouped[key].push(tx);
  }

  const months = Object.keys(grouped).sort().reverse();

  const monthLabel = (key: string) => {
    if (key === "undated") return "Date Unknown";
    const [year, month] = key.split("-");
    return new Date(parseInt(year), parseInt(month) - 1, 1).toLocaleDateString("en-GB", {
      month: "long",
      year: "numeric",
    });
  };

  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Breadcrumb */}
      <div className="flex items-center gap-2 mb-8 text-xs" style={{ color: "var(--text-3)" }}>
        <Link href="/persons" className="hover:opacity-70 transition-opacity" style={{ color: "var(--brand)" }}>
          Clients
        </Link>
        <span>›</span>
        <span style={{ color: "var(--text-2)" }}>{toTitleCase(person.full_name)}</span>
      </div>

      {/* Client Header Card */}
      <div className="card relative overflow-hidden mb-6">
        <div className="relative p-6">
          <div className="flex flex-col lg:flex-row lg:items-start gap-6">
            {/* Avatar + Identity */}
            <div className="flex items-start gap-4">
              <div
                className="w-14 h-14 rounded-2xl flex-shrink-0 flex items-center justify-center text-base font-semibold"
                style={{
                  background: "var(--surface-2)",
                  border: "1px solid var(--border)",
                  color: "var(--brand)",
                }}
              >
                {toTitleCase(person.full_name).split(" ").map(w => w[0]).join("").slice(0, 2)}
              </div>

              <div>
                <h1
                  className="font-display text-3xl font-light"
                  style={{ color: "var(--text)", letterSpacing: "0.02em" }}
                >
                  {toTitleCase(person.full_name)}
                </h1>
                <div className="flex flex-wrap gap-x-4 gap-y-1 mt-1.5">
                  {person.phone && (
                    <span className="text-xs" style={{ color: "var(--text-2)" }}>Call: {person.phone}</span>
                  )}
                  {person.email && (
                    <span className="text-xs" style={{ color: "var(--text-2)" }}>Email: {person.email}</span>
                  )}
                </div>
                {person.notes && (
                  <p className="text-xs mt-2 font-mono" style={{ color: "var(--text-2)" }}>
                    {person.notes}
                  </p>
                )}
              </div>
            </div>

            {/* Stats row */}
            <div className="flex gap-6 lg:ml-auto flex-wrap">
              <div className="text-center lg:text-right">
                <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                  Fund Outflow
                </p>
                <p className="font-mono text-lg" style={{ color: "var(--red)" }}>
                  {formatCurrency(outflow)}
                </p>
                <p className="text-[10px]" style={{ color: "var(--text-3)" }}>
                  {summary?.debit_count ?? 0} debits
                </p>
              </div>
              <div className="text-center lg:text-right">
                <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                  Fund Inflow
                </p>
                <p className="font-mono text-lg" style={{ color: "var(--green)" }}>
                  {formatCurrency(inflow)}
                </p>
                <p className="text-[10px]" style={{ color: "var(--text-3)" }}>
                  {summary?.credit_count ?? 0} credits
                </p>
              </div>
              <div
                className="text-center lg:text-right px-4 py-0 rounded-lg"
                style={{ borderLeft: `2px solid ${netBalance < 0 ? "var(--red-border)" : "var(--green-border)"}` }}
              >
                <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                  Net Position
                </p>
                <p
                  className="font-mono text-lg font-medium"
                  style={{ color: netBalance < 0 ? "var(--red)" : "var(--green)" }}
                >
                  {formatCurrency(Math.abs(netBalance))}
                </p>
                <p className="text-[10px]" style={{ color: "var(--text-3)" }}>
                  {netBalance < 0 ? "fund owes client" : "client owes fund"}
                </p>
              </div>
            </div>
          </div>

          {/* Action buttons */}
          <div
            className="flex flex-wrap gap-3 mt-5 pt-5"
            style={{ borderTop: "1px solid var(--border)" }}
          >
            <TransactionActions personId={person.id} personName={person.full_name} />
            <Link href={`/persons/${person.id}/edit`} className="btn btn-outline">
              <svg width="13" height="13" viewBox="0 0 13 13" fill="none">
                <path d="M8.5 1.5l3 3-8 8H0.5v-3l8-8z" stroke="currentColor" strokeWidth="1.2" strokeLinecap="square" />
              </svg>
              Edit Profile
            </Link>
            <a
              href={`/api/persons/${person.id}/export`}
              download={`${toTitleCase(person.full_name).replace(/\s+/g, "_")}_transactions.xlsx`}
              className="btn btn-outline"
            >
              <svg width="13" height="13" viewBox="0 0 13 13" fill="none">
                <path d="M6.5 1v8M3.5 6.5l3 3 3-3M1.5 11h10" stroke="currentColor" strokeWidth="1.2" strokeLinecap="square" />
              </svg>
              Export Excel
            </a>
          </div>
        </div>
      </div>

      {/* Ledger */}
      <div className="card">
        <div
          className="px-6 py-4 flex items-center justify-between"
          style={{ borderBottom: "1px solid var(--border)" }}
        >
          <div>
            <h2 className="text-[11px] font-semibold tracking-widest uppercase" style={{ color: "var(--text-3)" }}>
              Transaction Ledger
            </h2>
            <p className="text-xs mt-0.5" style={{ color: "var(--text-3)" }}>
              {transactions.length} transaction{transactions.length !== 1 ? "s" : ""} · chronological
            </p>
          </div>
        </div>

        {transactions.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-16">
            <div className="opacity-10 mb-4" style={{ color: "var(--text-2)" }}>
              <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                <rect x="4" y="4" width="32" height="32" rx="2" stroke="currentColor" strokeWidth="1.5" />
                <path d="M10 14h20M10 20h14M10 26h10" stroke="currentColor" strokeWidth="1.5" strokeLinecap="square" />
              </svg>
            </div>
            <p className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>No transactions</p>
            <p className="text-xs mt-1" style={{ color: "var(--text-3)" }}>Record the first transaction above</p>
          </div>
        ) : (
          <SearchTransactions transactions={transactions}>
            {(filtered) => {
              if (filtered.length === 0) {
                return (
                  <div className="flex flex-col items-center justify-center py-16">
                    <div className="opacity-10 mb-4" style={{ color: "var(--text-2)" }}>
                      <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                        <rect x="4" y="4" width="32" height="32" rx="2" stroke="currentColor" strokeWidth="1.5" />
                        <path d="M10 14h20M10 20h14M10 26h10" stroke="currentColor" strokeWidth="1.5" strokeLinecap="square" />
                      </svg>
                    </div>
                    <p className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>No matching transactions</p>
                    <p className="text-xs mt-1" style={{ color: "var(--text-3)" }}>Try a different search term</p>
                  </div>
                );
              }

              // Re-group filtered transactions by month
              const filteredGrouped: Record<string, typeof filtered> = {};
              for (const tx of filtered) {
                const key = tx.transaction_date
                  ? (() => { const d = new Date(tx.transaction_date); return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}`; })()
                  : "undated";
                if (!filteredGrouped[key]) filteredGrouped[key] = [];
                filteredGrouped[key].push(tx);
              }

              const filteredMonths = Object.keys(filteredGrouped).sort().reverse();

              return (
                <div>
                  {filteredMonths.map((month) => {
                    const txs = filteredGrouped[month];
                    const monthInflow = txs.reduce((sum, tx) => tx.type === "CREDIT" ? sum + parseFloat(tx.amount) : sum, 0);
                    const monthOutflow = txs.reduce((sum, tx) => tx.type === "DEBIT" ? sum + parseFloat(tx.amount) : sum, 0);

                    return (
                      <div key={month}>
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
                          <div className="flex items-center gap-4 text-[11px] font-mono">
                            {monthInflow > 0 && (
                              <span style={{ color: "var(--green)" }}>+{formatCurrency(monthInflow)}</span>
                            )}
                            {monthOutflow > 0 && (
                              <span style={{ color: "var(--red)" }}>-{formatCurrency(monthOutflow)}</span>
                            )}
                          </div>
                        </div>

                        {/* Transactions */}
                        <ScrollableTable>
                          <table className="data-table">
                            <thead>
                              <tr>
                                <th>Date & Time</th>
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
                                      style={{ color: tx.type === "CREDIT" ? "var(--green)" : "var(--red)" }}
                                    >
                                    {tx.type === "CREDIT" ? "+" : "-"}{formatCurrency(tx.amount)}
                                    </span>
                                  </td>
                                  <td>
                                    <span className="text-xs" style={{ color: "var(--text-2)" }}>
                                      {tx.bank || "—"}
                                    </span>
                                  </td>
                                  <td>
                                    {tx.reference_number ? (
                                      <span className="font-mono text-[10px]" style={{ color: "var(--text-3)" }}>
                                        {tx.reference_number.slice(0, 16)}{tx.reference_number.length > 16 ? "…" : ""}
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
              );
            }}
          </SearchTransactions>
        )}
      </div>
    </div>
  );
}
