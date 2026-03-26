-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for SADIQ MUHAMMAD KABIR (person_id = 5)
-- Transactions #1 -- #19  |  May 2025 -- Oct 2025
-- All CREDIT
-- Sources: OPay, ALAT by Wema Bank
-- Recipient: MAHMOUD IBRAHIM WADA (OPay and TAJ Bank)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(5, 'Sadiq Muhammad Kabir', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | May 3, 2025 11:55 | NGN 1,000,000
(5, 'CREDIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-05-03 11:55:35+01',
 'OPay', '250503010100505858074277', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #2 | May 31, 2025 09:51 | NGN 1,900,000
(5, 'CREDIT', 1900000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-05-31 09:51:43+01',
 'OPay', '250531010100994215860387', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #3 | May 31, 2025 17:24 | NGN 80,000
(5, 'CREDIT', 80000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-05-31 17:24:53+01',
 'OPay', '250531010100002355790447', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #4 | Jun 13, 2025 20:50 | NGN 4,000,000
(5, 'CREDIT', 4000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-06-13 20:50:28+01',
 'OPay', '250613010100241673530543', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #5 | Jun 26, 2025 00:08 | NGN 1,000,000
(5, 'CREDIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-06-26 00:08:26+01',
 'OPay', '250626010100456307747605', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #6 | Jul 9, 2025 19:20 | NGN 400,000
(5, 'CREDIT', 400000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-09 19:20:32+01',
 'OPay', '250709010100715479754444', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #7 | Jul 9, 2025 21:40 | NGN 1,000,000
(5, 'CREDIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-09 21:40:23+01',
 'OPay', '250709010100718556317249', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #8 | Jul 27, 2025 20:37 | NGN 1,300,000
(5, 'CREDIT', 1300000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-27 20:37:22+01',
 'OPay', '250727010100076036732837', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #9 | Aug 3, 2025 16:43 | NGN 100,000
(5, 'CREDIT', 100000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 16:43:54+01',
 'OPay', '250803010100218081311245', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #10 | Aug 4, 2025 10:19 | NGN 1,000,000
(5, 'CREDIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-04 10:19:13+01',
 'OPay', '250804010100229963779846', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #11 | Aug 18, 2025 06:44 | NGN 100,000
(5, 'CREDIT', 100000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-18 06:44:55+01',
 'OPay', '250818010100516612385312', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #12 | Aug 18, 2025 10:38 | NGN 3,000,000
(5, 'CREDIT', 3000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-18 10:38:42+01',
 'OPay', '250818020100520271600425', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - TAJBank (0012036999)'),

-- #13 | Aug 26, 2025 11:28 | NGN 2,500,000
(5, 'CREDIT', 2500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-26 11:28:10+01',
 'OPay', '250826020100687911645531', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - TAJBank (0012036999)'),

-- #14 | Sep 2, 2025 12:38 | NGN 800,000
(5, 'CREDIT', 800000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-02 12:38:13+01',
 'OPay', '250902010100841043219665', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #15 | Sep 27, 2025 11:54 | NGN 4,500,000
(5, 'CREDIT', 4500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-27 11:54:59+01',
 'OPay', '250927010100396614375837', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #16 | Sep 30, 2025 08:07 | NGN 205,000
(5, 'CREDIT', 205000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-30 08:07:46+01',
 'OPay', '250930010100457527350321', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #17 | Oct 1, 2025 12:43 | NGN 1,500,000
(5, 'CREDIT', 1500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-01 12:43:02+01',
 'OPay', '251001010100487160685584', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #18 | Oct 1, 2025 20:39 | NGN 500,000
(5, 'CREDIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-01 20:39:56+01',
 'OPay', '251001010100499459527997', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada - OPay (906 657 5308)'),

-- #19 | Oct 4, 2025 12:00 | NGN 2,500,000
(5, 'CREDIT', 2500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-04 12:00:00+01',
 'ALAT by Wema Bank', '338977239173', 'SUCCESSFUL',
 'ALAT transfer to Mahmoud Ibrahim Wada - Ref: 338977239173');

-- ============================================================
-- VERIFY:
-- Batch 1 row count should be 19
-- Batch 1 total amount should be 27,385,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 5
--   AND type = 'CREDIT';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 5;
-- ============================================================
