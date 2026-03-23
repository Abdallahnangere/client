import { NextRequest, NextResponse } from "next/server";
import { deleteTransaction, toggleTransactionType } from "@/lib/db";

export const dynamic = "force-dynamic";

interface Context {
  params: { id: string };
}

export async function PATCH(_req: NextRequest, { params }: Context) {
  try {
    const id = parseInt(params.id);
    if (isNaN(id)) {
      return NextResponse.json({ error: "Invalid ID" }, { status: 400 });
    }

    const updated = await toggleTransactionType(id);
    if (!updated) {
      return NextResponse.json({ error: "Transaction not found" }, { status: 404 });
    }

    return NextResponse.json(updated);
  } catch (err) {
    console.error(`PATCH /api/transactions/${params.id}:`, err);
    return NextResponse.json({ error: "Failed to update transaction" }, { status: 500 });
  }
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
