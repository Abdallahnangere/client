-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for USMAN UMAR DANCHANJI (person_id = 10)
-- Transactions #1 -- #10  |  Oct 2025 -- Dec 2025
-- All DEBIT transactions (outgoing payments sent to Usman Abubakar Umar)
-- Platforms: OPay, ALAT by Wema
-- Sender: MAHMOUD IBRAHIM WADA / MAHMOUD WADA
-- Receiver: USMAN ABUBAKAR UMAR
-- Receiver Accounts:
--   OPay | 708 333 1119  (Images 1, 2, 6, 7, 8, 9, 10)
--   ALAT -> Account 7083331119 (Images 3, 4, 5)
-- Date range: Oct 9, 2025 -- Dec 8, 2025
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(10, 'Usman Umar Danchanji', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Oct 9, 2025 14:22:27 | NGN 800,000.00
-- Source: Image 2 OPay receipt
(10, 'DEBIT', 800000.00,
 'MAHMOUD IBRAHIM WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-10-09 14:22:27+01',
 'OPay', '251009010100679987977849', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 708 333 1119'),

-- #2 | Oct 9, 2025 18:06:41 | NGN 720,000.00
-- Source: Image 1 OPay receipt
(10, 'DEBIT', 720000.00,
 'MAHMOUD IBRAHIM WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-10-09 18:06:41+01',
 'OPay', '251009010100685285408637', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 708 333 1119'),

-- #3 | Oct 9, 2025 18:56:10 | NGN 10,000.00
-- Source: Image 6 OPay receipt
(10, 'DEBIT', 10000.00,
 'MAHMOUD IBRAHIM WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-10-09 18:56:10+01',
 'OPay', '251009010100686581225889', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 708 333 1119'),

-- #4 | Nov 12, 2025 18:00 | NGN 1,100,000.00
-- Source: Image 3 ALAT receipt
-- Transaction Date: 12/11/2025 6:00 PM (DD/MM/YYYY -> Nov 12, 2025)
-- Beneficiary Account: 7083331119
(10, 'DEBIT', 1100000.00,
 'MAHMOUD WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-11-12 18:00:00+01',
 'ALAT by Wema', '000017251112180023844825468329', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Usman Abubakar Umar - Account 7083331119'),

-- #5 | Nov 18, 2025 15:11 | NGN 3,850,000.00
-- Source: Image 4 ALAT receipt
-- Transaction Date: 18/11/2025 3:11 PM (DD/MM/YYYY confirmed)
-- Account number not visible in image -- same beneficiary inferred from remark
(10, 'DEBIT', 3850000.00,
 'MAHMOUD WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-11-18 15:11:00+01',
 'ALAT by Wema', '000017251118151138303108236569', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Usman Abubakar Umar FROM MAHMOUD WADA'),

-- #6 | Nov 24, 2025 12:34 | NGN 4,950,000.00
-- Source: Image 5 ALAT receipt
-- Transaction Date: 24/11/2025 12:34 PM (DD/MM/YYYY confirmed)
-- Account number not visible in image -- same beneficiary inferred from remark
(10, 'DEBIT', 4950000.00,
 'MAHMOUD WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-11-24 12:34:00+01',
 'ALAT by Wema', '000017251124123411667322005351', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Usman Abubakar Umar FROM MAHMOUD WADA'),

-- #7 | Nov 24, 2025 14:59:59 | NGN 25,000.00
-- Source: Image 10 OPay receipt
(10, 'DEBIT', 25000.00,
 'MAHMOUD IBRAHIM WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-11-24 14:59:59+01',
 'OPay', '251124010100810282328694', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 708 333 1119'),

-- #8 | Dec 3, 2025 15:38:37 | NGN 400,000.00
-- Source: Image 7 OPay receipt
(10, 'DEBIT', 400000.00,
 'MAHMOUD IBRAHIM WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-12-03 15:38:37+01',
 'OPay', '251203010100061017143237', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 708 333 1119'),

-- #9 | Dec 8, 2025 14:21:11 | NGN 1,000,000.00
-- Source: Image 8 OPay transaction details screen
-- Payment Method: Wallet
(10, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-12-08 14:21:11+01',
 'OPay', '251208010100198350282339', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 708 333 1119 - Payment Method: Wallet'),

-- #10 | Dec 8, 2025 22:01:49 | NGN 1,000,000.00
-- Source: Image 9 OPay receipt
-- NOTE: Same date as #9 but different time (22:01 vs 14:21) and
--       different reference number -- confirmed distinct transfer
(10, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'USMAN ABUBAKAR UMAR',
 '2025-12-08 22:01:49+01',
 'OPay', '251208010100212260626056', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 708 333 1119');

-- ============================================================
-- VERIFY:
-- Batch row count should be 10
-- Batch total should be 13,855,000.00
--   800,000 + 720,000 + 10,000 + 1,100,000 + 3,850,000 +
--   4,950,000 + 25,000 + 400,000 + 1,000,000 + 1,000,000
--   = 13,855,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 10
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-10-09 00:00:00+01' AND '2025-12-08 23:59:59+01';
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 10
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- -- Full summary for USMAN UMAR DANCHANJI across all transaction types
-- SELECT
--   type,
--   COUNT(*) AS transaction_count,
--   COALESCE(SUM(amount), 0) AS total_amount
-- FROM transactions
-- WHERE person_id = 10
-- GROUP BY type
-- ORDER BY type;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 10;
-- ============================================================
