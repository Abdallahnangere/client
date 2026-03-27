import { getDashboardStats, getPersonBalanceSummaries } from "@/lib/db";
import { formatCurrency, toTitleCase } from "@/lib/utils";
import Link from "next/link";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function DashboardPage() {
  const [stats, summaries] = await Promise.all([
    getDashboardStats(),
    getPersonBalanceSummaries(),
  ]);

  // Net position = sum of all client deficits (what fund owes)
  const netPosition = summaries.reduce((total, s) => {
    const inflow = parseFloat(s.total_inflow);
    const outflow = parseFloat(s.total_outflow);
    const deficit = Math.max(inflow - outflow, 0);
    return total + deficit;
  }, 0);
  const hasDeficit = netPosition > 0;

  // Summary calculations
  const totalCredit = summaries.reduce((s, r) => s + parseFloat(r.total_inflow), 0);
  const totalDebit = summaries.reduce((s, r) => s + parseFloat(r.total_outflow), 0);
  const totalDeficit = summaries.reduce((s, r) => {
    const inflow = parseFloat(r.total_inflow);
    const outflow = parseFloat(r.total_outflow);
    return s + Math.max(inflow - outflow, 0);
  }, 0);
  const totalOverpayment = summaries.reduce((s, r) => {
    const inflow = parseFloat(r.total_inflow);
    const outflow = parseFloat(r.total_outflow);
    return s + Math.max(outflow - inflow, 0);
  }, 0);


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
        <div className={`stat-card ${hasDeficit ? "stat-card-red" : "stat-card-gold"}`}>
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-2" style={{ color: "var(--text-3)" }}>
            Net Position
          </p>
          <p
            className="font-mono text-lg font-medium"
            style={{ color: hasDeficit ? "var(--red)" : "var(--brand)" }}
          >
            {formatCurrency(netPosition)}
          </p>
          <p className="text-[11px] mt-1" style={{ color: "var(--text-3)" }}>
            {hasDeficit ? "fund owes clients" : "settled"}
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

      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 mb-8">
        <div className="stat-card stat-card-gold">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
            Clients
          </p>
          <p className="font-mono text-2xl font-medium" style={{ color: "var(--brand)" }}>
            {summaries.length}
          </p>
        </div>
        <div className="stat-card stat-card-green">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
            Total Credit
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--green)" }}>
            {formatCurrency(totalCredit)}
          </p>
          <p className="text-[10px] mt-0.5" style={{ color: "var(--text-3)" }}>received by fund</p>
        </div>
        <div className="stat-card stat-card-red">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
            Total Debit
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--red)" }}>
            {formatCurrency(totalDebit)}
          </p>
          <p className="text-[10px] mt-0.5" style={{ color: "var(--text-3)" }}>disbursed from fund</p>
        </div>
        <div className="stat-card stat-card-red">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
            Total Debts
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--red)" }}>
            {formatCurrency(totalDeficit)}
          </p>
          <p className="text-[10px] mt-0.5" style={{ color: "var(--text-3)" }}>total fund owes clients</p>
        </div>
      </div>

      {/* Client Balances Table */}
      <div className="card overflow-hidden">
        <div
          className="px-6 py-3 flex items-center justify-between"
          style={{ background: "var(--surface-2)", borderBottom: "1px solid var(--border)" }}
        >
          <span className="text-[11px] font-semibold tracking-widest uppercase" style={{ color: "var(--text-2)" }}>
            Client Balances
          </span>
          <span className="text-[11px] font-mono" style={{ color: "var(--text-3)" }}>
            {summaries.length} record{summaries.length !== 1 ? "s" : ""}
          </span>
        </div>

        <div className="overflow-x-auto">
          <table className="data-table w-full">
            <thead>
              <tr>
                <th style={{ width: 48 }}>S/N</th>
                <th>Full Name</th>
                <th style={{ textAlign: "right" }}>Credit (₦)</th>
                <th style={{ textAlign: "right" }}>Debit (₦)</th>
                <th style={{ textAlign: "right" }}>Debts (₦)</th>
                <th style={{ textAlign: "right" }}>Overpayment (₦)</th>
                <th style={{ textAlign: "center" }}>Txns</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              {summaries.length === 0 ? (
                <tr>
                  <td colSpan={8} className="text-center py-10" style={{ color: "var(--text-3)" }}>
                    No clients registered
                  </td>
                </tr>
              ) : (
                summaries.map((s, i) => {
                  const inflow = parseFloat(s.total_inflow);
                  const outflow = parseFloat(s.total_outflow);
                  const debts = Math.max(inflow - outflow, 0);
                  const overpayment = Math.max(outflow - inflow, 0);
                  return (
                    <tr key={s.person_id}>
                      <td>
                        <span className="font-mono text-xs" style={{ color: "var(--text-3)" }}>
                          {String(i + 1).padStart(2, "0")}
                        </span>
                      </td>
                      <td>
                        <div className="flex items-center gap-2">
                          <div
                            className="w-7 h-7 rounded-lg flex-shrink-0 flex items-center justify-center text-[10px] font-bold"
                            style={{ background: "var(--surface-2)", color: "var(--brand)" }}
                          >
                            {toTitleCase(s.full_name).split(" ").map(w => w[0]).join("").slice(0, 2)}
                          </div>
                          <span className="text-sm font-medium" style={{ color: "var(--text)" }}>
                            {toTitleCase(s.full_name)}
                          </span>
                        </div>
                      </td>
                      <td style={{ textAlign: "right" }}>
                        <span className="font-mono text-sm font-medium" style={{ color: "var(--green)" }}>
                          {formatCurrency(s.total_inflow)}
                        </span>
                      </td>
                      <td style={{ textAlign: "right" }}>
                        <span className="font-mono text-sm font-medium" style={{ color: "var(--red)" }}>
                          {formatCurrency(s.total_outflow)}
                        </span>
                      </td>
                      <td style={{ textAlign: "right" }}>
                        {debts > 0 ? (
                          <span className="font-mono text-sm font-medium" style={{ color: "var(--red)" }}>
                            {formatCurrency(debts)}
                          </span>
                        ) : (
                          <span className="font-mono text-xs" style={{ color: "var(--text-3)" }}>—</span>
                        )}
                      </td>
                      <td style={{ textAlign: "right" }}>
                        {overpayment > 0 ? (
                          <span className="font-mono text-sm font-medium" style={{ color: "var(--green)" }}>
                            {formatCurrency(overpayment)}
                          </span>
                        ) : (
                          <span className="font-mono text-xs" style={{ color: "var(--text-3)" }}>—</span>
                        )}
                      </td>
                      <td style={{ textAlign: "center" }}>
                        <span className="font-mono text-xs" style={{ color: "var(--text-2)" }}>
                          {s.transaction_count}
                        </span>
                      </td>
                      <td>
                        <Link
                          href={`/persons/${s.person_id}`}
                          className="text-xs hover:opacity-70 transition-opacity"
                          style={{ color: "var(--brand)" }}
                        >
                          View →
                        </Link>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
            {/* Totals row */}
            {summaries.length > 0 && (
              <tfoot>
                <tr style={{ borderTop: "2px solid var(--border-strong)", background: "var(--surface-2)" }}>
                  <td></td>
                  <td>
                    <span className="text-xs font-semibold tracking-wider uppercase" style={{ color: "var(--text-3)" }}>
                      Total
                    </span>
                  </td>
                  <td style={{ textAlign: "right" }}>
                    <span className="font-mono text-sm font-semibold" style={{ color: "var(--green)" }}>
                      {formatCurrency(totalCredit)}
                    </span>
                  </td>
                  <td style={{ textAlign: "right" }}>
                    <span className="font-mono text-sm font-semibold" style={{ color: "var(--red)" }}>
                      {formatCurrency(totalDebit)}
                    </span>
                  </td>
                  <td style={{ textAlign: "right" }}>
                    <span className="font-mono text-sm font-semibold" style={{ color: "var(--red)" }}>
                      {formatCurrency(totalDeficit)}
                    </span>
                  </td>
                  <td style={{ textAlign: "right" }}>
                    <span className="font-mono text-sm font-semibold" style={{ color: "var(--green)" }}>
                      {formatCurrency(totalOverpayment)}
                    </span>
                  </td>
                  <td></td>
                  <td></td>
                </tr>
              </tfoot>
            )}
          </table>
        </div>
      </div>
    </div>
  );
}
