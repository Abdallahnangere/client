-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for ALMUJTABA MUHAMMAD AYAGI (person_id = 11)
-- Transactions extracted from 7 images
-- CREDIT transactions: money sent FROM Almujtaba TO Mahmoud Wada
-- DEBIT transactions: money sent FROM Mahmoud Wada TO Almujtaba
-- Platforms: Access Bank, TAJBank, ALAT by Wema, OPay
-- Date range: Nov 11, 2025 -- Dec 1, 2025
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(11, 'Almujtaba Muhammad Ayagi', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- ============================================================
-- CREDIT TRANSACTIONS (Almujtaba -> Mahmoud Wada)
-- ============================================================

-- #1 | Nov 11, 2025 16:32 | NGN 5,000,000.00
(11, 'CREDIT', 5000000.00,
 'ALMUJTABA MUHAMMAD AYAGI',
 'MAHMOUD WADA',
 '2025-11-11 16:32:00+01',
 'Access Bank', 'NXG000014251111151632236734552871', 'SUCCESSFUL',
 'MOBILE TRF TO WBP Business MAHMOUD WADA - Account 1691490598'),

-- #2 | Nov 21, 2025 14:32:33 | NGN 3,000,000.00
(11, 'CREDIT', 3000000.00,
 'ALMUJTABA MUHAMMAD AYAGI',
 'MAHMOUD WADA',
 '2025-11-21 14:32:33+01',
 'Access Bank', 'NXG000014251121143225210245997292', 'SUCCESSFUL',
 'INTER-BANK Transfer to Wema Bank - Account 0252971026 - Remark: Business - Session ID: 000014251121143225210245997292'),

-- #3 | Nov 25, 2025 13:15 | NGN 5,700,000.00
(11, 'CREDIT', 5700000.00,
 'AL-MUJTABA MUHAMMAD AYAGI',
 'MAHMOUD WADA',
 '2025-11-25 13:15:00+01',
 'TAJBank', '00000299825112025131516', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026 - Narration: Business - Session ID: 000026251125131318000180228988'),

-- #4 | Dec 1, 2025 12:24 | NGN 8,000,000.00
(11, 'CREDIT', 8000000.00,
 'AL-MUJTABA MUHAMMAD AYAGI',
 'MAHMOUD WADA',
 '2025-12-01 12:24:00+01',
 'TAJBank', '00000299801122025122320', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026 - Session ID: 000026251201122223000181549496'),

-- ============================================================
-- DEBIT TRANSACTIONS (Mahmoud Wada -> Almujtaba)
-- ============================================================

-- #5 | Nov 18, 2025 15:14:52 | NGN 5,500,000.00
(11, 'DEBIT', 5500000.00,
 'MAHMOUD WADA',
 'ALMUJTABA MUHAMMAD AYAGI',
 '2025-11-18 15:14:52+01',
 'ALAT by Wema', NULL, 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO ALMUJTABA MUHAMMAD AYAGI - Account 0252971026 - Bal after: NGN 9,600,301.56'),

-- #6 | Nov 28, 2025 19:32 | NGN 1,800,000.00
(11, 'DEBIT', 1800000.00,
 'MAHMOUD WADA',
 'ALMUJTABA MUHAMMAD AYAGI',
 '2025-11-28 19:32:00+01',
 'ALAT by Wema', '000017251128193159047584671056', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO ALMUJTABA MUHAMMAD AYAGI FROM MAHMOUD WADA'),

-- #7 | date not visible | NGN 250,000.00
(11, 'DEBIT', 250000.00,
 'MAHMOUD IBRAHIM WADA',
 'UNKNOWN RECIPIENT (IMAGE 7)',
 NULL,
 'OPay', NULL, 'SUCCESSFUL',
 'OPay transfer successful - NGN 250,000.00 - recipient and date not visible in receipt');

-- ============================================================
-- VERIFY:
-- Total rows: 7
-- CREDIT total:  21,700,000.00
-- DEBIT total:    7,550,000.00
-- Net (CREDIT - DEBIT): 14,150,000.00
--
-- SELECT
--   type,
--   COUNT(*) AS txn_count,
--   COALESCE(SUM(amount), 0) AS total
-- FROM transactions
-- WHERE person_id = 11
-- GROUP BY type
-- ORDER BY type;
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 11
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 11;
-- ============================================================
