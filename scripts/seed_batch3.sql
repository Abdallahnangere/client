-- ============================================================
-- Capital Management System — Batch 3 Addendum (PDF receipts)
-- Transactions #36–#54 for SAID ABDULLAHI ABDULMUDALLIB (person_id = 1)
-- Paste into Neon SQL Editor and run AFTER seed_batch2.sql
-- ============================================================
-- NOTE: transaction_date already nullable (applied in batch 2)
-- All transactions are DEBIT — Wada is sender on every receipt
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- ── JUNE 2025 ────────────────────────────────────────────────

-- #36 | Wema/ALAT → OPay | 30 Jun 2025 15:23
(1, 'DEBIT', 70000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-30 15:23:00+01',
 'Wema/ALAT → OPay', '000017250630152353623902453165', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #37 | Wema/ALAT → OPay | 30 Jun 2025 15:26
(1, 'DEBIT', 40000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-30 15:26:00+01',
 'Wema/ALAT → OPay', '000017250630152643981922455404', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #38 | OPay | 11 Jun 2025 14:46 — ₦400K (≠ v4 #01 ₦100K ref ...354069407)
(1, 'DEBIT', 400000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-11 14:46:00+01',
 'OPay', '250611010100199430535288', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151'),

-- #39 | OPay | 22 Jun 2025 22:40:14
(1, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-22 22:40:14+01',
 'OPay', '250622010100400751665016', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151'),

-- #40 | OPay | 27 Jun 2025 22:34:29
(1, 'DEBIT', 50000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-27 22:34:29+01',
 'OPay', '250627010100491863720456', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151'),


-- ── JULY 2025 ────────────────────────────────────────────────

-- #41 | OPay | 10 Jul 2025 14:45:26
(1, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-10 14:45:26+01',
 'OPay', '250710010100730045206255', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151'),

-- #42 | Wema/ALAT → OPay | 14 Jul 2025 14:25
(1, 'DEBIT', 620000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-14 14:25:00+01',
 'Wema/ALAT → OPay', '000017250714142522802149408922', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #43 | Wema/ALAT → OPay | 30 Jul 2025 21:13
(1, 'DEBIT', 3179000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-30 21:13:00+01',
 'Wema/ALAT → OPay', '00001725073021133422458582988240', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),


-- ── AUGUST 2025 ──────────────────────────────────────────────

-- #44 | Wema/ALAT → OPay | 08 Aug 2025 18:10
(1, 'DEBIT', 960000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-08-08 18:10:00+01',
 'Wema/ALAT → OPay', '0000172508081810580783886395', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #45 | Wema/ALAT → OPay | 14 Aug 2025 10:33
(1, 'DEBIT', 1000000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-08-14 10:33:00+01',
 'Wema/ALAT → OPay', '000017250814103305801516498212', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #46 | Wema/ALAT → OPay | 14 Aug 2025 18:43
(1, 'DEBIT', 1071000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-08-14 18:43:00+01',
 'Wema/ALAT → OPay', '000017250814184352728846769643', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #47 | Wema/ALAT IntraBank | 19 Aug 2025 19:34 — ₦4,740,012 (≠ v4 #11 ₦1,120,000 ref 331036594237)
(1, 'DEBIT', 4740012.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI',
 '2025-08-19 19:34:00+01',
 'Wema/ALAT IntraBank', '338645531011', 'SUCCESSFUL',
 'ALAT Transfer → Said WEMA/ALAT acc 0250622946'),

-- #48 | OPay → FCMB | 22 Aug 2025 17:17:22
(1, 'DEBIT', 997500.00,
 'MAHMOUD IBRAHIM WADA', 'ABDULLAHI SAID ABDULMUDALLIB',
 '2025-08-22 17:17:22+01',
 'OPay → FCMB', '250822020100612306263623', 'SUCCESSFUL',
 'OPay 906****308 → Said FCMB acc 8072896010 (channel)'),

-- #49 | OPay → FCMB | 22 Aug 2025 17:22:13
(1, 'DEBIT', 605000.00,
 'MAHMOUD IBRAHIM WADA', 'ABDULLAHI SAID ABDULMUDALLIB',
 '2025-08-22 17:22:13+01',
 'OPay → FCMB', '250822020100612123256353', 'SUCCESSFUL',
 'OPay 906****308 → Said FCMB acc 8072896010 (channel)'),


-- ── SEPTEMBER 2025 ───────────────────────────────────────────

-- #50 | Wema/ALAT → Fidelity | 02 Sep 2025
(1, 'DEBIT', 4080000.00,
 'MAHMOUD WADA', 'SAID ABDULMUDALLIB ABDULLAHI',
 '2025-09-02 00:00:00+01',
 'Wema/ALAT → Fidelity', '000017250902085937241868635339', 'SUCCESSFUL',
 'ALAT NIP → Said Fidelity acc 6328260172'),

-- #51 | Wema/ALAT IntraBank | 05 Sep 2025 14:07
(1, 'DEBIT', 5000000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI',
 '2025-09-05 14:07:00+01',
 'Wema/ALAT IntraBank', '335906916513', 'SUCCESSFUL',
 'ALAT Transfer → Said WEMA/ALAT acc 0250622946'),

-- #52 | OPay | 17 Sep 2025 15:31:34
(1, 'DEBIT', 300000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-09-17 15:31:34+01',
 'OPay', '250917010100176303991962', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151'),


-- ── OCTOBER 2025 ─────────────────────────────────────────────

-- #53 | OPay | 03 Oct 2025 20:17:34
(1, 'DEBIT', 851063.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-10-03 20:17:34+01',
 'OPay', '251003010100548135312779', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151'),

-- #54 | OPay | 14 Oct 2025 15:13:17
(1, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-10-14 15:13:17+01',
 'OPay', '251014010100794153477247', 'SUCCESSFUL',
 'OPay 906****308 → Said OPay acc 8130790151');


-- ============================================================
-- VERIFY after all 3 batches applied (54 transactions total)
-- ============================================================

-- Row count (should be 54):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 1;

-- Balance summary:
-- SELECT * FROM person_balance_summary WHERE person_id = 1;

-- Full chronological ledger:
-- SELECT
--     ROW_NUMBER() OVER (ORDER BY transaction_date NULLS LAST, id) AS "#",
--     TO_CHAR(transaction_date AT TIME ZONE 'Africa/Lagos', 'DD Mon YYYY HH24:MI') AS date,
--     type,
--     TO_CHAR(amount, 'FM₦999,999,999.00') AS amount,
--     bank,
--     reference_number,
--     note
-- FROM transactions
-- WHERE person_id = 1
-- ORDER BY transaction_date NULLS LAST, id;
