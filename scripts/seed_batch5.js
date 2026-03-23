// scripts/seed_batch5.js
// Transactions #71–#72 for SAID ABDULLAHI ABDULMUDALLIB (person_id = 1)
// Run: node scripts/seed_batch5.js

require("dotenv").config({ path: ".env.local" });
const { neon } = require("@neondatabase/serverless");

const sql = neon(process.env.DATABASE_URL);

async function seed() {
  console.log("Inserting batch 5 transactions (#71–#72)...\n");

  // #71 | Calculator receipt | No date | DEBIT
  await sql`
    INSERT INTO transactions
      (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
    VALUES
      (1, 'DEBIT', 4255753.00,
       'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
       NULL,
       NULL, NULL, 'SUCCESSFUL',
       'Calculator receipt — no bank date; expression: 62,275,752 - 58,019,999')
  `;
  console.log("✅ #71 inserted — Calculator ₦4,255,753 (no date)");

  // #72 | Wema/ALAT → Fidelity | 02 Sep 2025 13:47 | DEBIT
  await sql`
    INSERT INTO transactions
      (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
    VALUES
      (1, 'DEBIT', 4957000.00,
       'WADAHS MULTIPURPOSE CONCEPT', 'SAID ABDULMUDALLIB ABDULLAHI',
       '2025-09-02 13:47:00+01',
       'Wema Bank → Fidelity', 'AFBSSST-e50c2ba4fcb6445ca821eeeff388f635', 'SUCCESSFUL',
       'Wada business acc (WADAHS MULTIPURPOSE CONCEPT, Wema) → Said Fidelity acc 6328260172')
  `;
  console.log("✅ #72 inserted — WADAHS MULTIPURPOSE ₦4,957,000 (02 Sep 2025)");

  const [count] = await sql`SELECT COUNT(*) FROM transactions WHERE person_id = 1`;
  console.log(`\nTotal transactions for person_id=1: ${count.count}`);

  const [summary] = await sql`SELECT * FROM person_balance_summary WHERE person_id = 1`;
  console.log("\nUpdated balance summary:");
  console.log(`  Total Inflow  : ₦${parseFloat(summary.total_inflow).toLocaleString()}`);
  console.log(`  Total Outflow : ₦${parseFloat(summary.total_outflow).toLocaleString()}`);
  console.log(`  Net Balance   : ₦${parseFloat(summary.net_balance).toLocaleString()}`);
  console.log(`  Deficit       : ₦${parseFloat(summary.deficit).toLocaleString()}`);
  console.log(`  Surplus       : ₦${parseFloat(summary.surplus).toLocaleString()}`);
}

seed().catch((err) => {
  console.error("Error:", err.message);
  process.exit(1);
});
