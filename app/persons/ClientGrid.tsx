"use client";

import { formatCurrency, formatDate, toTitleCase } from "@/lib/utils";
import Link from "next/link";
import type { Person, PersonBalanceSummary } from "@/lib/db";

interface ClientGridProps {
  persons: Person[];
  summaryMap: Map<number, PersonBalanceSummary>;
}

export default function ClientGrid({ persons, summaryMap }: ClientGridProps) {
  return (
    <div className="space-y-3">
      {persons.map((person) => {
        const s = summaryMap.get(person.id);
        const deficit = s ? parseFloat(s.deficit.toString()) : 0;
        const surplus = s ? parseFloat(s.surplus.toString()) : 0;
        const outflow = s ? parseFloat(s.total_outflow.toString()) : 0;
        const inflow = s ? parseFloat(s.total_inflow.toString()) : 0;
        const txCount = s ? parseInt(s.transaction_count.toString()) : 0;

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
                  {toTitleCase(person.full_name)
                    .split(" ")
                    .map((w) => w[0])
                    .join("")
                    .slice(0, 2)}
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
                      <span
                        className="text-xs flex items-center gap-1"
                        style={{ color: "var(--text-2)" }}
                      >
                        <svg
                          width="10"
                          height="10"
                          viewBox="0 0 10 10"
                          fill="none"
                        >
                          <rect
                            x="1.5"
                            y="0.5"
                            width="7"
                            height="9"
                            rx="1"
                            stroke="currentColor"
                            strokeWidth="0.8"
                          />
                          <circle cx="5" cy="8" r="0.5" fill="currentColor" />
                        </svg>
                        {person.phone}
                      </span>
                    )}
                    {person.email && (
                      <span
                        className="text-xs flex items-center gap-1"
                        style={{ color: "var(--text-2)" }}
                      >
                        <svg
                          width="10"
                          height="10"
                          viewBox="0 0 10 10"
                          fill="none"
                        >
                          <rect
                            x="0.5"
                            y="2"
                            width="9"
                            height="6"
                            rx="0.5"
                            stroke="currentColor"
                            strokeWidth="0.8"
                          />
                          <path
                            d="M0.5 2.5L5 5.5l4.5-3"
                            stroke="currentColor"
                            strokeWidth="0.8"
                          />
                        </svg>
                        {person.email}
                      </span>
                    )}
                    <span
                      className="text-xs"
                      style={{ color: "var(--text-3)" }}
                    >
                      Since {formatDate(person.created_at)}
                    </span>
                  </div>

                  {person.notes && (
                    <p
                      className="text-xs mt-1.5 font-mono"
                      style={{ color: "var(--text-3)" }}
                    >
                      {person.notes.slice(0, 80)}
                      {person.notes.length > 80 ? "…" : ""}
                    </p>
                  )}
                </div>
              </div>

              {/* Stats */}
              {s && (
                <div className="flex gap-6 sm:text-right flex-shrink-0">
                  <div>
                    <p
                      className="text-[10px] font-semibold tracking-widest uppercase mb-1"
                      style={{ color: "var(--text-3)" }}
                    >
                      Outflow
                    </p>
                    <p
                      className="font-mono text-sm font-medium"
                      style={{ color: "var(--red)" }}
                    >
                      {formatCurrency(outflow)}
                    </p>
                  </div>
                  <div>
                    <p
                      className="text-[10px] font-semibold tracking-widest uppercase mb-1"
                      style={{ color: "var(--text-3)" }}
                    >
                      Inflow
                    </p>
                    <p
                      className="font-mono text-sm font-medium"
                      style={{ color: "var(--green)" }}
                    >
                      {formatCurrency(inflow)}
                    </p>
                  </div>
                  <div>
                    <p
                      className="text-[10px] font-semibold tracking-widest uppercase mb-1"
                      style={{ color: "var(--text-3)" }}
                    >
                      {deficit > 0 ? "Owed" : "Surplus"}
                    </p>
                    <p
                      className="font-mono text-sm font-medium"
                      style={{
                        color: deficit > 0 ? "var(--red)" : "var(--green)",
                      }}
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
                  <svg
                    width="14"
                    height="14"
                    viewBox="0 0 14 14"
                    fill="none"
                  >
                    <path
                      d="M9.5 1.5l3 3-8 8H1.5v-3l8-8z"
                      stroke="currentColor"
                      strokeWidth="1.2"
                      strokeLinecap="square"
                      strokeLinejoin="miter"
                    />
                  </svg>
                </Link>
              </div>
            </div>
          </div>
        );
      })}
    </div>
  );
}
