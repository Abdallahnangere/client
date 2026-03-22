import { NextRequest, NextResponse } from "next/server";
import { getPerson, updatePerson, deletePerson } from "@/lib/db";

export const dynamic = "force-dynamic";

interface Context {
  params: { id: string };
}

export async function GET(_req: NextRequest, { params }: Context) {
  try {
    const id = parseInt(params.id);
    if (isNaN(id)) {
      return NextResponse.json({ error: "Invalid ID" }, { status: 400 });
    }

    const person = await getPerson(id);
    if (!person) {
      return NextResponse.json({ error: "Person not found" }, { status: 404 });
    }

    return NextResponse.json(person);
  } catch (err) {
    console.error(`GET /api/persons/${params.id}:`, err);
    return NextResponse.json({ error: "Failed to fetch person" }, { status: 500 });
  }
}

export async function PUT(req: NextRequest, { params }: Context) {
  try {
    const id = parseInt(params.id);
    if (isNaN(id)) {
      return NextResponse.json({ error: "Invalid ID" }, { status: 400 });
    }

    const body = await req.json();
    if (!body.full_name?.trim()) {
      return NextResponse.json({ error: "full_name is required" }, { status: 400 });
    }

    const person = await updatePerson(id, {
      full_name: body.full_name.trim().toUpperCase(),
      phone: body.phone?.trim() || undefined,
      email: body.email?.trim() || undefined,
      notes: body.notes?.trim() || undefined,
    });

    if (!person) {
      return NextResponse.json({ error: "Person not found" }, { status: 404 });
    }

    return NextResponse.json(person);
  } catch (err) {
    console.error(`PUT /api/persons/${params.id}:`, err);
    return NextResponse.json({ error: "Failed to update person" }, { status: 500 });
  }
}

export async function DELETE(_req: NextRequest, { params }: Context) {
  try {
    const id = parseInt(params.id);
    if (isNaN(id)) {
      return NextResponse.json({ error: "Invalid ID" }, { status: 400 });
    }

    const deleted = await deletePerson(id);
    if (!deleted) {
      return NextResponse.json({ error: "Person not found" }, { status: 404 });
    }

    return NextResponse.json({ success: true });
  } catch (err) {
    console.error(`DELETE /api/persons/${params.id}:`, err);
    return NextResponse.json({ error: "Failed to delete person" }, { status: 500 });
  }
}
