import { getDashboardStats, getRecentTransactions, getPersonBalanceSummaries } from "@/lib/db";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function DashboardPage() {
  const [stats, recentTx, summaries] = await Promise.all([
    getDashboardStats(),
    getRecentTransactions(8),
    getPersonBalanceSummaries(),
  ]);

  const netBalance = parseFloat(stats.total_inflow) - parseFloat(stats.total_outflow);
  const isNet = netBalance >= 0;

  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Header */}
      <div className="mb-10">
        <div className="flex items-center gap-2 mb-2">
          <div
            className="w-4 h-px"
            style={{ background: "linear-gradient(90deg, #C8963C, transparent)" }}
          />
          <span
            className="text-[10px] font-semibold tracking-widest uppercase"
            style={{ color: "#C8963C" }}
          >
            Fund Overview
          </span>
        </div>
        <h1
          className="font-display text-4xl font-light"
          style={{ color: "#E8EDF8", letterSpacing: "0.02em" }}
        >
          Capital Overview
        </h1>
        <p className="mt-1 text-sm" style={{ color: "#6B83A8" }}>
          Private fund management ledger — restricted access
        </p>
      </div>

      {/* Top stat strip */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 mb-8">
        {/* Total Inflow */}
        <div
          className="card p-4 relative overflow-hidden"
          style={{ borderColor: "rgba(46,204,142,0.15)", boxShadow: "0 0 40px rgba(46,204,142,0.04)" }}
        >
          <div
            className="absolute top-0 left-0 right-0 h-px"
            style={{ background: "linear-gradient(90deg, transparent, rgba(46,204,142,0.4), transparent)" }}
          />
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "#3D5070" }}>
            Total Inflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "#2ECC8E" }}>
            {formatCurrency(stats.total_inflow)}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "#3D5070" }}>received by fund</p>
        </div>

        {/* Total Outflow */}
        <div
          className="card p-4 relative overflow-hidden"
          style={{ borderColor: "rgba(224,85,85,0.15)", boxShadow: "0 0 40px rgba(224,85,85,0.04)" }}
        >
          <div
            className="absolute top-0 left-0 right-0 h-px"
            style={{ background: "linear-gradient(90deg, transparent, rgba(224,85,85,0.4), transparent)" }}
          />
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "#3D5070" }}>
            Total Outflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "#E05555" }}>
            {formatCurrency(stats.total_outflow)}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "#3D5070" }}>disbursed from fund</p>
        </div>

        {/* Net Position */}
        <div
          className="card p-4 relative overflow-hidden"
          style={{
            borderColor: isNet ? "rgba(46,204,142,0.15)" : "rgba(224,85,85,0.15)",
            boxShadow: isNet ? "0 0 40px rgba(46,204,142,0.04)" : "0 0 40px rgba(224,85,85,0.04)",
          }}
        >
          <div
            className="absolute top-0 left-0 right-0 h-px"
            style={{
              background: isNet
                ? "linear-gradient(90deg, transparent, rgba(46,204,142,0.4), transparent)"
                : "linear-gradient(90deg, transparent, rgba(224,85,85,0.4), transparent)",
            }}
          />
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "#3D5070" }}>
            Net Position
          </p>
          <p
            className="font-mono text-lg font-medium"
            style={{ color: isNet ? "#2ECC8E" : "#E05555" }}
          >
            {formatCurrency(Math.abs(netBalance))}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "#3D5070" }}>
            {isNet ? "fund surplus" : "fund deficit"}
          </p>
        </div>

        {/* Clients */}
        <div
          className="card p-4 relative overflow-hidden"
          style={{ borderColor: "rgba(200,150,60,0.2)", boxShadow: "0 0 40px rgba(200,150,60,0.06)" }}
        >
          <div
            className="absolute top-0 left-0 right-0 h-px"
            style={{ background: "linear-gradient(90deg, transparent, rgba(200,150,60,0.5), transparent)" }}
          />
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "#3D5070" }}>
            Active Clients
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "#C8963C" }}>
            {stats.total_persons}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "#3D5070" }}>
            {stats.total_transactions} total transactions
          </p>
        </div>
      </div>

      <div className="grid lg:grid-cols-3 gap-6">
        {/* Recent Transactions */}
        <div className="lg:col-span-2 card">
          <div
            className="px-6 py-4 flex items-center justify-between"
            style={{ borderBottom: "1px solid #152035" }}
          >
            <div>
              <h2
                className="text-[11px] font-semibold tracking-widest uppercase"
                style={{ color: "#3D5070" }}
              >
                Recent Activity
              </h2>
            </div>
            <Link
              href="/ledger"
              className="text-xs tracking-wide hover:opacity-80 transition-opacity"
              style={{ color: "#C8963C" }}
            >
              View all →
            </Link>
          </div>

          <div className="overflow-x-auto">
            <table className="data-table">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Client</th>
                  <th>Type</th>
                  <th style={{ textAlign: "right" }}>Amount</th>
                  <th>Bank</th>
                </tr>
              </thead>
              <tbody>
                {recentTx.length === 0 ? (
                  <tr>
                    <td colSpan={5} className="text-center py-8" style={{ color: "#3D5070" }}>
                      No transactions yet
                    </td>
                  </tr>
                ) : (
                  recentTx.map((tx) => (
                    <tr key={tx.id}>
                      <td>
                        <span className="font-mono text-xs" style={{ color: "#6B83A8" }}>
                          {formatDateTime(tx.transaction_date).replace(",", "")}
                        </span>
                      </td>
                      <td>
                        <Link
                          href={`/persons/${tx.person_id}`}
                          className="text-xs font-medium hover:opacity-80 transition-opacity"
                          style={{ color: "#E8EDF8" }}
                        >
                          {toTitleCase(tx.person_name)}
                        </Link>
                      </td>
                      <td>
                        <span className={`badge badge-${tx.type.toLowerCase()}`}>
                          {tx.type}
                        </span>
                      </td>
                      <td style={{ textAlign: "right" }}>
                        <span
                          className="font-mono text-xs font-medium"
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
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>

        {/* Client Exposures */}
        <div className="card">
          <div
            className="px-6 py-4"
            style={{ borderBottom: "1px solid #152035" }}
          >
            <h2
              className="text-[11px] font-semibold tracking-widest uppercase"
              style={{ color: "#3D5070" }}
            >
              Client Exposures
            </h2>
          </div>
          <div className="p-4 space-y-3">
            {summaries.length === 0 ? (
              <p className="text-xs text-center py-6" style={{ color: "#3D5070" }}>
                No client data
              </p>
            ) : (
              summaries.map((s) => {
                const deficit = parseFloat(s.deficit);
                const outflow = parseFloat(s.total_outflow);
                const pct = outflow > 0 ? Math.min((deficit / outflow) * 100, 100) : 0;

                return (
                  <Link
                    key={s.person_id}
                    href={`/persons/${s.person_id}`}
                    className="block p-3 rounded-[2px] transition-colors hover:bg-[#0D1A2E]"
                    style={{ border: "1px solid #152035" }}
                  >
                    <div className="flex items-start justify-between gap-2 mb-2">
                      <div className="flex items-center gap-2">
                        <div
                          className="w-6 h-6 rounded-full flex items-center justify-center text-[10px] font-bold"
                          style={{ background: "#162240", color: "#C8963C" }}
                        >
                          {toTitleCase(s.full_name).split(" ").map(w => w[0]).join("").slice(0,2)}
                        </div>
                        <div>
                          <p className="text-xs font-medium leading-tight" style={{ color: "#E8EDF8" }}>
                            {toTitleCase(s.full_name)}
                          </p>
                          <p className="text-[10px]" style={{ color: "#3D5070" }}>
                            {s.transaction_count} txn{parseInt(s.transaction_count) !== 1 ? "s" : ""}
                          </p>
                        </div>
                      </div>
                      <div className="text-right">
                        <p
                          className="font-mono text-xs font-medium"
                          style={{ color: deficit > 0 ? "#E05555" : "#2ECC8E" }}
                        >
                          {deficit > 0 ? "−" : "+"}{formatCurrency(deficit > 0 ? deficit : parseFloat(s.surplus))}
                        </p>
                        <p className="text-[10px]" style={{ color: "#3D5070" }}>
                          {deficit > 0 ? "owed" : "surplus"}
                        </p>
                      </div>
                    </div>
                    {/* Progress bar */}
                    <div
                      className="h-0.5 rounded-full overflow-hidden"
                      style={{ background: "#152035" }}
                    >
                      <div
                        className="h-full rounded-full transition-all"
                        style={{
                          width: `${100 - pct}%`,
                          background: deficit > 0
                            ? "linear-gradient(90deg, #E05555, #E07777)"
                            : "linear-gradient(90deg, #2ECC8E, #60E0B0)",
                        }}
                      />
                    </div>
                  </Link>
                );
              })
            )}
            <Link
              href="/persons/new"
              className="flex items-center gap-2 p-3 rounded-[2px] w-full text-left transition-colors hover:bg-[#0A1524]"
              style={{ border: "1px dashed #1E3050" }}
            >
              <span style={{ color: "#3D5070", fontSize: "18px", lineHeight: 1 }}>+</span>
              <span className="text-xs" style={{ color: "#3D5070" }}>Add new client</span>
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
