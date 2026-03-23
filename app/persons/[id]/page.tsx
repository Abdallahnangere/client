import { getPerson, getTransactionsByPerson, getPersonBalanceSummary } from "@/lib/db";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import { notFound } from "next/navigation";
import TransactionActions from "./TransactionActions";
import DeleteTxButton from "./DeleteTxButton";
import ToggleTxType from "./ToggleTxType";
import ScrollableTable from "@/components/ui/ScrollableTable";

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
                    <span className="text-xs" style={{ color: "var(--text-2)" }}>📱 {person.phone}</span>
                  )}
                  {person.email && (
                    <span className="text-xs" style={{ color: "var(--text-2)" }}>✉ {person.email}</span>
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
          <div>
            {months.map((month) => {
              const txs = grouped[month];
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
                        <span style={{ color: "var(--red)" }}>−{formatCurrency(monthOutflow)}</span>
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
                                {tx.type === "CREDIT" ? "+" : "−"}{formatCurrency(tx.amount)}
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
        )}
      </div>
    </div>
  );
}


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
      <div className="flex items-center gap-2 mb-8 text-xs" style={{ color: "#3D5070" }}>
        <Link href="/persons" className="hover:text-[#C8963C] transition-colors">
          Clients
        </Link>
        <span>›</span>
        <span style={{ color: "#6B83A8" }}>{toTitleCase(person.full_name)}</span>
      </div>

      {/* Client Header Card */}
      <div
        className="card relative overflow-hidden mb-6"
        style={{ borderColor: "rgba(200,150,60,0.15)" }}
      >
        {/* Gold top line */}
        <div
          className="absolute top-0 left-0 right-0 h-px"
          style={{ background: "linear-gradient(90deg, transparent, rgba(200,150,60,0.6), transparent)" }}
        />
        {/* Subtle background gradient */}
        <div
          className="absolute inset-0 pointer-events-none"
          style={{
            background: "radial-gradient(ellipse at top right, rgba(200,150,60,0.04) 0%, transparent 60%)",
          }}
        />

        <div className="relative p-6">
          <div className="flex flex-col lg:flex-row lg:items-start gap-6">
            {/* Avatar + Identity */}
            <div className="flex items-start gap-4">
              <div
                className="w-14 h-14 rounded-2xl flex-shrink-0 flex items-center justify-center text-base font-semibold"
                style={{
                  background: "linear-gradient(135deg, #0D1A2E, #162240)",
                  border: "1px solid rgba(200,150,60,0.25)",
                  color: "#C8963C",
                }}
              >
                {toTitleCase(person.full_name).split(" ").map(w => w[0]).join("").slice(0, 2)}
              </div>

              <div>
                <h1
                  className="font-display text-3xl font-light"
                  style={{ color: "#E8EDF8", letterSpacing: "0.02em" }}
                >
                  {toTitleCase(person.full_name)}
                </h1>
                <div className="flex flex-wrap gap-x-4 gap-y-1 mt-1.5">
                  {person.phone && (
                    <span className="text-xs" style={{ color: "#6B83A8" }}>📱 {person.phone}</span>
                  )}
                  {person.email && (
                    <span className="text-xs" style={{ color: "#6B83A8" }}>✉ {person.email}</span>
                  )}
                </div>
                {person.notes && (
                  <p className="text-xs mt-2 font-mono" style={{ color: "#6B83A8" }}>
                    {person.notes}
                  </p>
                )}
              </div>
            </div>

            {/* Stats row */}
            <div className="flex gap-6 lg:ml-auto flex-wrap">
              <div className="text-center lg:text-right">
                <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "#3D5070" }}>
                  Fund Outflow
                </p>
                <p className="font-mono text-lg" style={{ color: "#E05555" }}>
                  {formatCurrency(outflow)}
                </p>
                <p className="text-[10px]" style={{ color: "#3D5070" }}>
                  {summary?.debit_count ?? 0} debits
                </p>
              </div>
              <div className="text-center lg:text-right">
                <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "#3D5070" }}>
                  Fund Inflow
                </p>
                <p className="font-mono text-lg" style={{ color: "#2ECC8E" }}>
                  {formatCurrency(inflow)}
                </p>
                <p className="text-[10px]" style={{ color: "#3D5070" }}>
                  {summary?.credit_count ?? 0} credits
                </p>
              </div>
              <div
                className="text-center lg:text-right px-4 py-0 rounded-lg"
                style={{ borderLeft: `2px solid ${netBalance < 0 ? "#E05555" : "#2ECC8E"}33` }}
              >
                <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "#3D5070" }}>
                  Net Position
                </p>
                <p
                  className="font-mono text-lg font-medium"
                  style={{ color: netBalance < 0 ? "#E05555" : "#2ECC8E" }}
                >
                  {formatCurrency(Math.abs(netBalance))}
                </p>
                <p className="text-[10px]" style={{ color: "#3D5070" }}>
                  {netBalance < 0 ? "fund owes client" : "client owes fund"}
                </p>
              </div>
            </div>
          </div>

          {/* Action buttons */}
          <div
            className="flex flex-wrap gap-3 mt-5 pt-5"
            style={{ borderTop: "1px solid #152035" }}
          >
            <TransactionActions personId={person.id} personName={person.full_name} />
            <Link href={`/persons/${person.id}/edit`} className="btn btn-outline">
              <svg width="13" height="13" viewBox="0 0 13 13" fill="none">
                <path d="M8.5 1.5l3 3-8 8H0.5v-3l8-8z" stroke="currentColor" strokeWidth="1.2" strokeLinecap="square" />
              </svg>
              Edit Profile
            </Link>
          </div>
        </div>
      </div>

      {/* Ledger */}
      <div className="card">
        <div
          className="px-6 py-4 flex items-center justify-between"
          style={{ borderBottom: "1px solid #152035" }}
        >
          <div>
            <h2 className="text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#3D5070" }}>
              Transaction Ledger
            </h2>
            <p className="text-xs mt-0.5" style={{ color: "#3D5070" }}>
              {transactions.length} transaction{transactions.length !== 1 ? "s" : ""} · chronological
            </p>
          </div>
        </div>

        {transactions.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-16">
            <div className="opacity-10 mb-4" style={{ color: "#6B83A8" }}>
              <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                <rect x="4" y="4" width="32" height="32" rx="2" stroke="currentColor" strokeWidth="1.5" />
                <path d="M10 14h20M10 20h14M10 26h10" stroke="currentColor" strokeWidth="1.5" strokeLinecap="square" />
              </svg>
            </div>
            <p className="font-display text-xl font-light" style={{ color: "#6B83A8" }}>No transactions</p>
            <p className="text-xs mt-1" style={{ color: "#3D5070" }}>Record the first transaction above</p>
          </div>
        ) : (
          <div>
            {months.map((month) => {
              const txs = grouped[month];
              const monthInflow = txs.reduce((sum, tx) => tx.type === "CREDIT" ? sum + parseFloat(tx.amount) : sum, 0);
              const monthOutflow = txs.reduce((sum, tx) => tx.type === "DEBIT" ? sum + parseFloat(tx.amount) : sum, 0);

              return (
                <div key={month}>
                  {/* Month header */}
                  <div
                    className="px-6 py-3 flex items-center justify-between"
                    style={{ background: "#060C18", borderBottom: "1px solid #152035" }}
                  >
                    <span
                      className="text-[11px] font-semibold tracking-widest uppercase"
                      style={{ color: "#6B83A8" }}
                    >
                      {monthLabel(month)}
                    </span>
                    <div className="flex items-center gap-4 text-[11px] font-mono">
                      {monthInflow > 0 && (
                        <span style={{ color: "#2ECC8E" }}>+{formatCurrency(monthInflow)}</span>
                      )}
                      {monthOutflow > 0 && (
                        <span style={{ color: "#E05555" }}>−{formatCurrency(monthOutflow)}</span>
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
                              <span className="font-mono text-xs" style={{ color: "#6B83A8" }}>
                                {formatDateTime(tx.transaction_date)}
                              </span>
                            </td>
                            <td>
                              <span className={`badge badge-${tx.type.toLowerCase()}`}>
                                {tx.type}
                              </span>
                            </td>
                            <td>
                              <span className="text-xs" style={{ color: "#E8EDF8" }}>
                                {toTitleCase(tx.sender)}
                              </span>
                            </td>
                            <td>
                              <span className="text-xs" style={{ color: "#E8EDF8" }}>
                                {toTitleCase(tx.receiver)}
                              </span>
                            </td>
                            <td style={{ textAlign: "right" }}>
                              <span
                                className="font-mono text-sm font-medium"
                                style={{ color: tx.type === "CREDIT" ? "#2ECC8E" : "#E05555" }}
                              >
                                {tx.type === "CREDIT" ? "+" : "−"}{formatCurrency(tx.amount)}
                              </span>
                            </td>
                            <td>
                              <span className="text-xs" style={{ color: "#6B83A8" }}>
                                {tx.bank || "—"}
                              </span>
                            </td>
                            <td>
                              {tx.reference_number ? (
                                <span className="font-mono text-[10px]" style={{ color: "#3D5070" }}>
                                  {tx.reference_number.slice(0, 16)}{tx.reference_number.length > 16 ? "…" : ""}
                                </span>
                              ) : (
                                <span style={{ color: "#3D5070" }}>—</span>
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
        )}
      </div>
    </div>
  );
}


