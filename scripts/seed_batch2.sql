-- ============================================================
-- Capital Management System — Batch 2 Addendum
-- Transactions #21–#35 for SAID ABDULLAHI ABDULMUDALLIB (person_id = 1)
-- Paste into Neon SQL Editor and run
-- ============================================================

-- Allow NULL dates (calculator receipts and some OPay screens have no date)
ALTER TABLE transactions ALTER COLUMN transaction_date DROP NOT NULL;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- ── CALCULATOR AMOUNTS (no bank date available) ──────────────

-- #21 | Calculator img 1 | 16,724.74 × 1,530 = 25,588,850.20
(1, 'DEBIT', 25588850.20,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 NULL, NULL, NULL, 'SUCCESSFUL',
 'Calculator receipt — no bank date; expression: 16,724.7386... × 1,530'),

-- #22 | Calculator img 2 | Result: 1,919,860.63
(1, 'DEBIT', 1919860.63,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 NULL, NULL, NULL, 'SUCCESSFUL',
 'Calculator receipt — no bank date; expression: ...0.62717... - 29,000,000'),

-- #23 | Calculator img 3 | Result: 1,588,850.17
(1, 'DEBIT', 1588850.17,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 NULL, NULL, NULL, 'SUCCESSFUL',
 'Calculator receipt — no bank date; expression: ...0.17421... - 24,000,000'),

-- #24 | Calculator img 4 | Result: 5,151,811.15
(1, 'DEBIT', 5151811.15,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 NULL, NULL, NULL, 'SUCCESSFUL',
 'Calculator receipt — no bank date; expression: ...1.14982... - 79,493,000'),

-- #25 | Calculator img 5 | 55,395 × 93 = 5,151,735
(1, 'DEBIT', 5151735.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 NULL, NULL, NULL, 'SUCCESSFUL',
 'Calculator receipt — no bank date; expression: 55,395 × 93'),


-- ── BANK RECEIPTS ─────────────────────────────────────────────

-- #26 | Wema/ALAT IntraBank | 09 Sep 2025
(1, 'DEBIT', 3000000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI',
 '2025-09-09 00:00:00+01',
 'Wema/ALAT IntraBank', '334460768627', 'SUCCESSFUL',
 'ALAT IntraBank → Said WEMA/ALAT acc 0250622946'),

-- #27 | OPay → Fidelity | 12 Sep 2025 18:56:13
(1, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULMUDALLIB ABDULLAHI',
 '2025-09-12 18:56:13+01',
 'OPay → Fidelity', '250912020100072192126622', 'SUCCESSFUL',
 'OPay 906****308 → Said Fidelity acc 6328260172'),

-- #28 | OPay → Fidelity | 12 Sep 2025 18:57:56
(1, 'DEBIT', 522000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULMUDALLIB ABDULLAHI',
 '2025-09-12 18:57:56+01',
 'OPay → Fidelity', '250912020100072046479524', 'SUCCESSFUL',
 'OPay 906****308 → Said Fidelity acc 6328260172'),

-- #29 | TAJBank → OPay | 16 Sep 2025 17:02
(1, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-09-16 17:02:00+01',
 'TAJBank → OPay', '001189804160920251770147', 'SUCCESSFUL',
 'TAJBank 001****999 → Said OPay acc 8130790151'),

-- #30 | TAJBank → Providus | 19 Sep 2025 21:53
(1, 'DEBIT', 7000000.00,
 'MAHMOUD IBRAHIM WADA', 'ABDULLAHI SAID ABDULMUDALLIB',
 '2025-09-19 21:53:00+01',
 'TAJBank → Providus', '00118980419092025215243', 'SUCCESSFUL',
 'Paid via Said Providus acc 6508297720 — channel for Said'),

-- #31 | OPay Wallet | 23 Sep 2025 18:21:11
(1, 'DEBIT', 250000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-09-23 18:21:11+01',
 'OPay Wallet', '250923010100312968417375', 'SUCCESSFUL',
 'OPay wallet transfer → Said OPay acc 8130790151'),

-- #32 | OPay | 27 Sep 2025 12:12:45
(1, 'DEBIT', 1062020.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-09-27 12:12:45+01',
 'OPay', '250927010100396795920082', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151'),

-- #33 | OPay | Date not visible on receipt
(1, 'DEBIT', 150000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 NULL,
 'OPay', NULL, 'SUCCESSFUL',
 'OPay transfer success screen — no date/reference visible; sender assumed Wada'),

-- #34 | Providus → Fidelity | 15 Oct 2025 18:26:26
(1, 'DEBIT', 5000000.00,
 'WADA MAHMOUD IBRAHIM', 'SAID ABDULMUDALLIB ABDULLAHI',
 '2025-10-15 18:26:26+01',
 'Providus → Fidelity', '000023251015182626004177103990', 'SUCCESSFUL',
 'Providus acc 6508***483 → Said Fidelity acc 6328260172'),

-- #35 | Wema/ALAT → OPay | 27 Oct 2025 20:20
(1, 'DEBIT', 1000000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-10-27 20:20:00+01',
 'Wema/ALAT → OPay', '000017251027202001283836342866', 'SUCCESSFUL',
 'ALAT → Said OPay acc 8130790151');


-- ============================================================
-- VERIFY: run these after inserting
-- ============================================================

-- Total count (should be 35 if Batch 1 already applied):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 1;

-- Updated balance summary:
-- SELECT * FROM person_balance_summary WHERE person_id = 1;

-- Full ledger (dated first, then NULL-date entries):
-- SELECT
--     ROW_NUMBER() OVER (ORDER BY transaction_date NULLS LAST, id) AS "#",
--     TO_CHAR(transaction_date AT TIME ZONE 'Africa/Lagos', 'DD Mon YYYY HH24:MI') AS date,
--     type,
--     TO_CHAR(amount, 'FM₦999,999,999.00') AS amount,
--     bank,
--     note
-- FROM transactions
-- WHERE person_id = 1
-- ORDER BY transaction_date NULLS LAST, id;
