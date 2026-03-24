import { NextRequest, NextResponse } from "next/server";
import { deleteManyTransactions } from "@/lib/db";

export const dynamic = "force-dynamic";

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const ids: unknown = body?.ids;

    if (!Array.isArray(ids) || ids.length === 0) {
      return NextResponse.json({ error: "ids must be a non-empty array" }, { status: 400 });
    }

    const safeIds = ids.filter((v) => typeof v === "number" && Number.isInteger(v) && v > 0) as number[];
    if (safeIds.length === 0) {
      return NextResponse.json({ error: "No valid IDs provided" }, { status: 400 });
    }

    const deleted = await deleteManyTransactions(safeIds);
    return NextResponse.json({ deleted });
  } catch (err) {
    console.error("POST /api/transactions/batch-delete:", err);
    return NextResponse.json({ error: "Failed to delete transactions" }, { status: 500 });
  }
}
