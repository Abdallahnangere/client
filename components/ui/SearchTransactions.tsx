"use client";

import { useState, useMemo } from "react";

interface Transaction {
  id: number;
  transaction_date: string | null;
  type: "CREDIT" | "DEBIT";
  amount: number;
  sender: string;
  receiver: string;
  bank: string | null;
  reference_number: string | null;
  person_name: string;
}

interface SearchTransactionsProps {
  transactions: Transaction[];
  children: (filtered: Transaction[]) => React.ReactNode;
}

export default function SearchTransactions({
  transactions,
  children,
}: SearchTransactionsProps) {
  const [searchQuery, setSearchQuery] = useState("");

  const filtered = useMemo(() => {
    if (!searchQuery.trim()) return transactions;

    const q = searchQuery.toLowerCase();
    return transactions.filter(
      (tx) =>
        tx.id.toString().includes(q) ||
        tx.sender.toLowerCase().includes(q) ||
        tx.receiver.toLowerCase().includes(q) ||
        tx.bank?.toLowerCase().includes(q) ||
        tx.reference_number?.toLowerCase().includes(q) ||
        tx.person_name?.toLowerCase().includes(q) ||
        tx.amount.toString().includes(q) ||
        tx.type.toLowerCase().includes(q)
    );
  }, [searchQuery, transactions]);

  return (
    <>
      <div className="mb-6">
        <input
          type="text"
          placeholder="Search by ID, sender, receiver, bank, reference, amount..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="input w-full"
        />
        {searchQuery && (
          <p className="mt-2 text-sm" style={{ color: "var(--text-3)" }}>
            Found {filtered.length} of {transactions.length} transactions
          </p>
        )}
      </div>
      {children(filtered)}
    </>
  );
}
