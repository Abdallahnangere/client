-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for IBRAHIM AHMAD BAKO (person_id = 2)
-- Transactions #15 -- #20  |  Sep 2025
-- Paste into Neon SQL Editor and run
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- ── SEPTEMBER 2025 (continued) ───────────────────────────────

-- #15 | Access Bank | 04 Sep 2025 17:04:39
(2, 'CREDIT', 1000000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD WADA',
 '2025-09-04 17:04:39+01',
 'Access → Wema Bank', 'NXG000014250904170434253957224063', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (Access) → Wada Wema acc 0252971026'),

-- #16 | Access Bank | 04 Sep 2025 19:26:04
(2, 'CREDIT', 1000000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD WADA',
 '2025-09-04 19:26:04+01',
 'Access → Wema Bank', 'NXG000014250904192535216159113407', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (Access) → Wada Wema acc 0252971026'),

-- #17 | TAJBank | 04 Sep 2025 19:43
(2, 'CREDIT', 5000000.00,
 'BASHIR BAKO IBRAHIM',
 'MAHMOUD WADA',
 '2025-09-04 19:43:00+01',
 'TAJBank → Wema Bank', '00019273504092025204154', 'SUCCESSFUL',
 'Paid via Bashir Bako Ibrahim (TAJBank 000****913) → Wada Wema acc 0252971026. Narration: BIB. Session ID: 000026250904204041000163823571'),

-- #18 | FCMB | 22 Sep 2025 14:46
(2, 'CREDIT', 10000000.00,
 'MUSA TASIU HARUNA',
 'MAHMOUD WADA',
 '2025-09-22 14:46:00+01',
 'FCMB → Wema/ALAT', NULL, 'SUCCESSFUL',
 'Paid via Musa Tasiu Haruna (FCMB) → Wada Wema/ALAT acc 0252971026. Reference unavailable'),

-- #19 | FirstBank | 28 Sep 2025 21:37:41
(2, 'CREDIT', 4800000.00,
 'AHMAD IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-28 21:37:41+01',
 'FirstBank → TAJBank', '000016250928213742000718338157', 'SUCCESSFUL',
 'Paid via Ahmad Ibrahim (FirstBank *****26466) → Wada TAJBank acc 0012036999'),

-- #20 | FirstBank Branch Slip | Date unclear
(2, 'CREDIT', 5000000.00,
 'UNKNOWN SENDER (FIRSTBANK BRANCH SLIP)',
 'MAHMOUD WADA',
 NULL,
 'FirstBank → Wema Bank', 'A-26941922', 'SUCCESSFUL',
 'Physical FirstBank branch/RTGS slip. Beneficiary: Wada Wema acc 0252971026. Sender name unclear -- receipt image illegible. Needs manual verification.');


-- ============================================================
-- VERIFY:
-- Total count for Ibrahim (should be 20):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 2;

-- Balance summary:
-- SELECT * FROM person_balance_summary WHERE person_id = 2;
-- ============================================================
