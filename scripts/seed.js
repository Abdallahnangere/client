// scripts/seed.js
// Run: node scripts/seed.js
// Make sure DATABASE_URL is set in .env.local

require("dotenv").config({ path: ".env.local" });
const { neon } = require("@neondatabase/serverless");

const sql = neon(process.env.DATABASE_URL);

async function seed() {
  console.log("🌱 Starting seed...\n");

  // Create tables
  await sql`
    CREATE TABLE IF NOT EXISTS persons (
      id          SERIAL PRIMARY KEY,
      full_name   VARCHAR(150)    NOT NULL,
      phone       VARCHAR(30),
      email       VARCHAR(150),
      notes       TEXT,
      created_at  TIMESTAMPTZ     DEFAULT NOW()
    )
  `;
  console.log("✅ persons table ready");

  await sql`
    CREATE TABLE IF NOT EXISTS transactions (
      id                  SERIAL PRIMARY KEY,
      person_id           INTEGER         NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
      type                VARCHAR(10)     NOT NULL CHECK (type IN ('CREDIT', 'DEBIT')),
      amount              NUMERIC(15, 2)  NOT NULL,
      sender              VARCHAR(150)    NOT NULL,
      receiver            VARCHAR(150)    NOT NULL,
      transaction_date    TIMESTAMPTZ,
      bank                VARCHAR(100),
      reference_number    VARCHAR(120),
      status              VARCHAR(20)     DEFAULT 'SUCCESSFUL',
      note                TEXT,
      created_at          TIMESTAMPTZ     DEFAULT NOW()
    )
  `;
  console.log("✅ transactions table ready");

  // Seed person (upsert by id)
  await sql`
    INSERT INTO persons (id, full_name, notes) VALUES
    (1, 'SAID ABDULLAHI ABDULMUDALLIB',
     'OPay: 8130790151 | Fidelity: 6328260172 | FCMB: 8072896010 | WEMA/ALAT: 0250622946')
    ON CONFLICT (id) DO UPDATE
    SET full_name = EXCLUDED.full_name, notes = EXCLUDED.notes
  `;
  console.log("✅ Seeded: Said Abdullahi Abdulmudallib");

  // Seed transactions (only if table is empty)
  const existing = await sql`SELECT COUNT(*) as c FROM transactions WHERE person_id = 1`;
  if (parseInt(existing[0].c) > 0) {
    console.log("⏭️  Transactions already exist, skipping...");
  } else {
    await sql`
      INSERT INTO transactions
        (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
      VALUES
      (1, 'DEBIT', 100000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-06-11 14:48:01+01', 'OPay', '250611010100199354069407', 'SUCCESSFUL', 'OPay transfer to Said OPay acc 8130790151'),
      (1, 'DEBIT', 5740000.00, 'MAHMOUD IBRAHIM WADA', 'ABDULLAHI ALIYU ABDULMUDALLABI', '2025-07-14 17:10:00+01', 'TAJBank → GTBank', '0011898041407202517​0929', 'SUCCESSFUL', 'Paid via Abdullahi Aliyu GTBank acc 0120912721 — channel for Said'),
      (1, 'DEBIT', 310000.00, 'MAHMOUD IBRAHIM WADA', 'ABDULLAHI ALIYU ABDULMUDALLABI', '2025-07-14 17:11:00+01', 'TAJBank → GTBank', '0011898041407202517​1058', 'SUCCESSFUL', 'Paid via Abdullahi Aliyu GTBank acc 0120912721 — channel for Said'),
      (1, 'DEBIT', 90000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-07-14 17:20:00+01', 'TAJBank → OPay', '0011898041407202517​2006', 'SUCCESSFUL', 'Direct to Said OPay acc 8130790151'),
      (1, 'DEBIT', 960000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-08-01 16:23:00+01', 'TAJBank → Paycom', 'STAJJNG25080160385352', 'SUCCESSFUL', 'Wada TAJBank 001****999 → Said Paycom acc 8130790151'),
      (1, 'DEBIT', 3679300.00, 'MAHMOUD IBRAHIM WADA', 'ABDULLAHI SAID ABDULMUDALLIB', '2025-08-05 09:19:00+01', 'TAJBank → FCMB', '0011898040508202591842', 'SUCCESSFUL', 'Paid to Said FCMB acc 8072896010'),
      (1, 'DEBIT', 495000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-08-11 12:36:00+01', 'TAJBank → OPay', '0011898041108202512​3534', 'SUCCESSFUL', 'Direct to Said OPay acc 8130790151'),
      (1, 'DEBIT', 2000000.00, 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-08-11 19:41:00+01', 'Kuda → OPay', '090267250811184106438008670535', 'SUCCESSFUL', 'Kuda acc 2008670535 → Said OPay acc 8130790151'),
      (1, 'DEBIT', 505000.00, 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-08-11 19:41:00+01', 'Kuda → OPay', '090267250811184125106008670535', 'SUCCESSFUL', 'Kuda acc 2008670535 → Said OPay acc 8130790151'),
      (1, 'DEBIT', 3000000.00, 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-08-13 22:15:00+01', 'Ecobank → OPay', '000010250813221457111118900160', 'SUCCESSFUL', 'Ecobank source → Said OPay acc 8130790151. Narration: Saidu'),
      (1, 'DEBIT', 1120000.00, 'MAHMOUD WADA', 'SAID ABDULLAHI', '2025-08-19 14:24:00+01', 'Wema/ALAT → Wema/ALAT', '331036594237', 'SUCCESSFUL', 'ALAT → Said WEMA/ALAT acc 0250622946'),
      (1, 'DEBIT', 4064000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-08-25 17:31:00+01', 'TAJBank → OPay', '0011898042508202517​3057', 'SUCCESSFUL', 'Direct to Said OPay acc 8130790151'),
      (1, 'DEBIT', 2000000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULMUDALLIB ABDULLAHI', '2025-08-25 18:01:00+01', 'TAJBank → Fidelity', '0011898042508202518​0007', 'SUCCESSFUL', 'Direct to Said Fidelity acc 6328260172'),
      (1, 'DEBIT', 1680000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULMUDALLIB ABDULLAHI', '2025-08-26 09:58:00+01', 'TAJBank → Fidelity', '0011898042608202595​744', 'SUCCESSFUL', 'Direct to Said Fidelity acc 6328260172'),
      (1, 'CREDIT', 3400000.00, 'PLUSTWO ENTERPRISE', 'MAHMOUD IBRAHIM WADA', '2025-08-29 00:00:00+01', 'FirstBank → TAJBank', 'ONB25082901153806683', 'SUCCESSFUL', 'Said deposited via Plustwo Enterprise — Wada is beneficiary/receiver'),
      (1, 'DEBIT', 345000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB', '2025-09-10 14:02:00+01', 'TAJBank → OPay', '0011898041009202514​0151', 'SUCCESSFUL', 'Direct to Said OPay acc 8130790151'),
      (1, 'DEBIT', 500000.00, 'MAHMOUD IBRAHIM WADA', 'SAID ABDULMUDALLIB ABDULLAHI', '2025-09-10 17:06:55+01', 'OPay → Fidelity', '250910020100024920813856', 'SUCCESSFUL', 'OPay 906****308 → Said Fidelity acc 6328260172'),
      (1, 'DEBIT', 3000000.00, 'MAHMOUD IBRAHIM WADA', 'VATTAN CLOTHING', '2025-09-10 20:01:00+01', 'TAJBank → Wema', '0011898041009202520​0100', 'SUCCESSFUL', 'Paid via Vattan Clothing Wema acc 0126922943 — channel for Said'),
      (1, 'DEBIT', 4900000.00, 'MAHMOUD WADA', 'SAID ABDULMUDALIB ABDULLAHI', '2025-09-10 06:48:00+01', 'Wema/ALAT → Fidelity', '000017250910064827992711723103', 'SUCCESSFUL', 'ALAT → Said Fidelity acc 6328260172'),
      (1, 'DEBIT', 1550000.00, 'MAHMOUD WADA', 'SAID ABDULMUDALIB ABDULLAHI', '2025-09-10 06:49:00+01', 'Wema/ALAT → Fidelity', '000017250910064953376041723371', 'SUCCESSFUL', 'ALAT → Said Fidelity acc 6328260172')
    `;
    console.log("✅ Seeded 20 transactions for Said");
  }

  // Create view
  await sql`
    CREATE OR REPLACE VIEW person_balance_summary AS
    WITH totals AS (
      SELECT
        person_id,
        SUM(CASE WHEN type = 'CREDIT' THEN amount ELSE 0 END) AS total_inflow,
        SUM(CASE WHEN type = 'DEBIT'  THEN amount ELSE 0 END) AS total_outflow
      FROM transactions
      GROUP BY person_id
    )
    SELECT
      p.id AS person_id,
      p.full_name,
      t.total_inflow,
      t.total_outflow,
      (t.total_inflow - t.total_outflow) AS net_balance,
      GREATEST((t.total_inflow - t.total_outflow), 0) AS surplus,
      GREATEST((t.total_outflow - t.total_inflow), 0) AS deficit,
      CASE
        WHEN t.total_inflow = 0 THEN NULL
        ELSE ROUND(((t.total_inflow - t.total_outflow) / t.total_inflow) * 100, 2)
      END AS margin_percent,
      (SELECT COUNT(*) FROM transactions tx WHERE tx.person_id = p.id) AS transaction_count,
      (SELECT COUNT(*) FROM transactions tx WHERE tx.person_id = p.id AND tx.type = 'CREDIT') AS credit_count,
      (SELECT COUNT(*) FROM transactions tx WHERE tx.person_id = p.id AND tx.type = 'DEBIT') AS debit_count
    FROM persons p
    JOIN totals t ON t.person_id = p.id
  `;
  console.log("✅ View person_balance_summary ready");

  console.log("\n🎉 Seed complete!");
  process.exit(0);
}

seed().catch((err) => {
  console.error("❌ Seed failed:", err);
  process.exit(1);
});
