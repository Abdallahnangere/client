-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for USMAN UMAR DANCHANJI (person_id = 10)
-- Transactions #1 -- #7  |  Oct 2025 -- Nov 2025
-- All CREDIT transactions (incoming payments received by Mahmoud Ibrahim Wada)
-- Platform: OPay
-- Sender: USMAN ABUBAKAR UMAR (OPay | 708****119)
-- Receivers: MAHMOUD IBRAHIM WADA / WADA MAHMOUD IBRAHIM / MAHMOUD WADA
-- Recipient Accounts:
--   OPay | 906 657 5308 (Images 1--5)
--   Providus Bank Plc | 6508297483 (Image 6)
--   Wema Bank PLC | 0252971026 (Image 7)
-- Date range: Oct 7, 2025 -- Nov 28, 2025
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(10, 'Usman Umar Danchanji', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Oct 7, 2025 11:56:41 | NGN 1,500,000.00
-- Source: Image 3 OPay receipt
(10, 'CREDIT', 1500000.00,
 'USMAN ABUBAKAR UMAR',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-07 11:56:41+01',
 'OPay', '251007010100630014284287', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 906 657 5308'),

-- #2 | Oct 16, 2025 17:38:19 | NGN 444,000.00
-- Source: Image 1 OPay receipt
(10, 'CREDIT', 444000.00,
 'USMAN ABUBAKAR UMAR',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-16 17:38:19+01',
 'OPay', '251016010100843097089635', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 906 657 5308'),

-- #3 | Oct 24, 2025 16:58:57 | NGN 1,050,800.00
-- Source: Image 2 OPay receipt
(10, 'CREDIT', 1050800.00,
 'USMAN ABUBAKAR UMAR',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-24 16:58:57+01',
 'OPay', '251024010100029443018797', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 906 657 5308'),

-- #4 | Nov 11, 2025 15:13:58 | NGN 1,000,000.00
-- Source: Image 5 OPay receipt
(10, 'CREDIT', 1000000.00,
 'USMAN ABUBAKAR UMAR',
 'MAHMOUD IBRAHIM WADA',
 '2025-11-11 15:13:58+01',
 'OPay', '251111010100477935862736', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 906 657 5308'),

-- #5 | Nov 16, 2025 15:56:13 | NGN 3,500,000.00
-- Source: Image 4 OPay receipt
(10, 'CREDIT', 3500000.00,
 'USMAN ABUBAKAR UMAR',
 'MAHMOUD IBRAHIM WADA',
 '2025-11-16 15:56:13+01',
 'OPay', '251116010100606835530267', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 906 657 5308'),

-- #6 | Nov 22, 2025 17:56:59 | NGN 4,500,000.00
-- Source: Image 6 OPay receipt
-- NOTE: Recipient name here is "WADA MAHMOUD IBRAHIM" at Providus Bank
--       (different account from OPay used in images 1--5)
(10, 'CREDIT', 4500000.00,
 'USMAN ABUBAKAR UMAR',
 'WADA MAHMOUD IBRAHIM',
 '2025-11-22 17:56:59+01',
 'OPay', '251122020100765316423751', 'SUCCESSFUL',
 'Transfer to Bank Account - Providus Bank Plc | 6508297483 - Session ID: 100004251122165703145894967972'),

-- #7 | Nov 28, 2025 19:06:41 | NGN 4,000,000.00
-- Source: Image 7 OPay receipt
-- NOTE: Recipient name here is "MAHMOUD WADA" at Wema Bank PLC
--       (different account from OPay and Providus used above)
(10, 'CREDIT', 4000000.00,
 'USMAN ABUBAKAR UMAR',
 'MAHMOUD WADA',
 '2025-11-28 19:06:41+01',
 'OPay', '251128020100926669326894', 'SUCCESSFUL',
 'Transfer to Bank Account - Wema Bank PLC | 0252971026 - Session ID: 100004251128180646146352144242');

-- ============================================================
-- VERIFY:
-- Batch row count should be 7
-- Batch total should be 15,994,800.00
--   1,500,000 + 444,000 + 1,050,800 + 1,000,000 +
--   3,500,000 + 4,500,000 + 4,000,000 = 15,994,800.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 10
--   AND type = 'CREDIT'
--   AND transaction_date BETWEEN '2025-10-07 00:00:00+01' AND '2025-11-28 23:59:59+01';
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 10
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- -- Summary for USMAN UMAR DANCHANJI across all transaction types
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
