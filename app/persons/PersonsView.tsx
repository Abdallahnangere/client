"use client";

import { useState, useMemo } from "react";
import { formatCurrency, formatDate, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import type { Person, PersonBalanceSummary } from "@/lib/db";

interface PersonsViewProps {
  persons: Person[];
  summaryMap: Record<number, PersonBalanceSummary>;
}

export default function PersonsView({ persons, summaryMap }: PersonsViewProps) {
  const [query, setQuery] = useState("");

  const filtered = useMemo(() => {
    if (!query.trim()) return persons;
    const q = query.toLowerCase();
    return persons.filter(
      (p) =>
        p.id.toString().includes(q) ||
        p.full_name.toLowerCase().includes(q) ||
        (p.phone || "").includes(q) ||
        (p.email || "").toLowerCase().includes(q)
    );
  }, [query, persons]);

  return (
    <div>
      {/* Search bar */}
      <div className="mb-6">
        <input
          type="text"
          placeholder="Search by client ID, name, phone, or email..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          className="input w-full"
        />
        {query && (
          <p className="mt-2 text-sm" style={{ color: "var(--text-3)" }}>
            Found {filtered.length} of {persons.length} clients
          </p>
        )}
      </div>

      {/* Client list */}
      {filtered.length === 0 ? (
        <div className="card flex flex-col items-center justify-center py-16">
          <p className="font-display text-xl font-light" style={{ color: "var(--text-2)" }}>No matching clients</p>
          <p className="text-xs mt-1" style={{ color: "var(--text-3)" }}>Try a different search term</p>
        </div>
      ) : (
        <div className="space-y-3">
          {filtered.map((person) => {
            const s = summaryMap[person.id];
            const inflow = s ? parseFloat(s.total_inflow) : 0;
            const outflow = s ? parseFloat(s.total_outflow) : 0;
            const debts = Math.max(inflow - outflow, 0);
            const overpayment = Math.max(outflow - inflow, 0);
            const txCount = s ? parseInt(String(s.transaction_count)) : 0;

            // Color, label, and context label logic (client perspective)
            let color = "var(--brand)";
            let label = "Settled";
            let value = 0;
            let contextLabel = "balanced";
            if (debts > 0) {
              color = "var(--red)";
              label = "Debts";
              value = debts;
              contextLabel = "fund owes client";
            } else if (overpayment > 0) {
              color = "var(--green)";
              label = "Overpayment";
              value = overpayment;
              contextLabel = "client owes fund";
            }

            return (
              <div key={person.id} className="card card-hover relative group">
                {/* Left accent bar */}
                <div
                  className="absolute left-0 top-0 bottom-0 w-0.5 rounded-l"
                  style={{ background: color }}
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
                      {toTitleCase(person.full_name).split(" ").map((w: string) => w[0]).join("").slice(0, 2)}
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
                          <span className="text-xs" style={{ color: "var(--text-2)" }}>{person.phone}</span>
                        )}
                        {person.email && (
                          <span className="text-xs" style={{ color: "var(--text-2)" }}>{person.email}</span>
                        )}
                        <span className="text-xs" style={{ color: "var(--text-3)" }}>
                          Since {formatDate(person.created_at)}
                        </span>
                      </div>

                      {person.notes && (
                        <p className="text-xs mt-1.5 font-mono" style={{ color: "var(--text-3)" }}>
                          {person.notes.slice(0, 80)}{person.notes.length > 80 ? "..." : ""}
                        </p>
                      )}
                    </div>
                  </div>

                  {/* Stats - Show all 4 metrics with mutual exclusivity */}
                  {s && (
                    <div className="flex gap-3 sm:gap-4 sm:text-right flex-shrink-0 flex-wrap sm:flex-nowrap">
                      <div className="text-center sm:text-right">
                        <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                          Inflow
                        </p>
                        <p className="font-mono text-xs font-medium" style={{ color: "var(--green)" }}>
                          {formatCurrency(inflow)}
                        </p>
                      </div>
                      <div className="text-center sm:text-right">
                        <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                          Outflow
                        </p>
                        <p className="font-mono text-xs font-medium" style={{ color: "var(--red)" }}>
                          {formatCurrency(outflow)}
                        </p>
                      </div>
                      {debts > 0 && (
                        <div className="text-center sm:text-right">
                          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                            Debt
                          </p>
                          <p className="font-mono text-xs font-medium" style={{ color: "var(--red)" }}>
                            {formatCurrency(debts)}
                          </p>
                        </div>
                      )}
                      {overpayment > 0 && (
                        <div className="text-center sm:text-right">
                          <p className="text-[10px] font-semibold tracking-widest uppercase mb-1" style={{ color: "var(--text-3)" }}>
                            Overpayment
                          </p>
                          <p className="font-mono text-xs font-medium" style={{ color: "var(--green)" }}>
                            {formatCurrency(overpayment)}
                          </p>
                        </div>
                      )}
                    </div>
                  )}

                  {/* Actions */}
                  <div className="flex items-center gap-2 flex-shrink-0">
                    <Link href={"/persons/" + person.id} className="btn btn-outline text-xs px-3 py-2">
                      View Ledger
                    </Link>
                    <Link href={"/persons/" + person.id + "/edit"} className="btn btn-ghost p-2" title="Edit">
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
