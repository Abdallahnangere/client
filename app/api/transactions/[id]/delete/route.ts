// app/api/transactions/[id]/route.ts
import { neon } from "@neondatabase/serverless";

const sql = neon(process.env.DATABASE_URL!);

export async function DELETE(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const id = parseInt(params.id);

    // Delete transaction
    const result = await sql`
      DELETE FROM transactions
      WHERE id = ${id}
      RETURNING id, person_id
    `;

    if (result.length === 0) {
      return new Response(
        JSON.stringify({ error: "Transaction not found" }),
        { status: 404, headers: { "Content-Type": "application/json" } }
      );
    }

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: `Transaction #${id} deleted`,
        deleted_id: id
      }),
      { status: 200, headers: { "Content-Type": "application/json" } }
    );
  } catch (err: any) {
    return new Response(
      JSON.stringify({ error: err.message }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    );
  }
}

export async function PATCH(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const id = parseInt(params.id);
    const body = await request.json();

    const { amount, type, sender, receiver, bank, reference_number, note } = body;

    // Update transaction
    const result = await sql`
      UPDATE transactions
      SET 
        amount = COALESCE(${amount}, amount),
        type = COALESCE(${type}, type),
        sender = COALESCE(${sender}, sender),
        receiver = COALESCE(${receiver}, receiver),
        bank = COALESCE(${bank}, bank),
        reference_number = COALESCE(${reference_number}, reference_number),
        note = COALESCE(${note}, note)
      WHERE id = ${id}
      RETURNING *
    `;

    if (result.length === 0) {
      return new Response(
        JSON.stringify({ error: "Transaction not found" }),
        { status: 404, headers: { "Content-Type": "application/json" } }
      );
    }

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: `Transaction #${id} updated`,
        transaction: result[0]
      }),
      { status: 200, headers: { "Content-Type": "application/json" } }
    );
  } catch (err: any) {
    return new Response(
      JSON.stringify({ error: err.message }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    );
  }
}
