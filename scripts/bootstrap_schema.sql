-- ============================================================
-- Capital Management System
-- Schema Bootstrap
-- Creates base tables and summary view only
-- ============================================================

CREATE TABLE IF NOT EXISTS persons (
  id          SERIAL PRIMARY KEY,
  full_name   VARCHAR(150) NOT NULL,
  phone       VARCHAR(30),
  email       VARCHAR(150),
  notes       TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS transactions (
  id                SERIAL PRIMARY KEY,
  person_id         INTEGER NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  type              VARCHAR(10) NOT NULL CHECK (type IN ('CREDIT', 'DEBIT')),
  amount            NUMERIC(15, 2) NOT NULL,
  sender            VARCHAR(150) NOT NULL,
  receiver          VARCHAR(150) NOT NULL,
  transaction_date  TIMESTAMPTZ,
  bank              VARCHAR(100),
  reference_number  VARCHAR(120),
  status            VARCHAR(20) DEFAULT 'SUCCESSFUL',
  note              TEXT,
  created_at        TIMESTAMPTZ DEFAULT NOW()
);

CREATE OR REPLACE VIEW person_balance_summary AS
WITH totals AS (
  SELECT
    person_id,
    SUM(CASE WHEN type = 'CREDIT' THEN amount ELSE 0 END) AS total_inflow,
    SUM(CASE WHEN type = 'DEBIT' THEN amount ELSE 0 END) AS total_outflow
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
JOIN totals t ON t.person_id = p.id;
