-- ============================================================
-- Capital Management System
-- Transactions Batch 3 for ABDULJALAL MUHAMMAD (person_id = 9)
-- Transactions #26 -- #43  |  Apr 2025 -- Oct 2025
-- All DEBIT transactions (outgoing payments sent)
-- Platforms: OPay, ALAT by Wema, Kuda Microfinance Bank
-- Sender: MAHMOUD IBRAHIM WADA / MAHMOUD WADA
-- Receivers: MUHAMMAD ABDULJALAL, ABDULJALAL MUHAMMAD, ABDULAZIZ HUSSAIN USMAN
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(9, 'Abduljalal Muhammad', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #26 | Apr 11, 2025 15:47:39 | NGN 20,000.00
(9, 'DEBIT', 20000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZIZ HUSSAIN USMAN',
 '2025-04-11 15:47:39+01',
 'OPay', '250411010100146856173240', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 706 049 4951'),

-- #27 | Apr 29, 2025 20:24:00 | NGN 440,000.00
(9, 'DEBIT', 440000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-04-29 20:24:00+01',
 'Kuda Microfinance Bank', '090267250429192454545008670535', 'SUCCESSFUL',
 'Outward Transfer to Sterling Bank - Account 0069657949 - Description: hhhh - Fee: NGN 10.00'),

-- #28 | May 14, 2025 14:20:00 | NGN 2,000,000.00
(9, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-05-14 14:20:00+01',
 'Kuda Microfinance Bank', '090267250514132033415008670535', 'SUCCESSFUL',
 'Outward Transfer to Sterling Bank - Account 0069657949 - Description: hhhh - Fee: NGN 0.00'),

-- #29 | May 14, 2025 14:21:00 | NGN 1,450,000.00
(9, 'DEBIT', 1450000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-05-14 14:21:00+01',
 'Kuda Microfinance Bank', '090267250514132118963008670535', 'SUCCESSFUL',
 'Outward Transfer to Sterling Bank - Account 0069657949 - Description: hhhh - Fee: NGN 0.00'),

-- #30 | May 15, 2025 14:49:00 | NGN 700,000.00
(9, 'DEBIT', 700000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-05-15 14:49:00+01',
 'ALAT by Wema', '000017250515144954204645999929', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sterling Bank - Account 0069657949'),

-- #31 | May 18, 2025 13:13:00 | NGN 675,000.00
(9, 'DEBIT', 675000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-05-18 13:13:00+01',
 'Kuda Microfinance Bank', '090267250518121302501008670535', 'SUCCESSFUL',
 'Outward Transfer to Sterling Bank - Account 0069657949 - Description: hhh - Fee: NGN 0.00'),

-- #32 | Jun 2, 2025 09:15:37 | NGN 80,000.00
(9, 'DEBIT', 80000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-06-02 09:15:37+01',
 'OPay', '250602020100029980757102', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #33 | Jun 14, 2025 15:42:11 | NGN 50,000.00
(9, 'DEBIT', 50000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-06-14 15:42:11+01',
 'OPay', '250614020100252947710463', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #34 | Jun 22, 2025 23:23:50 | NGN 670,000.00
(9, 'DEBIT', 670000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-06-22 23:23:50+01',
 'OPay', '250622020100401231743184', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #35 | Jul 6, 2025 21:54:34 | NGN 200,000.00
(9, 'DEBIT', 200000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-07-06 21:54:34+01',
 'OPay', '250706020100662697324216', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #36 | Aug 4, 2025 12:27:00 | NGN 635,000.00
(9, 'DEBIT', 635000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-08-04 12:27:00+01',
 'ALAT by Wema', '000017250804002732054801437048', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sterling Bank - Account 0069657949'),

-- #37 | Aug 7, 2025 12:07:05 | NGN 545,000.00
(9, 'DEBIT', 545000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-08-07 12:07:05+01',
 'OPay', '250807020100295372226871', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #38 | Aug 13, 2025 14:49:00 | NGN 177,000.00
(9, 'DEBIT', 177000.00,
 'MAHMOUD WADA',
 'ABDULJALAL MUHAMMAD',
 '2025-08-13 14:49:00+01',
 'ALAT by Wema', '000017250813144959686856147058', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Opay Digital - Account 9020841748'),

-- #39 | Aug 23, 2025 11:39:21 | NGN 20,000.00
(9, 'DEBIT', 20000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-08-23 11:39:21+01',
 'OPay', '250823020100626819274624', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #40 | Sep 1, 2025 12:30:49 | NGN 65,000.00
(9, 'DEBIT', 65000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-09-01 12:30:49+01',
 'OPay', '250901020100818493262453', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #41 | Sep 14, 2025 23:41:00 | NGN 355,000.00
(9, 'DEBIT', 355000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-09-14 23:41:00+01',
 'Kuda Microfinance Bank', '090267250914224151597008670535', 'SUCCESSFUL',
 'Outward Transfer to Sterling Bank - Account 0069657949 - Description: bhhh - Fee: NGN 0.00'),

-- #42 | Oct 3, 2025 13:24:01 | NGN 500,000.00
(9, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-10-03 13:24:01+01',
 'OPay', '251003020100537221573001', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #43 | Oct 4, 2025 08:37:36 | NGN 70,000.00
(9, 'DEBIT', 70000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-10-04 08:37:36+01',
 'OPay', '251004020100556011162903', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949');

-- ============================================================
-- VERIFY:
-- Batch 3 row count should be 18
-- Batch 3 total amount should be 8,652,000.00
-- Duplicate check: no duplicate reference_number found in this batch
-- NOTE: source summary stated 7,574,000.00; recomputed from row amounts = 8,652,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-04-11 00:00:00+01' AND '2025-10-04 23:59:59+01';
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'DEBIT'
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- -- Summary for ABDULJALAL MUHAMMAD across all transaction types
-- SELECT
--   type,
--   COUNT(*) AS transaction_count,
--   COALESCE(SUM(amount), 0) AS total_amount
-- FROM transactions
-- WHERE person_id = 9
-- GROUP BY type
-- ORDER BY type;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 9;
-- ============================================================
