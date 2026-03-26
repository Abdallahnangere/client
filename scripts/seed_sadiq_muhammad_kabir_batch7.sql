-- ============================================================
-- Capital Management System
-- Transactions Batch 7 for SADIQ MUHAMMAD KABIR (person_id = 5)
-- Transactions #1 -- #8  |  Dec 2025
-- All DEBIT
-- Source: OPay
-- Sender on all: MAHMOUD IBRAHIM WADA (OPay | 906****308)
-- Recipient on all: SADIQ MOHAMMAD KABIR (OPay | 911 799 4043)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(5, 'Sadiq Muhammad Kabir', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Dec 2, 2025 17:25:24 | NGN 250,000
(5, 'DEBIT', 250000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 '2025-12-02 17:25:24+01',
 'OPay', '251202010100034350826761', 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir'),

-- #2 | Dec 3, 2025 06:55:13 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 '2025-12-03 06:55:13+01',
 'OPay', '251203010100046778352752', 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir'),

-- #3 | Dec 3, 2025 14:44:51 | NGN 100,000
(5, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 '2025-12-03 14:44:51+01',
 'OPay', '251203010100059516290468', 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir'),

-- #4 | Dec 7, 2025 18:59:50 | NGN 200,000
(5, 'DEBIT', 200000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 '2025-12-07 18:59:50+01',
 'OPay', '2512070101000179188691819', 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir'),

-- #5 | Dec 9, 2025 11:02:36 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 '2025-12-09 11:02:36+01',
 'OPay', '251209010100221199755120', 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir'),

-- #6 | Dec 9, 2025 16:27:07 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 '2025-12-09 16:27:07+01',
 'OPay', '251209010100023012533140', 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir'),

-- #7 | NGN 300,000
-- NOTE: Confirmation screen only - exact timestamp and transaction
-- number not visible in the provided receipt image.
-- Please verify and update transaction_date and reference_number.
(5, 'DEBIT', 300000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 NULL,
 'OPay', NULL,
 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir - receipt details incomplete'),

-- #8 | NGN 500,000
-- NOTE: Confirmation screen only - exact timestamp and transaction
-- number not visible in the provided receipt image.
-- Please verify and update transaction_date and reference_number.
(5, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MOHAMMAD KABIR',
 NULL,
 'OPay', NULL,
 'SUCCESSFUL',
 'OPay transfer to Sadiq Mohammad Kabir - receipt details incomplete');

-- ============================================================
-- VERIFY:
-- Batch 7 row count should be 8
-- Batch 7 total amount should be 3,350,000.00
-- Incomplete rows (NULL transaction_date/reference_number) should be 2
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 5
--   AND type = 'DEBIT'
--   AND (
--     transaction_date BETWEEN '2025-12-02 00:00:00+01' AND '2025-12-09 23:59:59+01'
--     OR transaction_date IS NULL
--   );
--
-- SELECT COUNT(*) AS incomplete_rows
-- FROM transactions
-- WHERE person_id = 5
--   AND type = 'DEBIT'
--   AND transaction_date IS NULL
--   AND reference_number IS NULL;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 5;
-- ============================================================
