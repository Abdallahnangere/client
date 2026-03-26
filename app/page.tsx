import { getDashboardStats, getRecentTransactions, getPersonBalanceSummaries } from "@/lib/db";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import ScrollableTable from "@/components/ui/ScrollableTable";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function DashboardPage() {
  const [stats, recentTx, summaries] = await Promise.all([
    getDashboardStats(),
    getRecentTransactions(8),
    getPersonBalanceSummaries(),
  ]);

  const netBalance = parseFloat(stats.total_outflow) - parseFloat(stats.total_inflow);
  const isNet = netBalance >= 0;


  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Header */}
      <div className="mb-10">
        <div className="eyebrow">Fund Overview</div>
        <h1
          className="font-display text-4xl font-light"
          style={{ color: "var(--text)", letterSpacing: "0.02em" }}
        >
          Capital Overview
        </h1>
        <p className="mt-1 text-sm" style={{ color: "var(--text-2)" }}>
          Private fund management ledger — restricted access
        </p>
      </div>

      {/* Top stat strip */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 mb-8">
        {/* Total Inflow */}
        <div className="stat-card stat-card-green">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "var(--text-3)" }}>
            Total Inflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--green)" }}>
            {formatCurrency(stats.total_inflow)}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "var(--text-3)" }}>received by fund</p>
        </div>

        {/* Total Outflow */}
        <div className="stat-card stat-card-red">
          <p className="text-[10px] font-semibold tracking-widets uppercase mb-2" style={{ color: "var(--text-3)" }}>
            Total Outflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--red)" }}>
            {formatCurrency(stats.total_outflow)}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "var(--text-3)" }}>disbursed from fund</p>
        </div>

        {/* Net Position */}
        <div className={`stat-card ${isNet ? "stat-card-green" : "stat-card-red"}`}>
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "var(--text-3)" }}>
            Net Position
          </p>
          <p
            className="font-mono text-lg font-medium"
            style={{ color: isNet ? "var(--green)" : "var(--red)" }}
          >
            {formatCurrency(Math.abs(netBalance))}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "var(--text-3)" }}>
            {isNet ? "profit" : "deficit"}
          </p>
        </div>

        {/* Clients */}
        <div className="stat-card stat-card-gold">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "var(--text-3)" }}>
            Active Clients
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--brand)" }}>
            {stats.total_persons}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "var(--text-3)" }}>
            {stats.total_transactions} total transactions
          </p>
        </div>
      </div>

      <div className="grid lg:grid-cols-3 gap-6">
        {/* Recent Transactions */}
        <div className="lg:col-span-2 card">
          <div
            className="px-6 py-4 flex items-center justify-between"
            style={{ borderBottom: "1px solid var(--border)" }}
          >
            <div>
              <h2
                className="text-[11px] font-semibold tracking-widest uppercase"
                style={{ color: "var(--text-3)" }}
              >
                Recent Activity
              </h2>
            </div>
            <Link
              href="/ledger"
              className="text-xs tracking-wide hover:opacity-80 transition-opacity"
              style={{ color: "var(--brand)" }}
            >
              View all →
            </Link>
          </div>

          <ScrollableTable>
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
                    <td colSpan={5} className="text-center py-8" style={{ color: "var(--text-3)" }}>
                      No transactions yet
                    </td>
                  </tr>
                ) : (
                  recentTx.map((tx) => (
                    <tr key={tx.id}>
                      <td>
                        <span className="font-mono text-xs" style={{ color: "var(--text-2)" }}>
                          {formatDateTime(tx.transaction_date).replace(",", "")}
                        </span>
                      </td>
                      <td>
                        <Link
                          href={`/persons/${tx.person_id}`}
                          className="text-xs font-medium hover:opacity-80 transition-opacity"
                          style={{ color: "var(--text)" }}
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
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </ScrollableTable>
        </div>

        {/* Client Exposures */}
        <div className="card">
          <div
            className="px-6 py-4"
            style={{ borderBottom: "1px solid var(--border)" }}
          >
            <h2
              className="text-[11px] font-semibold tracking-widest uppercase"
              style={{ color: "var(--text-3)" }}
            >
              Client Exposures
            </h2>
          </div>
          <div className="p-4 space-y-3">
            {summaries.length === 0 ? (
              <p className="text-xs text-center py-6" style={{ color: "var(--text-3)" }}>
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
                    className="block p-3 rounded-xl transition-colors hover:bg-[var(--brand-light)]"
                    style={{ border: "1px solid var(--border)" }}
                  >
                    <div className="flex items-start justify-between gap-2 mb-2">
                      <div className="flex items-center gap-2">
                        <div
                          className="w-6 h-6 rounded-full flex items-center justify-center text-[10px] font-bold"
                          style={{ background: "var(--surface-2)", color: "var(--brand)" }}
                        >
                          {toTitleCase(s.full_name).split(" ").map(w => w[0]).join("").slice(0,2)}
                        </div>
                        <div>
                          <p className="text-xs font-medium leading-tight" style={{ color: "var(--text)" }}>
                            {toTitleCase(s.full_name)}
                          </p>
                          <p className="text-[10px]" style={{ color: "var(--text-3)" }}>
                            {s.transaction_count} txn{parseInt(s.transaction_count) !== 1 ? "s" : ""}
                          </p>
                        </div>
                      </div>
                      <div className="text-right">
                        <p
                          className="font-mono text-xs font-medium"
                          style={{ color: deficit > 0 ? "var(--red)" : "var(--green)" }}
                        >
                          {deficit > 0 ? "−" : "+"}{formatCurrency(deficit > 0 ? deficit : parseFloat(s.surplus))}
                        </p>
                        <p className="text-[10px]" style={{ color: "var(--text-3)" }}>
                          {deficit > 0 ? "deficit" : "profit"}
                        </p>
                      </div>
                    </div>
                    {/* Progress bar */}
                    <div
                      className="h-0.5 rounded-full overflow-hidden"
                      style={{ background: "var(--border)" }}
                    >
                      <div
                        className="h-full rounded-full transition-all"
                        style={{
                          width: `${100 - pct}%`,
                          background: deficit > 0 ? "var(--red)" : "var(--green)",
                        }}
                      />
                    </div>
                  </Link>
                );
              })
            )}
            <Link
              href="/persons/new"
              className="flex items-center gap-2 p-3 rounded-xl w-full text-left transition-colors"
              style={{ border: "1px dashed var(--border-strong)" }}
            >
              <span style={{ color: "var(--text-3)", fontSize: "18px", lineHeight: 1 }}>+</span>
              <span className="text-xs" style={{ color: "var(--text-3)" }}>Add new client</span>
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
