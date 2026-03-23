"use client";

import { useState, useMemo } from "react";

interface Person {
  id: number;
  full_name: string;
}

interface SearchClientsProps {
  persons: Person[];
  children: (filtered: Person[]) => React.ReactNode;
}

export default function SearchClients({
  persons,
  children,
}: SearchClientsProps) {
  const [searchQuery, setSearchQuery] = useState("");

  const filtered = useMemo(() => {
    if (!searchQuery.trim()) return persons;

    const q = searchQuery.toLowerCase();
    return persons.filter(
      (p) =>
        p.id.toString().includes(q) ||
        p.full_name.toLowerCase().includes(q)
    );
  }, [searchQuery, persons]);

  return (
    <>
      <div className="mb-6">
        <input
          type="text"
          placeholder="Search by client ID or name..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="input w-full"
        />
        {searchQuery && (
          <p className="mt-2 text-sm" style={{ color: "var(--text-3)" }}>
            Found {filtered.length} of {persons.length} clients
          </p>
        )}
      </div>
      {children(filtered)}
    </>
  );
}
