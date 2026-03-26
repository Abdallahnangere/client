-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for ABDULAZEEZ IBRAHIM HUDU (person_id = 6)
-- Transactions #1 -- #17  |  Aug 2025 -- Nov 2025
-- All CREDIT
-- Sources: Jaiz Bank (via NIBBS Instant Payment & Local Transfer)
-- Beneficiaries: MAHMOUD IBRAHIM WADA (Taj Bank, Wema Bank, OPay),
--                WADA MAHMOUD IBRAHIM (Providus Bank),
--                NUHU SANI NUHU (First Bank),
--                A. SHARIF FARMS AND AGRO ALLIED SERVICES (outgoing)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(6, 'Abdulazeez Ibrahim Hudu', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Aug 8, 2025 19:42:15 | NGN 1,000,000
(6, 'CREDIT', 1000000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-08 19:42:15+01',
 'Jaiz Bank', 'JF727999757406208', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Ibrahim Wada - Taj Bank'),

-- #2 | Sep 8, 2025 09:32:48 | NGN 1,000,000
(6, 'CREDIT', 1000000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-08 09:32:48+01',
 'Jaiz Bank', 'JF808648740204544', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Ibrahim Wada - OPay Digital Services'),

-- #3 | Sep 26, 2025 16:28:44 | NGN 500,000
(6, 'CREDIT', 500000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-26 16:28:44+01',
 'Jaiz Bank', 'JF436304701214720', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Ibrahim Wada - OPay Digital Services'),

-- #4 | Oct 3, 2025 15:59:00 | NGN 24,786
-- (Jaiz Mobile Plus - Local Transfer, narration: Mohammad ibrahim wada)
(6, 'CREDIT', 24786.00,
 'A. SHARIF FARMS AND AGRO ALLIED SERVICES',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-03 15:59:00+01',
 'Jaiz Bank', 'JF965772846153728', 'SUCCESSFUL',
 'Local Transfer to Mahmoud Ibrahim Wada - Jaiz Bank (narration: Mohammad ibrahim wada)'),

-- #5 | Oct 3, 2025 16:21:00 | NGN 2,453,814
-- (Jaiz Mobile Plus - Local Transfer, narration: Mohammad)
(6, 'CREDIT', 2453814.00,
 'A. SHARIF FARMS AND AGRO ALLIED SERVICES',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-03 16:21:00+01',
 'Jaiz Bank', 'JF971197981257728', 'SUCCESSFUL',
 'Local Transfer to Mahmoud Ibrahim Wada - Jaiz Bank (narration: Mohammad)'),

-- #6 | Oct 10, 2025 21:59:36 | NGN 2,500,000
(6, 'CREDIT', 2500000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-10-10 21:59:36+01',
 'Jaiz Bank', 'JF592997919641600', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank'),

-- #7 | Oct 11, 2025 15:47:46 | NGN 10,000,000
(6, 'CREDIT', 10000000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-10-11 15:47:46+01',
 'Jaiz Bank', 'JF861814289752064', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank (narration: Dollar business transaction)'),

-- #8 | Oct 17, 2025 22:33:31 | NGN 10,000,000
(6, 'CREDIT', 10000000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'WADA MAHMOUD IBRAHIM',
 '2025-10-17 22:33:31+01',
 'Jaiz Bank', 'JF138250614665216', 'SUCCESSFUL',
 'NIBBS Instant Payment to Wada Mahmoud Ibrahim - Providus Bank'),

-- #9 | Oct 18, 2025 00:10:52 | NGN 7,500,000
(6, 'CREDIT', 7500000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'WADA MAHMOUD IBRAHIM',
 '2025-10-18 00:10:52+01',
 'Jaiz Bank', 'JF162750227992576', 'SUCCESSFUL',
 'NIBBS Instant Payment to Wada Mahmoud Ibrahim - Providus Bank'),

-- #10 | Oct 25, 2025 10:37:36 | NGN 550,000
(6, 'CREDIT', 550000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-10-25 10:37:36+01',
 'Jaiz Bank', 'JF857184388378624', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank'),

-- #11 | Oct 25, 2025 13:31:44 | NGN 10,000,000
(6, 'CREDIT', 10000000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-10-25 13:31:44+01',
 'Jaiz Bank', 'JF901008892489728', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank'),

-- #12 | Oct 26, 2025 05:41:36 | NGN 3,000,000
(6, 'CREDIT', 3000000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-10-26 05:41:36+01',
 'Jaiz Bank', 'JF145083214295040', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank'),

-- #13 | Nov 1, 2025 23:40:15 | NGN 3,400,000
(6, 'CREDIT', 3400000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'NUHU SANI NUHU',
 '2025-11-01 23:40:15+01',
 'Jaiz Bank', 'JF590863174881280', 'SUCCESSFUL',
 'NIBBS Instant Payment to Nuhu Sani Nuhu - First Bank'),

-- #14 | Nov 3, 2025 09:17:18 | NGN 2,500,000
(6, 'CREDIT', 2500000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-11-03 09:17:18+01',
 'Jaiz Bank', 'JF098469928751104', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank'),

-- #15 | Nov 3, 2025 12:47:03 | NGN 5,500,000
(6, 'CREDIT', 5500000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-11-03 12:47:03+01',
 'Jaiz Bank', 'JF151255240400896', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank'),

-- #16 | Nov 24, 2025 12:28:49 | NGN 5,000,000
(6, 'CREDIT', 5000000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-11-24 12:28:49+01',
 'Jaiz Bank', 'JF756810637266944', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank'),

-- #17 | Nov 24, 2025 13:03:08 | NGN 700,000
(6, 'CREDIT', 700000.00,
 'ABDULAZEEZ IBRAHIM HUDU',
 'MAHMOUD WADA',
 '2025-11-24 13:03:08+01',
 'Jaiz Bank', 'JF765447766167552', 'SUCCESSFUL',
 'NIBBS Instant Payment to Mahmoud Wada - Wema Bank');

-- ============================================================
-- VERIFY:
-- Batch 1 row count should be 17
-- Batch 1 total amount should be 75,628,600.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 6
--   AND type = 'CREDIT';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 6;
-- ============================================================
