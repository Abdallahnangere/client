import { getPerson, getTransactionsByPerson, getPersonBalanceSummary } from "@/lib/db";
import { formatCurrency, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import { notFound } from "next/navigation";
import TransactionActions from "./TransactionActions";
import PersonTransactions from "./PersonTransactions";

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

  const inflow = summary ? parseFloat(String(summary.total_inflow)) : 0;
  const outflow = summary ? parseFloat(String(summary.total_outflow)) : 0;
  const debts = Math.max(inflow - outflow, 0); // what fund owes client
  const overpayment = Math.max(outflow - inflow, 0); // what client owes fund

  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Breadcrumb */}
      <div className="flex items-center gap-2 mb-8 text-xs" style={{ color: "var(--text-3)" }}>
        <Link href="/persons" className="hover:opacity-70 transition-opacity" style={{ color: "var(--brand)" }}>
          Clients
        </Link>
        <span>&rsaquo;</span>
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
                {toTitleCase(person.full_name).split(" ").map((w: string) => w[0]).join("").slice(0, 2)}
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
                <p className="text-xs font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                  Fund Outflow
                </p>
                <p className="font-mono text-lg" style={{ color: "var(--red)" }}>
                  {formatCurrency(outflow)}
                </p>
                <p className="text-xs" style={{ color: "var(--text-3)" }}>
                  {summary?.debit_count ?? 0} debits
                </p>
              </div>
              <div className="text-center lg:text-right">
                <p className="text-xs font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                  Fund Inflow
                </p>
                <p className="font-mono text-lg" style={{ color: "var(--green)" }}>
                  {formatCurrency(inflow)}
                </p>
                <p className="text-xs" style={{ color: "var(--text-3)" }}>
                  {summary?.credit_count ?? 0} credits
                </p>
              </div>
              <div
                className="text-center lg:text-right px-4 py-0 rounded-lg"
                style={{ borderLeft: "2px solid " + (debts > 0 ? "var(--red-border)" : overpayment > 0 ? "var(--green-border)" : "var(--border)") }}
              >
                <p className="text-xs font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                  Debts
                </p>
                <p
                  className="font-mono text-lg font-medium"
                  style={{ color: debts > 0 ? "var(--red)" : "var(--text-2)" }}
                >
                  {formatCurrency(debts)}
                </p>
                <p className="text-xs" style={{ color: "var(--text-3)" }}>
                  {debts > 0 ? "fund owes client" : "none"}
                </p>
              </div>
              <div
                className="text-center lg:text-right px-4 py-0 rounded-lg"
                style={{ borderLeft: "2px solid " + (overpayment > 0 ? "var(--green-border)" : "var(--border)") }}
              >
                <p className="text-xs font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                  Overpayment
                </p>
                <p
                  className="font-mono text-lg font-medium"
                  style={{ color: overpayment > 0 ? "var(--green)" : "var(--text-2)" }}
                >
                  {formatCurrency(overpayment)}
                </p>
                <p className="text-xs" style={{ color: "var(--text-3)" }}>
                  {overpayment > 0 ? "client owes fund" : "none"}
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
            <Link href={"/persons/" + person.id + "/edit"} className="btn btn-outline">
              <svg width="13" height="13" viewBox="0 0 13 13" fill="none">
                <path d="M8.5 1.5l3 3-8 8H0.5v-3l8-8z" stroke="currentColor" strokeWidth="1.2" strokeLinecap="square" />
              </svg>
              Edit Profile
            </Link>
            <a
              href={"/api/persons/" + person.id + "/export"}
              download={toTitleCase(person.full_name).replace(/\s+/g, "_") + "_transactions.xlsx"}
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
      <div className="card overflow-hidden">
        <div
          className="px-6 py-4 flex items-center justify-between"
          style={{ borderBottom: "1px solid var(--border)" }}
        >
          <div>
            <h2 className="text-xs font-semibold tracking-widest uppercase" style={{ color: "var(--text-3)" }}>
              Transaction Ledger
            </h2>
            <p className="text-xs mt-0.5" style={{ color: "var(--text-3)" }}>
              {transactions.length} transaction{transactions.length !== 1 ? "s" : ""}
            </p>
          </div>
        </div>

        {transactions.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-16">
            <p className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>No transactions</p>
            <p className="text-xs mt-1" style={{ color: "var(--text-3)" }}>Record the first transaction above</p>
          </div>
        ) : (
          <PersonTransactions transactions={transactions as any[]} />
        )}
      </div>
    </div>
  );
}