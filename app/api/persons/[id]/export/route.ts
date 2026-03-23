import { NextRequest, NextResponse } from "next/server";
import { getPerson, getTransactionsByPerson } from "@/lib/db";
import * as XLSX from "xlsx";

export async function GET(
  _req: NextRequest,
  { params }: { params: { id: string } }
) {
  const id = parseInt(params.id);
  if (isNaN(id)) {
    return NextResponse.json({ error: "Invalid ID" }, { status: 400 });
  }

  const [person, transactions] = await Promise.all([
    getPerson(id),
    getTransactionsByPerson(id),
  ]);

  if (!person) {
    return NextResponse.json({ error: "Client not found" }, { status: 404 });
  }

  const rows = transactions.map((tx, i) => ({
    "S/N": i + 1,
    "Date": tx.transaction_date
      ? new Date(tx.transaction_date).toLocaleDateString("en-GB")
      : "—",
    "Type": tx.type,
    "Amount (NGN)": parseFloat(tx.amount),
    "Sender": tx.sender,
    "Receiver": tx.receiver,
    "Bank": tx.bank ?? "—",
    "Reference": tx.reference_number ?? "—",
    "Status": tx.status,
    "Note": tx.note ?? "",
  }));

  const ws = XLSX.utils.json_to_sheet(rows);

  // Set column widths
  ws["!cols"] = [
    { wch: 5 },   // S/N
    { wch: 14 },  // Date
    { wch: 8 },   // Type
    { wch: 18 },  // Amount
    { wch: 22 },  // Sender
    { wch: 22 },  // Receiver
    { wch: 18 },  // Bank
    { wch: 22 },  // Reference
    { wch: 12 },  // Status
    { wch: 30 },  // Note
  ];

  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "Transactions");

  const buffer = XLSX.write(wb, { type: "buffer", bookType: "xlsx" });

  const safeName = person.full_name
    .replace(/[^a-zA-Z0-9\s]/g, "")
    .trim()
    .replace(/\s+/g, "_");

  return new NextResponse(buffer, {
    headers: {
      "Content-Type":
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "Content-Disposition": `attachment; filename="${safeName}_transactions.xlsx"`,
      "Cache-Control": "no-store",
    },
  });
}
