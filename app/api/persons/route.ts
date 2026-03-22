import { NextRequest, NextResponse } from "next/server";
import { getPersons, createPerson } from "@/lib/db";

export const dynamic = "force-dynamic";

export async function GET() {
  try {
    const persons = await getPersons();
    return NextResponse.json(persons);
  } catch (err) {
    console.error("GET /api/persons:", err);
    return NextResponse.json({ error: "Failed to fetch persons" }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();

    if (!body.full_name?.trim()) {
      return NextResponse.json({ error: "full_name is required" }, { status: 400 });
    }

    const person = await createPerson({
      full_name: body.full_name.trim().toUpperCase(),
      phone: body.phone?.trim() || undefined,
      email: body.email?.trim() || undefined,
      notes: body.notes?.trim() || undefined,
    });

    return NextResponse.json(person, { status: 201 });
  } catch (err) {
    console.error("POST /api/persons:", err);
    return NextResponse.json({ error: "Failed to create person" }, { status: 500 });
  }
}
