-- ============================================================
-- Capital Management System — Batch 4 Addendum
-- Transactions #55–#70 for SAID ABDULLAHI ABDULMUDALLIB (person_id = 1)
-- Sources: Kuda (acc 2008670535) + Wema/ALAT
-- Paste into Neon SQL Editor and run AFTER seed_batch3.sql
-- ============================================================
-- All DEBIT — Mahmoud Wada is sender on every receipt
-- transaction_date already nullable (applied in batch 2)
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- ── MAY 2025 ─────────────────────────────────────────────────

-- #55 | Kuda → OPay | 20 May 2025 13:22
(1, 'DEBIT', 200000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-05-20 13:22:00+01',
 'Kuda → OPay', '090267250520122232728008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),


-- ── JUNE 2025 ────────────────────────────────────────────────

-- #56 | Kuda → OPay | 03 Jun 2025 16:21
(1, 'DEBIT', 400000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-03 16:21:00+01',
 'Kuda → OPay', '090267250603152138658008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #57 | Kuda → OPay | 18 Jun 2025 16:26
(1, 'DEBIT', 320000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-18 16:26:00+01',
 'Kuda → OPay', '090267250618152609230008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #58 | Kuda → OPay | 18 Jun 2025 16:30
(1, 'DEBIT', 175000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-18 16:30:00+01',
 'Kuda → OPay', '090267250618153053223008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #59 | Kuda → OPay | 27 Jun 2025 15:45 (₦640,000)
(1, 'DEBIT', 640000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-27 15:45:00+01',
 'Kuda → OPay', '090267250627144521163008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #60 | Kuda → OPay | 27 Jun 2025 15:45 (₦50,000) — separate transfer same minute
(1, 'DEBIT', 50000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-06-27 15:45:00+01',
 'Kuda → OPay', '090267250627144545664008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),


-- ── JULY 2025 ────────────────────────────────────────────────

-- #61 | Kuda → OPay | 04 Jul 2025 14:57 (₦1,280,000)
(1, 'DEBIT', 1280000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-04 14:57:00+01',
 'Kuda → OPay', '090267250704135729429008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #62 | Kuda → OPay | 04 Jul 2025 15:12 (₦50,000)
(1, 'DEBIT', 50000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-04 15:12:00+01',
 'Kuda → OPay', '090267250704141237306008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #63 | Kuda → OPay | 04 Jul 2025 15:14 (₦50,000)
(1, 'DEBIT', 50000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-04 15:14:00+01',
 'Kuda → OPay', '090267250704141451739008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #64 | Kuda → OPay | 08 Jul 2025 14:21
(1, 'DEBIT', 362200.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-08 14:21:00+01',
 'Kuda → OPay', '090267250708132144282008670535', 'SUCCESSFUL',
 'Kuda acc 2008670535 → Said OPay acc 8130790151'),

-- #65 | Wema/ALAT → OPay | 29 Jul 2025 08:35
(1, 'DEBIT', 3520000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-07-29 08:35:00+01',
 'Wema/ALAT → OPay', '000017250729083536479157277830', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),


-- ── AUGUST 2025 ──────────────────────────────────────────────

-- #66 | Wema/ALAT → OPay | 04 Aug 2025 15:43
(1, 'DEBIT', 3520000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-08-04 15:43:00+01',
 'Wema/ALAT → OPay', '000017250804154310921211708224', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #67 | Wema/ALAT → OPay | 09 Aug 2025 19:17
(1, 'DEBIT', 3500000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-08-09 19:17:00+01',
 'Wema/ALAT → OPay', '000017250809191720793744416405', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),

-- #68 | Wema/ALAT → OPay | 19 Aug 2025 11:44
-- Third separate transfer on 19 Aug (≠ v4 #11 at 14:24, ≠ Batch3 #47 at 19:34)
(1, 'DEBIT', 3520000.00,
 'MAHMOUD WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-08-19 11:44:00+01',
 'Wema/ALAT → OPay', '000017250819114447370718845658', 'SUCCESSFUL',
 'ALAT NIP → Said OPay acc 8130790151'),


-- ── SEPTEMBER 2025 ───────────────────────────────────────────

-- #69 | Wema/ALAT → Fidelity | 05 Sep 2025 05:51
-- Separate from Batch3 #51 (₦5,000,000 WEMA IntraBank at 14:07 same day)
(1, 'DEBIT', 2000000.00,
 'MAHMOUD WADA', 'SAID ABDULMUDALLIB ABDULLAHI',
 '2025-09-05 05:51:00+01',
 'Wema/ALAT → Fidelity', '000017250905055110676388270306', 'SUCCESSFUL',
 'ALAT NIP → Said Fidelity acc 6328260172'),

-- #70 | Wema/ALAT → Fidelity | 10 Sep 2025 13:38
(1, 'DEBIT', 3680000.00,
 'MAHMOUD WADA', 'SAID ABDULMUDALLIB ABDULLAHI',
 '2025-09-10 13:38:00+01',
 'Wema/ALAT → Fidelity', '000017250910133821336781920075', 'SUCCESSFUL',
 'ALAT NIP → Said Fidelity acc 6328260172');


-- ============================================================
-- VERIFY after all 4 batches (70 transactions total)
-- ============================================================

-- Row count (should be 70):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 1;

-- Balance summary:
-- SELECT * FROM person_balance_summary WHERE person_id = 1;

-- Batch breakdown:
--   Batch 1 (v4)  : #01–#20  | 1 CREDIT  + 19 DEBIT
--   Batch 2       : #21–#35  | 0 CREDITS + 15 DEBIT
--   Batch 3       : #36–#54  | 0 CREDITS + 19 DEBIT
--   Batch 4       : #55–#70  | 0 CREDITS + 16 DEBIT
--   TOTAL         : 70 txns  | 1 CREDIT (₦3.4M) + 69 DEBIT
-- ============================================================
