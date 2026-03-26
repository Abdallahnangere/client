-- ============================================================
-- Capital Management System
-- Transactions Batch 6 for YUNUSA MUHAMMAD ISA (person_id = 7)
-- Transactions #37 -- #56  |  Jun 2025 -- Oct 2025
-- All DEBIT transactions (outgoing payments)
-- Banks: Jaiz Mobile Plus, TAJWay, ALAT by Wema, OPay, Providus Bank
-- Sender: MAHMOUD IBRAHIM WADA / MAHMOUD WADA / WADA MAHMOUD IBRAHIM / WADAHS MULTIPURPOSE CONCEPT
-- Recipient: YUNUSA MUHAMMAD ISA / AHMAD SALMANU
-- Accounts: TAJ Bank (0011079520, 0003633491), OPay Digital (8066117570), JAIZ, Access Bank (0097459317)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(7, 'Yunusa Muhammad Isa', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #37 | Jun 20, 2025 17:46:00 | NGN 12,310,000.00
(7, 'DEBIT', 12310000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-06-20 17:46:00+01',
 'TAJWay', '001189804200620251744542', 'SUCCESSFUL',
 'TAJWay transfer to TAJBank - Account 0011079520'),

-- #38 | Jun 21, 2025 09:20:00 | NGN 5,000,000.00
(7, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-06-21 09:20:00+01',
 'TAJWay', '001189804210620205091952', 'SUCCESSFUL',
 'TAJWay transfer to TAJBank - Account 0011079520'),

-- #39 | Jul 2, 2025 07:22:00 | NGN 17,550,000.00
(7, 'DEBIT', 17550000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-07-02 07:22:00+01',
 'TAJWay', '001189804020720250572136', 'SUCCESSFUL',
 'TAJWay transfer to TAJBank - Account 0011079520'),

-- #40 | Aug 1, 2025 17:27:55 | NGN 5,000,000.00
(7, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-01 17:27:55+01',
 'Jaiz Mobile', 'JF157478775742464', 'SUCCESSFUL',
 'NIBBS Instant Payment - Jaiz Mobile to Taj Bank - Account 001*****20'),

-- #41 | Aug 1, 2025 17:31:53 | NGN 1,000,000.00
(7, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-01 17:31:53+01',
 'Jaiz Mobile', 'JF15847436510032', 'SUCCESSFUL',
 'NIBBS Instant Payment - Jaiz Mobile to Taj Bank - Account 001*****20'),

-- #42 | Aug 1, 2025 17:54:35 | NGN 3,000,000.00
(7, 'DEBIT', 3000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-01 17:54:35+01',
 'Jaiz Mobile', 'JF164186499637248', 'SUCCESSFUL',
 'NIBBS Instant Payment - Jaiz Mobile to Taj Bank - Account 001*****20'),

-- #43 | Aug 1, 2025 17:56:30 | NGN 7,000,000.00
(7, 'DEBIT', 7000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-01 17:56:30+01',
 'Jaiz Mobile', 'JF164672061628416', 'SUCCESSFUL',
 'Local Transfer - Jaiz Mobile to JAIZ - Account 001*****93'),

-- #44 | Aug 1, 2025 18:21:07 | NGN 4,000,000.00
(7, 'DEBIT', 4000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-01 18:21:07+01',
 'Jaiz Mobile', 'JF170866000060416', 'SUCCESSFUL',
 'NIBBS Instant Payment - Jaiz Mobile to Taj Bank - Account 001*****20'),

-- #45 | Aug 4, 2025 09:42:00 | NGN 1,629,000.00
(7, 'DEBIT', 1629000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-04 09:42:00+01',
 'TAJWay', '001189804040820525214120', 'SUCCESSFUL',
 'TAJWay transfer to TAJBank - Account 0011079520'),

-- #46 | Aug 13, 2025 02:38:00 | NGN 5,000,000.00
(7, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-13 02:38:00+01',
 'TAJWay', '001189804130820251143806', 'SUCCESSFUL',
 'TAJWay transfer to OPay Digital Service - Account 8066117570'),

-- #47 | Aug 15, 2025 09:47:00 | NGN 1,695,000.00
(7, 'DEBIT', 1695000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-15 09:47:00+01',
 'TAJWay', '001189804150820525214647', 'SUCCESSFUL',
 'TAJWay transfer to TAJBank - Account 0011079520'),

-- #48 | Aug 23, 2025 11:47:00 | NGN 5,000,000.00
(7, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-23 11:47:00+01',
 'TAJWay', '001189804230820525114635', 'SUCCESSFUL',
 'TAJWay transfer to OPay Digital Service - Account 8066117570'),

-- #49 | Aug 26, 2025 20:40:00 | NGN 5,000,000.00
(7, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-26 20:40:00+01',
 'TAJWay', '001189804260820252040002', 'SUCCESSFUL',
 'TAJWay transfer to TAJBank - Account 0011079520'),

-- #50 | Sep 1, 2025 13:35:00 | NGN 12,000,000.00
(7, 'DEBIT', 12000000.00,
 'WADAHS MULTIPURPOSE CONCEPT',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-01 13:35:00+01',
 'Wema Bank', 'AFBSSST-35e6b3e7cdac4c9f9926dfd8441465c1', 'SUCCESSFUL',
 'Transfer to TAJ BANK - Account 0011079520 - Narration: hhhh'),

-- #51 | Sep 6, 2025 16:34:50 | NGN 1,245,000.00
(7, 'DEBIT', 1245000.00,
 'MAHMOUD IBRAHIM WADA',
 'AHMAD SALMANU',
 '2025-09-06 16:34:50+01',
 'OPay', '250906020100937902921071', 'SUCCESSFUL',
 'Transfer to Access Bank - Account 0097459317'),

-- #52 | Sep 9, 2025 13:42:00 | NGN 10,000,000.00
(7, 'DEBIT', 10000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-09 13:42:00+01',
 'ALAT by Wema', '000017250910134242845941922489', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Taj Bank - Account 0003633491'),

-- #53 | Sep 23, 2025 10:05:07 | NGN 4,900,000.00
(7, 'DEBIT', 4900000.00,
 'WADA MAHMOUD IBRAHIM',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-23 10:05:07+01',
 'Providus Bank', '000023250923100507004174085719', 'SUCCESSFUL',
 'OTHERBANK-TRANSFER to TAJ BANK - Account 0011079520'),

-- #54 | Sep 23, 2025 10:06:00 | NGN 100,000.00
(7, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-23 10:06:00+01',
 'OPay', '250923100600000000000000000001', 'SUCCESSFUL',
 'Transfer successful - OPay'),

-- #55 | Oct 3, 2025 11:28:00 | NGN 1,257,000.00
(7, 'DEBIT', 1257000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-10-03 11:28:00+01',
 'Jaiz Mobile Plus', 'JF07853462882304', 'SUCCESSFUL',
 'NIBBS Instant Payment - Jaiz Mobile Plus to Taj Bank - Account 001*****20');

-- NOTE: Transaction #56 was not provided in the source details.

-- ============================================================
-- VERIFY:
-- Batch 6 row count should be 19 (transactions #37-#55)
-- Batch 6 total amount should be 102,686,000.00
-- Duplicate check: no duplicate reference_number found in this batch
-- NOTE: source total said 102,685,000.00; recomputed from row amounts = 102,686,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-06-20 00:00:00+01' AND '2025-10-03 23:59:59+01'
--   AND reference_number IN (
--     '001189804200620251744542',
--     '001189804210620205091952',
--     '001189804020720250572136',
--     'JF157478775742464',
--     'JF15847436510032',
--     'JF164186499637248',
--     'JF164672061628416',
--     'JF170866000060416',
--     '001189804040820525214120',
--     '001189804130820251143806',
--     '001189804150820525214647',
--     '001189804230820525114635',
--     '001189804260820252040002',
--     'AFBSSST-35e6b3e7cdac4c9f9926dfd8441465c1',
--     '250906020100937902921071',
--     '000017250910134242845941922489',
--     '000023250923100507004174085719',
--     '250923100600000000000000000001',
--     'JF07853462882304'
--   );
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'DEBIT'
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 7;
-- ============================================================
