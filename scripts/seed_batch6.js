// scripts/seed_batch6.js
// Transactions #73–#75 for SAID ABDULLAHI ABDULMUDALLIB (person_id = 1)
// Run: node scripts/seed_batch6.js

require("dotenv").config({ path: ".env.local" });
const { neon } = require("@neondatabase/serverless");

const sql = neon(process.env.DATABASE_URL);

async function seed() {
  console.log("Inserting batch 6 transactions (#73–#75)...\n");

  // #73 | Calculator receipt | No date | DEBIT
  await sql`
    INSERT INTO transactions
      (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
    VALUES
      (1, 'DEBIT', 3429500.00,
       'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
       NULL,
       NULL, NULL, 'SUCCESSFUL',
       'Calculator receipt — no bank date; expression: 55,233,000 - 51,803,500')
  `;
  console.log("✅ #73 inserted — Calculator ₦3,429,500 (no date)");

  // #74 | Calculator receipt | No date | DEBIT
  await sql`
    INSERT INTO transactions
      (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
    VALUES
      (1, 'DEBIT', 4016307.27,
       'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
       NULL,
       NULL, NULL, 'SUCCESSFUL',
       'Calculator receipt — no bank date; expression: ...07.26643598615917 - 55,803,500')
  `;
  console.log("✅ #74 inserted — Calculator ₦4,016,307.27 (no date)");

  // #75 | Calculator receipt | No date | DEBIT
  await sql`
    INSERT INTO transactions
      (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
    VALUES
      (1, 'DEBIT', 5321750.17,
       'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
       NULL,
       NULL, NULL, 'SUCCESSFUL',
       'Calculator receipt — no bank date; expression: ...50.174216027874564 - 77,138,500')
  `;
  console.log("✅ #75 inserted — Calculator ₦5,321,750.17 (no date)");

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
