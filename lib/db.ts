import { neon } from "@neondatabase/serverless";

if (!process.env.DATABASE_URL) {
  throw new Error("DATABASE_URL environment variable is not set");
}

const sql = neon(process.env.DATABASE_URL);

export default sql;

// ─── Types ──────────────────────────────────────────────────────────────────

export interface Person {
  id: number;
  full_name: string;
  phone: string | null;
  email: string | null;
  notes: string | null;
  created_at: string;
}

export interface Transaction {
  id: number;
  person_id: number;
  type: "CREDIT" | "DEBIT";
  amount: string;
  sender: string;
  receiver: string;
  transaction_date: string;
  bank: string | null;
  reference_number: string | null;
  status: string;
  note: string | null;
  created_at: string;
}

export interface PersonBalanceSummary {
  person_id: number;
  full_name: string;
  total_inflow: string;
  total_outflow: string;
  net_balance: string;
  surplus: string;
  deficit: string;
  margin_percent: string | null;
  transaction_count: string;
  credit_count: string;
  debit_count: string;
}

// ─── Persons ────────────────────────────────────────────────────────────────

export async function getPersons(): Promise<Person[]> {
  return sql`SELECT * FROM persons ORDER BY created_at DESC` as unknown as Promise<Person[]>;
}

export async function getPerson(id: number): Promise<Person | null> {
  const rows = await sql`SELECT * FROM persons WHERE id = ${id}` as unknown as Person[];
  return rows[0] || null;
}

export async function createPerson(data: {
  full_name: string;
  phone?: string;
  email?: string;
  notes?: string;
}): Promise<Person> {
  const rows = await sql`
    INSERT INTO persons (full_name, phone, email, notes)
    VALUES (${data.full_name}, ${data.phone || null}, ${data.email || null}, ${data.notes || null})
    RETURNING *
  ` as unknown as Person[];
  return rows[0];
}

export async function updatePerson(
  id: number,
  data: {
    full_name: string;
    phone?: string;
    email?: string;
    notes?: string;
  }
): Promise<Person | null> {
  const rows = await sql`
    UPDATE persons
    SET full_name = ${data.full_name},
        phone = ${data.phone || null},
        email = ${data.email || null},
        notes = ${data.notes || null}
    WHERE id = ${id}
    RETURNING *
  ` as unknown as Person[];
  return rows[0] || null;
}

export async function deletePerson(id: number): Promise<boolean> {
  const rows = await sql`DELETE FROM persons WHERE id = ${id} RETURNING id` as unknown as {id:number}[];
  return rows.length > 0;
}

// ─── Transactions ────────────────────────────────────────────────────────────

export async function getTransactionsByPerson(personId: number): Promise<Transaction[]> {
  return sql`
    SELECT * FROM transactions
    WHERE person_id = ${personId}
    ORDER BY transaction_date DESC, created_at DESC
  ` as unknown as Promise<Transaction[]>;
}

export async function createTransaction(data: {
  person_id: number;
  type: "CREDIT" | "DEBIT";
  amount: number;
  sender: string;
  receiver: string;
  transaction_date: string;
  bank?: string;
  reference_number?: string;
  status?: string;
  note?: string;
}): Promise<Transaction> {
  const rows = await sql`
    INSERT INTO transactions
      (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
    VALUES
      (${data.person_id}, ${data.type}, ${data.amount}, ${data.sender}, ${data.receiver},
       ${data.transaction_date}, ${data.bank || null}, ${data.reference_number || null},
       ${data.status || "SUCCESSFUL"}, ${data.note || null})
    RETURNING *
  ` as unknown as Transaction[];
  return rows[0];
}

export async function deleteTransaction(id: number): Promise<boolean> {
  const rows = await sql`DELETE FROM transactions WHERE id = ${id} RETURNING id` as unknown as {id:number}[];
  return rows.length > 0;
}

// ─── Summary / Dashboard ─────────────────────────────────────────────────────

export async function getPersonBalanceSummaries(): Promise<PersonBalanceSummary[]> {
  return sql`SELECT * FROM person_balance_summary ORDER BY full_name` as unknown as Promise<PersonBalanceSummary[]>;
}

export async function getPersonBalanceSummary(personId: number): Promise<PersonBalanceSummary | null> {
  const rows = await sql`
    SELECT * FROM person_balance_summary WHERE person_id = ${personId}
  ` as unknown as PersonBalanceSummary[];
  return rows[0] || null;
}

export async function getDashboardStats() {
  const stats = await sql`
    SELECT
      COUNT(DISTINCT p.id)                                          AS total_persons,
      COUNT(t.id)                                                   AS total_transactions,
      COALESCE(SUM(CASE WHEN t.type = 'CREDIT' THEN t.amount END), 0) AS total_inflow,
      COALESCE(SUM(CASE WHEN t.type = 'DEBIT'  THEN t.amount END), 0) AS total_outflow
    FROM persons p
    LEFT JOIN transactions t ON t.person_id = p.id
  `;
  return stats[0] as {
    total_persons: string;
    total_transactions: string;
    total_inflow: string;
    total_outflow: string;
  };
}

export async function getRecentTransactions(limit = 10): Promise<(Transaction & { person_name: string })[]> {
  return sql`
    SELECT t.*, p.full_name AS person_name
    FROM transactions t
    JOIN persons p ON p.id = t.person_id
    ORDER BY t.transaction_date DESC, t.created_at DESC
    LIMIT ${limit}
  ` as unknown as Promise<(Transaction & { person_name: string })[]>;
}
