import { NextResponse } from "next/server";
import { getPersonBalanceSummaries } from "@/lib/db";
import * as XLSX from "xlsx";

export async function GET() {
  const summaries = await getPersonBalanceSummaries();

  const rows = summaries.map((s, i) => {
    const inflow = parseFloat(s.total_inflow);
    const outflow = parseFloat(s.total_outflow);
    const outstanding = Math.max(inflow - outflow, 0);
    const surplus = Math.max(outflow - inflow, 0);
    const net = inflow - outflow;

    return {
      "S/N": i + 1,
      "Full Name": s.full_name,
      "Credit (NGN)": inflow,
      "Debit (NGN)": outflow,
      "Outstanding (NGN)": outstanding,
      "Surplus (NGN)": surplus,
      "Net Balance (NGN)": net,
      "Transactions": parseInt(s.transaction_count),
    };
  });

  // Totals row
  rows.push({
    "S/N": "" as any,
    "Full Name": "TOTAL",
    "Credit (NGN)": rows.reduce((a, r) => a + (typeof r["Credit (NGN)"] === "number" ? r["Credit (NGN)"] : 0), 0),
    "Debit (NGN)": rows.reduce((a, r) => a + (typeof r["Debit (NGN)"] === "number" ? r["Debit (NGN)"] : 0), 0),
    "Outstanding (NGN)": rows.reduce((a, r) => a + (typeof r["Outstanding (NGN)"] === "number" ? r["Outstanding (NGN)"] : 0), 0),
    "Surplus (NGN)": rows.reduce((a, r) => a + (typeof r["Surplus (NGN)"] === "number" ? r["Surplus (NGN)"] : 0), 0),
    "Net Balance (NGN)": rows.reduce((a, r) => a + (typeof r["Net Balance (NGN)"] === "number" ? r["Net Balance (NGN)"] : 0), 0),
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
