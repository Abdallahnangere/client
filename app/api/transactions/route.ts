import { NextRequest, NextResponse } from "next/server";
import { createTransaction } from "@/lib/db";

export const dynamic = "force-dynamic";

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();

    // Validation
    if (!body.person_id || isNaN(parseInt(body.person_id))) {
      return NextResponse.json({ error: "person_id is required" }, { status: 400 });
    }

    if (!body.type || !["CREDIT", "DEBIT"].includes(body.type)) {
      return NextResponse.json({ error: "type must be CREDIT or DEBIT" }, { status: 400 });
    }

    const amount = parseFloat(body.amount);
    if (isNaN(amount) || amount <= 0) {
      return NextResponse.json({ error: "amount must be a positive number" }, { status: 400 });
    }

    if (!body.sender?.trim()) {
      return NextResponse.json({ error: "sender is required" }, { status: 400 });
    }

    if (!body.receiver?.trim()) {
      return NextResponse.json({ error: "receiver is required" }, { status: 400 });
    }

    if (!body.transaction_date) {
      return NextResponse.json({ error: "transaction_date is required" }, { status: 400 });
    }

    const tx = await createTransaction({
      person_id: parseInt(body.person_id),
      type: body.type,
      amount,
      sender: body.sender.trim().toUpperCase(),
      receiver: body.receiver.trim().toUpperCase(),
      transaction_date: body.transaction_date,
      bank: body.bank?.trim() || undefined,
      reference_number: body.reference_number?.trim() || undefined,
      status: body.status?.trim() || "SUCCESSFUL",
      note: body.note?.trim() || undefined,
    });

    return NextResponse.json(tx, { status: 201 });
  } catch (err) {
    console.error("POST /api/transactions:", err);
    return NextResponse.json({ error: "Failed to create transaction" }, { status: 500 });
  }
}
