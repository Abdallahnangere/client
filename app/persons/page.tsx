import { getPersons, getPersonBalanceSummaries } from "@/lib/db";
import { formatCurrency, formatDate, toTitleCase } from "@/lib/utils";
import Link from "next/link";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function PersonsPage() {
  const [persons, summaries] = await Promise.all([
    getPersons(),
    getPersonBalanceSummaries(),
  ]);

  const summaryMap = new Map(summaries.map((s) => [s.person_id, s]));

  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Header */}
      <div className="flex items-start justify-between gap-4 mb-10">
        <div>
          <div className="eyebrow">Fund Registry</div>
          <h1
            className="font-display text-4xl font-light"
            style={{ color: "var(--text)", letterSpacing: "0.02em" }}
          >
            Client Directory
          </h1>
          <p className="mt-1 text-sm" style={{ color: "var(--text-2)" }}>
            {persons.length} registered client{persons.length !== 1 ? "s" : ""}
          </p>
        </div>
        <Link
          href="/persons/new"
          className="btn btn-gold flex-shrink-0"
        >
          <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
            <path d="M7 1v12M1 7h12" stroke="currentColor" strokeWidth="1.8" strokeLinecap="square" />
          </svg>
          Add Client
        </Link>
      </div>

      {/* Client Grid */}
      {persons.length === 0 ? (
        <div className="card flex flex-col items-center justify-center py-20">
          <svg width="48" height="48" viewBox="0 0 48 48" fill="none" className="mb-4 opacity-15" style={{ color: "var(--text-2)" }}>
            <circle cx="24" cy="16" r="8" stroke="currentColor" strokeWidth="1.5" />
            <path d="M8 40c0-8.837 7.163-16 16-16s16 7.163 16 16" stroke="currentColor" strokeWidth="1.5" strokeLinecap="square" />
          </svg>
          <h3 className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>
            No clients registered
          </h3>
          <p className="text-xs mt-2" style={{ color: "var(--text-3)" }}>
            Add your first client to begin tracking capital
          </p>
          <Link href="/persons/new" className="btn btn-gold mt-6">
            Register First Client
          </Link>
        </div>
      ) : (
        <div className="space-y-3">
          {persons.map((person) => {
            const s = summaryMap.get(person.id);
            const deficit = s ? parseFloat(s.deficit) : 0;
            const surplus = s ? parseFloat(s.surplus) : 0;
            const outflow = s ? parseFloat(s.total_outflow) : 0;
            const inflow = s ? parseFloat(s.total_inflow) : 0;
            const txCount = s ? parseInt(s.transaction_count) : 0;

            return (
              <div
                key={person.id}
                className="card card-hover relative group"
              >
                {/* Left accent bar */}
                <div
                  className="absolute left-0 top-0 bottom-0 w-0.5 rounded-l"
                  style={{
                    background: deficit > 0
                      ? "var(--red)"
                      : surplus > 0
                        ? "var(--green)"
                        : "var(--brand)",
                  }}
                />

                <div className="pl-5 pr-5 py-5 flex flex-col sm:flex-row gap-4">
                  {/* Avatar + Info */}
                  <div className="flex items-start gap-4 flex-1">
                    <div
                      className="w-10 h-10 rounded-xl flex-shrink-0 flex items-center justify-center text-sm font-semibold"
                      style={{
                        background: "var(--surface-2)",
                        border: "1px solid var(--border)",
                        color: "var(--brand)",
                      }}
                    >
                      {toTitleCase(person.full_name).split(" ").map(w => w[0]).join("").slice(0, 2)}
                    </div>

                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 flex-wrap">
                        <h3
                          className="font-display text-xl font-light leading-tight"
                          style={{ color: "var(--text)" }}
                        >
                          {toTitleCase(person.full_name)}
                        </h3>
                        {txCount === 0 && (
                          <span className="badge badge-gold">New</span>
                        )}
                      </div>

                      <div className="flex flex-wrap gap-x-4 gap-y-1 mt-1.5">
                        {person.phone && (
                          <span className="text-xs flex items-center gap-1" style={{ color: "var(--text-2)" }}>
                            <svg width="10" height="10" viewBox="0 0 10 10" fill="none">
                              <rect x="1.5" y="0.5" width="7" height="9" rx="1" stroke="currentColor" strokeWidth="0.8" />
                              <circle cx="5" cy="8" r="0.5" fill="currentColor" />
                            </svg>
                            {person.phone}
                          </span>
                        )}
                        {person.email && (
                          <span className="text-xs flex items-center gap-1" style={{ color: "var(--text-2)" }}>
                            <svg width="10" height="10" viewBox="0 0 10 10" fill="none">
                              <rect x="0.5" y="2" width="9" height="6" rx="0.5" stroke="currentColor" strokeWidth="0.8" />
                              <path d="M0.5 2.5L5 5.5l4.5-3" stroke="currentColor" strokeWidth="0.8" />
                            </svg>
                            {person.email}
                          </span>
                        )}
                        <span className="text-xs" style={{ color: "var(--text-3)" }}>
                          Since {formatDate(person.created_at)}
                        </span>
                      </div>

                      {person.notes && (
                        <p className="text-xs mt-1.5 font-mono" style={{ color: "var(--text-3)" }}>
                          {person.notes.slice(0, 80)}{person.notes.length > 80 ? "…" : ""}
                        </p>
                      )}
                    </div>
                  </div>

                  {/* Stats */}
                  {s && (
                    <div className="flex gap-6 sm:text-right flex-shrink-0">
                      <div>
                        <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                          Outflow
                        </p>
                        <p className="font-mono text-sm font-medium" style={{ color: "var(--red)" }}>
                          {formatCurrency(outflow)}
                        </p>
                      </div>
                      <div>
                        <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                          Inflow
                        </p>
                        <p className="font-mono text-sm font-medium" style={{ color: "var(--green)" }}>
                          {formatCurrency(inflow)}
                        </p>
                      </div>
                      <div>
                        <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                          {deficit > 0 ? "Owed" : "Surplus"}
                        </p>
                        <p
                          className="font-mono text-sm font-medium"
                          style={{ color: deficit > 0 ? "var(--red)" : "var(--green)" }}
                        >
                          {formatCurrency(deficit > 0 ? deficit : surplus)}
                        </p>
                      </div>
                    </div>
                  )}

                  {/* Actions */}
                  <div className="flex items-center gap-2 flex-shrink-0">
                    <Link
                      href={`/persons/${person.id}`}
                      className="btn btn-outline text-xs px-3 py-2"
                    >
                      View Ledger
                    </Link>
                    <Link
                      href={`/persons/${person.id}/edit`}
                      className="btn btn-ghost p-2"
                      title="Edit"
                    >
                      <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                        <path d="M9.5 1.5l3 3-8 8H1.5v-3l8-8z" stroke="currentColor" strokeWidth="1.2" strokeLinecap="square" strokeLinejoin="miter" />
                      </svg>
                    </Link>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
