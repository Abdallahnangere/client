import { getPersonBalanceSummaries } from "@/lib/db";
import { formatCurrency, toTitleCase } from "@/lib/utils";
import Link from "next/link";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function SummaryPage() {
  const summaries = await getPersonBalanceSummaries();

  const totalCredit = summaries.reduce((s, r) => s + parseFloat(r.total_inflow), 0);
  const totalDebit = summaries.reduce((s, r) => s + parseFloat(r.total_outflow), 0);
  const totalOutstanding = summaries.reduce((s, r) => {
    const inflow = parseFloat(r.total_inflow);
    const outflow = parseFloat(r.total_outflow);
    return s + Math.max(inflow - outflow, 0);
  }, 0);
  const totalSurplus = summaries.reduce((s, r) => {
    const inflow = parseFloat(r.total_inflow);
    const outflow = parseFloat(r.total_outflow);
    return s + Math.max(outflow - inflow, 0);
  }, 0);

  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Header */}
      <div className="flex items-start justify-between gap-4 mb-10">
        <div>
          <div className="eyebrow">Portfolio Summary</div>
          <h1
            className="font-display text-4xl font-light"
            style={{ color: "var(--text)", letterSpacing: "0.02em" }}
          >
            Balance Summary
          </h1>
          <p className="mt-1 text-sm" style={{ color: "var(--text-2)" }}>
            Consolidated position across all {summaries.length} client{summaries.length !== 1 ? "s" : ""}
          </p>
        </div>
        <a
          href="/api/summary/export"
          download="Capital_Summary.xlsx"
          className="btn btn-gold flex-shrink-0"
        >
          <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
            <path d="M7 1v9M3.5 7.5l3.5 3.5 3.5-3.5M1.5 12.5h11" stroke="currentColor" strokeWidth="1.6" strokeLinecap="square" />
          </svg>
          Export Excel
        </a>
      </div>

      {/* Summary stat strip */}
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
            Outstanding
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--red)" }}>
            {formatCurrency(totalOutstanding)}
          </p>
          <p className="text-[10px] mt-0.5" style={{ color: "var(--text-3)" }}>total owed to fund</p>
        </div>
      </div>

      {/* Spreadsheet table */}
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
                <th style={{ textAlign: "right" }}>Outstanding (₦)</th>
                <th style={{ textAlign: "right" }}>Surplus (₦)</th>
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
                  const outstanding = Math.max(inflow - outflow, 0);
                  const surplus = Math.max(outflow - inflow, 0);
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
                        {outstanding > 0 ? (
                          <span className="font-mono text-sm font-medium" style={{ color: "var(--red)" }}>
                            {formatCurrency(outstanding)}
                          </span>
                        ) : (
                          <span className="font-mono text-xs" style={{ color: "var(--text-3)" }}>—</span>
                        )}
                      </td>
                      <td style={{ textAlign: "right" }}>
                        {surplus > 0 ? (
                          <span className="font-mono text-sm font-medium" style={{ color: "var(--green)" }}>
                            {formatCurrency(surplus)}
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
                      {formatCurrency(totalOutstanding)}
                    </span>
                  </td>
                  <td style={{ textAlign: "right" }}>
                    <span className="font-mono text-sm font-semibold" style={{ color: "var(--green)" }}>
                      {formatCurrency(totalSurplus)}
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
