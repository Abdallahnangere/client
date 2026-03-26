-- ============================================================
-- Capital Management System
-- Transactions Batch 7 for YUNUSA MUHAMMAD ISA (person_id = 7)
-- Transactions #56 -- #62  |  Oct 2025
-- All DEBIT transactions (outgoing payments)
-- Banks: ALAT by Wema, OPay, Payaza
-- Sender: MAHMOUD IBRAHIM WADA / MAHMOUD WADA / DRAC BUSINESS GLOBAL ENTERPRISES
-- Recipients: YUNUSA MUHAMMAD ISA, ABBA MUHAMMAD ISAH
-- Accounts: TAJ Bank (0003750088, 0011079520), Access Bank (188298182)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(7, 'Yunusa Muhammad Isa', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #56 | Oct 4, 2025 18:39:00 | NGN 10,000,000.00
(7, 'DEBIT', 10000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-10-04 18:39:00+01',
 'Payaza', 'PS88E20251041739258805', 'SUCCESSFUL',
 'Transfer to ACCESS BANK - Account 188298182 - Fee: NGN 100.00'),

-- #57 | Oct 6, 2025 20:31:00 | NGN 6,000,000.00
(7, 'DEBIT', 6000000.00,
 'DRAC BUSINESS GLOBAL ENTERPRISES',
 'ABBA MUHAMMAD ISAH',
 '2025-10-06 20:31:00+01',
 'ALAT by Wema', '000001251006205351226157035', 'SUCCESSFUL',
 'ALTPRO Transfer to TAJ Bank - Account 0003750088 - Narration: ABBA - Transfer Fee: NGN 50.00, VAT: NGN 3.75'),

-- #58 | Oct 6, 2025 20:31:00 | NGN 9,990,000.00
(7, 'DEBIT', 9990000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABBA MUHAMMAD ISAH',
 '2025-10-06 20:31:00+01',
 'OPay', '250906020820220000000000001', 'SUCCESSFUL',
 'Transfer to Taj Bank - Account 0003750088'),

-- #59 | Oct 8, 2025 19:10:00 | NGN 10,000,000.00
(7, 'DEBIT', 10000000.00,
 'MAHMOUD WADA',
 'ABBA MUHAMMAD ISAH',
 '2025-10-08 19:10:00+01',
 'ALAT by Wema', '000017251008191109195816600491', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO ABBA MUHAMMAD ISAH FROM MAHMOUD WADA - Account 0003750088'),

-- #60 | Oct 9, 2025 19:19:00 | NGN 7,000,000.00
(7, 'DEBIT', 7000000.00,
 'MAHMOUD WADA',
 'ABBA MUHAMMAD ISAH',
 '2025-10-09 19:19:00+01',
 'ALAT by Wema', '000017251009191930895947091583', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO ABBA MUHAMMAD ISAH FROM MAHMOUD WADA - Account 0003750088'),

-- #61 | Oct 11, 2025 05:26:00 | NGN 5,000,000.00
(7, 'DEBIT', 5000000.00,
 'MAHMOUD WADA',
 'ABBA MUHAMMAD ISAH',
 '2025-10-11 05:26:00+01',
 'ALAT by Wema', '000017251011164657293847970215', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO ALAT NIP TRANSFER TO Abba Muhammad Isah FROM MAHMO - Account 0003750088'),

-- #62 | Oct 11, 2025 10:22:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABBA MUHAMMAD ISAH',
 '2025-10-11 10:22:00+01',
 'OPay', '251011102200000000000000000002', 'SUCCESSFUL',
 'Transfer successful - OPay to Taj Bank - Account 0003750088');

-- ============================================================
-- VERIFY:
-- Batch 7 row count should be 7 (transactions #56-#62)
-- Batch 7 total amount should be 49,990,000.00
-- Duplicate check: no duplicate reference_number found in this batch
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-10-04 00:00:00+01' AND '2025-10-11 23:59:59+01'
--   AND reference_number IN (
--     'PS88E20251041739258805',
--     '000001251006205351226157035',
--     '250906020820220000000000001',
--     '000017251008191109195816600491',
--     '000017251009191930895947091583',
--     '000017251011164657293847970215',
--     '251011102200000000000000000002'
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
