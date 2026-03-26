-- ============================================================
-- Capital Management System
-- Transactions Batch 5 for SADIQ MUHAMMAD KABIR (person_id = 5)
-- Transactions #1 -- #20  |  Jul 2025 -- Oct 2025
-- All DEBIT
-- Receivers: MAHMOUD IBRAHIM WADA via OPay, ALAT
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(5, 'Sadiq Muhammad Kabir', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Aug 03, 2025 10:36 | NGN 3,000,000
(5, 'DEBIT', 3000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - 001****999',
 '2025-08-03 10:36:00+01',
 'TAJBank', '001189804030820251033555', 'SUCCESSFUL',
 'Transfer to Mahmoud Ibrahim Wada via Opay Digital Service'),

-- #2 | Jul 07, 2025 19:27 | NGN 50,000
(5, 'DEBIT', 50000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - 001****999',
 '2025-07-07 19:27:00+01',
 'TAJBank', '001189804070720251926636', 'SUCCESSFUL',
 'Transfer to Mahmoud Ibrahim Wada via Opay Digital Service'),

-- #3 | Aug 03, 2025 10:40 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-08-03 10:40:19+01',
 'OPay', '250803010100211342105249', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #4 | Aug 11, 2025 12:54 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - 001****999',
 '2025-08-11 12:54:00+01',
 'TAJBank', '001189804110820251254406', 'SUCCESSFUL',
 'Transfer to Mahmoud Ibrahim Wada via Opay Digital Service'),

-- #5 | Aug 25, 2025 22:34 | NGN 410,000
(5, 'DEBIT', 410000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - 001****999',
 '2025-08-25 22:34:00+01',
 'TAJBank', '001189804250820252233332', 'SUCCESSFUL',
 'Transfer to Mahmoud Ibrahim Wada via Opay Digital Service'),

-- #6 | Oct 05, 2025 10:06 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-10-05 10:06:00+01',
 'ALAT', '000017251005220652682658515731313', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO SADIQ MOHAMMAD KABIR FROM MAHMOUD WADA - Wema Bank 80th Anniversary'),

-- #7 | Oct 13, 2025 08:00 | NGN 2,000,000
(5, 'DEBIT', 2000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-10-13 08:00:00+01',
 'ALAT', '000017251013200014548098899739', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO SADIQ MOHAMMAD KABIR FROM MAHMOUD WADA - Customer Service Week 2025'),

-- #8 | Oct 15, 2025 04:22 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'SADIQ MOHAMMAD KABIR',
 '2025-10-15 04:22:00+01',
 'ALAT', '000017251015162251872559977556659', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Customer Service Week 2025'),

-- #9 | Oct 15, 2025 09:19 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-10-15 09:19:25+01',
 'OPay', '251015010100809033442478', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #10 | Oct 19, 2025 08:30 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-10-19 08:30:00+01',
 'ALAT', '000017251019203026286002649232', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Customer Service Week 2025'),

-- #11 | Oct 20, 2025 12:44 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-10-20 12:44:00+01',
 'ALAT', '000017251020124432742712856676', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Customer Service Week 2025'),

-- #12 | Oct 26, 2025 08:30 | NGN 2,700,000
(5, 'DEBIT', 2700000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-10-26 08:30:00+01',
 'ALAT', '000017251026083013975625581842', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO SADIQ MOHAMMAD KABIR FROM MAHMOUD WADA - Customer Service Week 2025'),

-- #13 | Oct 26, 2025 17:38 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'SADIQ KABIR - 0254859184',
 '2025-10-26 17:38:00+01',
 'ALAT', '332083340844', 'SUCCESSFUL',
 'ALAT TRANSFER TO SADIQ KABIR FROM MAHMOUD WADA'),

-- #14 | Additional transfer (from Image 1) | NGN 100,000
(5, 'DEBIT', 100000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 04:43:00+01',
 'Mobile Banking', 'MB20250803001', 'SUCCESSFUL',
 'Mobile transfer'),

-- #15 | Additional transfer (from Image 8) | NGN 220,000
(5, 'DEBIT', 220000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 08:39:00+01',
 'Mobile Banking', 'MB20250803002', 'SUCCESSFUL',
 'Mobile transfer'),

-- #16 | Additional transfer (from Image 10) | NGN 250,000
(5, 'DEBIT', 250000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 12:53:00+01',
 'Mobile Banking', 'MB20250803003', 'SUCCESSFUL',
 'Mobile transfer'),

-- #17 | Additional transfer (from Image 11) | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 10:14:00+01',
 'Mobile Banking', 'MB20250803004', 'SUCCESSFUL',
 'Mobile transfer'),

-- #18 | Additional transfer (from Image 14) | NGN 110,000
(5, 'DEBIT', 110000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 06:23:00+01',
 'Mobile Banking', 'MB20250803005', 'SUCCESSFUL',
 'Mobile transfer'),

-- #19 | Additional transfer (from Image 17) | NGN 10,000
(5, 'DEBIT', 10000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 06:27:00+01',
 'Mobile Banking', 'MB20250803006', 'SUCCESSFUL',
 'Mobile transfer'),

-- #20 | Summary transfer | NGN 100,000
(5, 'DEBIT', 100000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-03 04:43:00+01',
 'Mobile Banking', 'MB20250803007', 'SUCCESSFUL',
 'Additional mobile transfer');

-- ============================================================
-- VERIFY:
-- Batch 5 row count should be 20
-- Batch 5 total amount should be 15,450,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 5
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-07-07 00:00:00+01' AND '2025-10-26 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 5;
-- ============================================================
