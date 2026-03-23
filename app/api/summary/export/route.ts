import { NextResponse } from "next/server";
import { getPersonBalanceSummaries } from "@/lib/db";
import * as XLSX from "xlsx";

export async function GET() {
  const summaries = await getPersonBalanceSummaries();

  const rows = summaries.map((s, i) => ({
    "S/N": i + 1,
    "Full Name": s.full_name,
    "Credit (NGN)": parseFloat(s.total_inflow),
    "Debit (NGN)": parseFloat(s.total_outflow),
    "Outstanding (NGN)": parseFloat(s.deficit),
    "Surplus (NGN)": parseFloat(s.surplus),
    "Net Balance (NGN)": parseFloat(s.net_balance),
    "Transactions": parseInt(s.transaction_count),
  }));

  // Totals row
  rows.push({
    "S/N": "" as any,
    "Full Name": "TOTAL",
    "Credit (NGN)": summaries.reduce((a, s) => a + parseFloat(s.total_inflow), 0),
    "Debit (NGN)": summaries.reduce((a, s) => a + parseFloat(s.total_outflow), 0),
    "Outstanding (NGN)": summaries.reduce((a, s) => a + parseFloat(s.deficit), 0),
    "Surplus (NGN)": summaries.reduce((a, s) => a + parseFloat(s.surplus), 0),
    "Net Balance (NGN)": summaries.reduce((a, s) => a + parseFloat(s.net_balance), 0),
    "Transactions": summaries.reduce((a, s) => a + parseInt(s.transaction_count), 0),
  });

  const ws = XLSX.utils.json_to_sheet(rows);

  ws["!cols"] = [
    { wch: 5 },   // S/N
    { wch: 30 },  // Full Name
    { wch: 18 },  // Credit
    { wch: 18 },  // Debit
    { wch: 20 },  // Outstanding
    { wch: 18 },  // Surplus
    { wch: 20 },  // Net Balance
    { wch: 14 },  // Transactions
  ];

  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "Summary");

  const buffer = XLSX.write(wb, { type: "buffer", bookType: "xlsx" });

  const date = new Date().toISOString().split("T")[0];

  return new NextResponse(buffer, {
    headers: {
      "Content-Type":
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "Content-Disposition": `attachment; filename="Capital_Summary_${date}.xlsx"`,
      "Cache-Control": "no-store",
    },
  });
}
