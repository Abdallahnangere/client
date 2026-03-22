import { NextRequest, NextResponse } from "next/server";
import { deleteTransaction } from "@/lib/db";

export const dynamic = "force-dynamic";

interface Context {
  params: { id: string };
}

export async function DELETE(_req: NextRequest, { params }: Context) {
  try {
    const id = parseInt(params.id);
    if (isNaN(id)) {
      return NextResponse.json({ error: "Invalid ID" }, { status: 400 });
    }

    const deleted = await deleteTransaction(id);
    if (!deleted) {
      return NextResponse.json({ error: "Transaction not found" }, { status: 404 });
    }

    return NextResponse.json({ success: true });
  } catch (err) {
    console.error(`DELETE /api/transactions/${params.id}:`, err);
    return NextResponse.json({ error: "Failed to delete transaction" }, { status: 500 });
  }
}
