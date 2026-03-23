import { getRecentTransactions, getDashboardStats } from "@/lib/db";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import sql from "@/lib/db";
import ToggleTxType from "@/app/persons/[id]/ToggleTxType";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function LedgerPage() {
  const allTx = await sql`
    SELECT t.*, p.full_name AS person_name
    FROM transactions t
    JOIN persons p ON p.id = t.person_id
    ORDER BY t.transaction_date DESC, t.created_at DESC
  ` as any[];

  const stats = await getDashboardStats();
  const totalTx = allTx.length;
  const creditTx = allTx.filter((t) => t.type === "CREDIT");
  const debitTx = allTx.filter((t) => t.type === "DEBIT");

  // Group by month
  const grouped: Record<string, typeof allTx> = {};
  for (const tx of allTx) {
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
      {/* Header */}
      <div className="flex items-start justify-between gap-4 mb-10">
        <div>
          <div className="eyebrow">Master Ledger</div>
          <h1 className="font-display text-4xl font-light" style={{ color: "#E8EDF8", letterSpacing: "0.02em" }}>
            Transaction Ledger
          </h1>
          <p className="mt-1 text-sm" style={{ color: "#6B83A8" }}>
            Complete fund activity — {totalTx} transactions
          </p>
        </div>
      </div>

      {/* Summary strip */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 mb-8">
        <div className="stat-card stat-card-gold">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "#3D5070" }}>
            Transactions
          </p>
          <p className="font-mono text-2xl font-medium" style={{ color: "#C8963C" }}>{totalTx}</p>
        </div>
        <div className="stat-card stat-card-green">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "#3D5070" }}>
            Total Inflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "#2ECC8E" }}>{formatCurrency(stats.total_inflow)}</p>
          <p className="text-[10px] mt-0.5" style={{ color: "#3D5070" }}>{creditTx.length} credits</p>
        </div>
        <div className="stat-card stat-card-red">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "#3D5070" }}>
            Total Outflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "#E05555" }}>{formatCurrency(stats.total_outflow)}</p>
          <p className="text-[10px] mt-0.5" style={{ color: "#3D5070" }}>{debitTx.length} debits</p>
        </div>
        {(() => {
          const net = parseFloat(stats.total_inflow) - parseFloat(stats.total_outflow);
          const isPos = net >= 0;
          return (
            <div className={`stat-card ${isPos ? "stat-card-green" : "stat-card-red"}`}>
              <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "#3D5070" }}>
                Net Position
              </p>
              <p className="font-mono text-lg font-medium" style={{ color: isPos ? "#2ECC8E" : "#E05555" }}>
                {formatCurrency(Math.abs(net))}
              </p>
              <p className="text-[10px] mt-0.5" style={{ color: "#3D5070" }}>
                {isPos ? "fund surplus" : "fund deficit"}
              </p>
            </div>
          );
        })()}
      </div>

      {/* Ledger by month */}
      {allTx.length === 0 ? (
        <div className="card flex flex-col items-center justify-center py-20">
          <p className="font-display text-xl font-light" style={{ color: "#6B83A8" }}>No transactions recorded</p>
          <p className="text-xs mt-2" style={{ color: "#3D5070" }}>Go to a client profile to record transactions</p>
          <Link href="/persons" className="btn btn-outline mt-6">View Clients</Link>
        </div>
      ) : (
        <div className="space-y-4">
          {months.map((month) => {
            const txs = grouped[month];
            const monthInflow = txs.reduce((s, t) => t.type === "CREDIT" ? s + parseFloat(t.amount) : s, 0);
            const monthOutflow = txs.reduce((s, t) => t.type === "DEBIT" ? s + parseFloat(t.amount) : s, 0);
            const monthNet = monthInflow - monthOutflow;

            return (
              <div key={month} className="card overflow-hidden">
                {/* Month header */}
                <div
                  className="px-6 py-3 flex items-center justify-between"
                  style={{ background: "#060C18", borderBottom: "1px solid #152035" }}
                >
                  <span className="text-[11px] font-semibold tracking-widest uppercase" style={{ color: "#6B83A8" }}>
                    {monthLabel(month)}
                  </span>
                  <div className="flex items-center gap-5 text-[11px] font-mono">
                    {monthInflow > 0 && (
                      <span style={{ color: "#2ECC8E" }}>+{formatCurrency(monthInflow)}</span>
                    )}
                    {monthOutflow > 0 && (
                      <span style={{ color: "#E05555" }}>−{formatCurrency(monthOutflow)}</span>
                    )}
                    <span style={{ color: monthNet >= 0 ? "#2ECC8E" : "#E05555", borderLeft: "1px solid #152035", paddingLeft: "1rem" }}>
                      Net: {monthNet >= 0 ? "+" : "−"}{formatCurrency(Math.abs(monthNet))}
                    </span>
                  </div>
                </div>

                {/* Table */}
                <div className="overflow-x-auto">
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
                            <span className="font-mono text-[11px]" style={{ color: "#6B83A8" }}>
                              {formatDateTime(tx.transaction_date)}
                            </span>
                          </td>
                          <td>
                            <Link
                              href={`/persons/${tx.person_id}`}
                              className="text-xs font-medium hover:opacity-70 transition-opacity"
                              style={{ color: "#C8963C" }}
                            >
                              {toTitleCase(tx.person_name).split(" ").slice(0, 2).join(" ")}
                            </Link>
                          </td>
                          <td>
                            <span className={`badge badge-${tx.type.toLowerCase()}`}>{tx.type}</span>
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
                            <span className="text-xs" style={{ color: "#6B83A8" }}>{tx.bank || "—"}</span>
                          </td>
                          <td>
                            {tx.reference_number ? (
                              <span className="font-mono text-[10px]" style={{ color: "#3D5070" }}>
                                {tx.reference_number.slice(0, 14)}{tx.reference_number.length > 14 ? "…" : ""}
                              </span>
                            ) : (
                              <span style={{ color: "#3D5070" }}>—</span>
                            )}
                          </td>
                          <td>
                            <span className="badge badge-success text-[9px]">{tx.status}</span>
                          </td>
                          <td>
                            {tx.note ? (
                              <span className="text-[11px] max-w-[200px] truncate block" style={{ color: "#6B83A8" }} title={tx.note}>
                                {tx.note}
                              </span>
                            ) : (
                              <span style={{ color: "#3D5070" }}>—</span>
                            )}
                          </td>
                          <td>
                            <ToggleTxType txId={tx.id} currentType={tx.type as "CREDIT" | "DEBIT"} />
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
