import { getPersons, getPersonBalanceSummaries } from "@/lib/db";
import Link from "next/link";
import PersonsView from "./PersonsView";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function PersonsPage() {
  const [persons, summaries] = await Promise.all([
    getPersons(),
    getPersonBalanceSummaries(),
  ]);

  // Build a plain object map (serializable across server/client boundary)
  const summaryMap: Record<number, (typeof summaries)[0]> = {};
  for (const s of summaries) {
    summaryMap[s.person_id] = s;
  }

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
        <Link href="/persons/new" className="btn btn-gold flex-shrink-0">
          <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
            <path d="M7 1v12M1 7h12" stroke="currentColor" strokeWidth="1.8" strokeLinecap="square" />
          </svg>
          Add Client
        </Link>
      </div>

      {/* Client list */}
      {persons.length === 0 ? (
        <div className="card flex flex-col items-center justify-center py-20">
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
        <PersonsView persons={persons} summaryMap={summaryMap} />
      )}
    </div>
  );
}