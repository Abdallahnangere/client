-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for IBRAHIM AHMAD BAKO (person_id = 2)
-- Transactions #01 -- #14  |  Jul -- Sep 2025
-- Paste into Neon SQL Editor and run
-- ============================================================

-- Allow NULL dates (some receipts have no visible date)
ALTER TABLE transactions ALTER COLUMN transaction_date DROP NOT NULL;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- ── JULY 2025 ────────────────────────────────────────────────

-- #01 | FCMB | 25 Jul 2025 15:44
(2, 'CREDIT', 6000000.00,
 'MUSA TASIU HARUNA',
 'MAHMOUD WADA',
 '2025-07-25 15:44:00+01',
 'FCMB → Wema/ALAT', NULL, 'SUCCESSFUL',
 'Paid via Musa Tasiu Haruna (FCMB) → Wada Wema/ALAT acc 0252971026. Reference unavailable'),

-- #02 | FirstBank | 25 Jul 2025 19:41:48
(2, 'CREDIT', 4500000.00,
 'UMAR BAKO',
 'MAHMOUD WADA',
 '2025-07-25 19:41:48+01',
 'FirstBank → Wema', '000016250725194157000374409395', 'SUCCESSFUL',
 'Paid via Umar Bako (FirstBank *****98849) → Wada Wema acc 0252971026'),

-- ── AUGUST 2025 ──────────────────────────────────────────────

-- #03 | Access Bank | 01 Aug 2025 12:46:57
(2, 'CREDIT', 10000000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-01 12:46:57+01',
 'Access → JAIZ Bank', 'NXGETZ-09FG250801124641660PFXSL5', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (Access) → Wada JAIZ acc 0020820220'),

-- #04 | FirstBank | 01 Aug 2025 12:51:00
(2, 'CREDIT', 500000.00,
 'AHMAD IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-01 12:51:00+01',
 'FirstBank → JAIZ Bank', '000016250801125101000412188636', 'SUCCESSFUL',
 'Paid via Ahmad Ibrahim (FirstBank *****26466) → Wada JAIZ acc 0020820220'),

-- #05 | Keystone Bank | 02 Aug 2025 21:14
(2, 'CREDIT', 10000000.00,
 'ALAMEEN M BABA GENERAL ENTER',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-02 21:14:00+01',
 'Keystone → JAIZ Bank', NULL, 'SUCCESSFUL',
 'Paid via Alameen M Baba General Enter (Keystone 101****164) → Wada JAIZ acc 0020820220. Reference unavailable -- Keystone receipt cut off'),

-- #06 | Access Bank | 15 Aug 2025 18:18:05
(2, 'CREDIT', 10000000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-15 18:18:05+01',
 'Access → JAIZ Bank', 'NXGETZ-09FG250815181648930EBRZ', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (Access) → Wada JAIZ acc 0020821193'),

-- #07 | Access Bank | 15 Aug 2025 18:19:47
(2, 'CREDIT', 10000000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-15 18:19:47+01',
 'Access → JAIZ Bank', 'NXGETZ-09FG250815181830933LTADCO', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (Access) → Wada JAIZ acc 0020821193'),

-- #08 | FirstBank | 16 Aug 2025 00:17:27
(2, 'CREDIT', 5000000.00,
 'AHMAD IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-16 00:17:27+01',
 'FirstBank → Ecobank', '000016250816001729000492943381', 'SUCCESSFUL',
 'Paid via Ahmad Ibrahim (FirstBank *****26466) → Wada Ecobank acc 0110060083'),

-- #09 | FirstBank | 16 Aug 2025 15:52:05
(2, 'CREDIT', 5000000.00,
 'ABDULRAZAK IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-16 15:52:05+01',
 'FirstBank → Ecobank', '000016250816155215000496160326', 'SUCCESSFUL',
 'Paid via Abdulrazak Ibrahim (FirstBank *****54011) → Wada Ecobank acc 0110060083. Narration: Ahmad bako'),

-- #10 | Access Bank | 29 Aug 2025 21:13:23
(2, 'CREDIT', 20000000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-29 21:13:23+01',
 'Access → Wema Bank', 'NXGO00014250829211317281467115157', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (Access) → Wada received via Wadahs Multipurpose Concept Wema acc 0126939963'),

-- ── SEPTEMBER 2025 ───────────────────────────────────────────

-- #11 | Keystone Bank | 03 Sep 2025 19:03
(2, 'CREDIT', 12000000.00,
 'ALAMEEN M BABA GENERAL ENTER',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-03 19:03:00+01',
 'Keystone → TAJBank', NULL, 'SUCCESSFUL',
 'Paid via Alameen M Baba General Enter (Keystone 101****164) → Wada TAJBank acc 0012036999. Reference unavailable -- Keystone receipt cut off'),

-- #12 | Access Bank | 03 Sep 2025 20:08:22
(2, 'CREDIT', 3000000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD WADA',
 '2025-09-03 20:08:22+01',
 'Access → Wema Bank', 'NXG000014250903200824245055624276', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (Access) → Wada Wema acc 0252971026'),

-- #13 | FCMB | 04 Sep 2025 17:01
(2, 'CREDIT', 10000000.00,
 'MUSA TASIU HARUNA',
 'MAHMOUD WADA',
 '2025-09-04 17:01:00+01',
 'FCMB → Wema/ALAT', NULL, 'SUCCESSFUL',
 'Paid via Musa Tasiu Haruna (FCMB) → Wada Wema/ALAT acc 0252971026. Reference unavailable'),

-- #14 | FCMB | 04 Sep 2025 17:02
(2, 'CREDIT', 3000000.00,
 'MUSA TASIU HARUNA',
 'MAHMOUD WADA',
 '2025-09-04 17:02:00+01',
 'FCMB → Wema/ALAT', NULL, 'SUCCESSFUL',
 'Paid via Musa Tasiu Haruna (FCMB) → Wada Wema/ALAT acc 0252971026. Reference unavailable');


-- ============================================================
-- VERIFY:
-- Total count for Ibrahim (should be 14):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 2;

-- Balance summary:
-- SELECT * FROM person_balance_summary WHERE person_id = 2;

-- Full ledger:
-- SELECT
--     ROW_NUMBER() OVER (ORDER BY transaction_date NULLS LAST, id) AS "#",
--     TO_CHAR(transaction_date AT TIME ZONE 'Africa/Lagos', 'DD Mon YYYY HH24:MI') AS date,
--     type,
--     TO_CHAR(amount, 'FM999,999,999.00') AS amount,
--     bank,
--     note
-- FROM transactions
-- WHERE person_id = 2
-- ORDER BY transaction_date NULLS LAST, id;
-- ============================================================
