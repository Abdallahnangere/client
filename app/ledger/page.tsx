import { getRecentTransactions, getDashboardStats } from "@/lib/db";
import { formatCurrency, formatDateTime, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import sql from "@/lib/db";
import LedgerContent from "./LedgerContent";

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
          <h1 className="font-display text-4xl font-light" style={{ color: "var(--text)", letterSpacing: "0.02em" }}>
            Transaction Ledger
          </h1>
          <p className="mt-1 text-sm" style={{ color: "var(--text-2)" }}>
            Complete fund activity — {totalTx} transactions
          </p>
        </div>
      </div>

      {/* Summary strip */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 mb-8">
        <div className="stat-card stat-card-gold">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
            Transactions
          </p>
          <p className="font-mono text-2xl font-medium" style={{ color: "var(--brand)" }}>{totalTx}</p>
        </div>
        <div className="stat-card stat-card-green">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
            Total Inflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--green)" }}>{formatCurrency(stats.total_inflow)}</p>
          <p className="text-[10px] mt-0.5" style={{ color: "var(--text-3)" }}>{creditTx.length} credits</p>
        </div>
        <div className="stat-card stat-card-red">
          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
            Total Outflow
          </p>
          <p className="font-mono text-lg font-medium" style={{ color: "var(--red)" }}>{formatCurrency(stats.total_outflow)}</p>
          <p className="text-[10px] mt-0.5" style={{ color: "var(--text-3)" }}>{debitTx.length} debits</p>
        </div>
        {(() => {
          const net = parseFloat(stats.total_inflow) - parseFloat(stats.total_outflow);
          const isPos = net >= 0;
          return (
            <div className={`stat-card ${isPos ? "stat-card-green" : "stat-card-red"}`}>
              <p className="text-[10px] font-semibold tracking-widest uppercase mb-1.5" style={{ color: "var(--text-3)" }}>
                Net Position
              </p>
              <p className="font-mono text-lg font-medium" style={{ color: isPos ? "var(--green)" : "var(--red)" }}>
                {formatCurrency(Math.abs(net))}
              </p>
              <p className="text-[10px] mt-0.5" style={{ color: "var(--text-3)" }}>
                {isPos ? "fund surplus" : "fund deficit"}
              </p>
            </div>
          );
        })()}
      </div>

      {/* Ledger by month */}
      {allTx.length === 0 ? (
        <div className="card flex flex-col items-center justify-center py-20">
          <p className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>No transactions recorded</p>
          <p className="text-xs mt-2" style={{ color: "var(--text-3)" }}>Go to a client profile to record transactions</p>
          <Link href="/persons" className="btn btn-outline mt-6">View Clients</Link>
        </div>
      ) : (
        <LedgerContent allTx={allTx} grouped={grouped} months={months} monthLabel={monthLabel} />
      )}
    </div>
  );
}
