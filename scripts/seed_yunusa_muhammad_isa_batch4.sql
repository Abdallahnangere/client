-- ============================================================
-- Capital Management System
-- Transactions Batch 4 for YUNUSA MUHAMMAD ISA (person_id = 7)
-- Transactions #1 -- #20  |  Apr 2025 -- Sep 2025
-- All DEBIT transactions (outgoing payments)
-- Banks: Kuda Microfinance Bank, ALAT by Wema
-- Sender: MAHMOUD WADA
-- Recipient: YUNUSA MUHAMMAD ISA
-- Accounts: TAJBank (0011079520), OPay Digital (8066117570)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(7, 'Yunusa Muhammad Isa', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Apr 29, 2025 15:29:00 | NGN 1,280,000.00
(7, 'DEBIT', 1280000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-04-29 15:29:00+01',
 'Kuda Microfinance Bank', '090267250429152925523008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhh'),

-- #2 | May 7, 2025 01:02:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-07 01:02:00+01',
 'Kuda Microfinance Bank', '090267250507010231048008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: bbbb'),

-- #3 | May 7, 2025 01:02:00 | NGN 1,600,000.00
(7, 'DEBIT', 1600000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-07 01:02:00+01',
 'Kuda Microfinance Bank', '090267250507010259210008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: bbbb'),

-- #4 | May 7, 2025 01:02:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-07 01:02:00+01',
 'Kuda Microfinance Bank', '090267250507010205479008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhh'),

-- #5 | May 13, 2025 17:56:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-13 17:56:00+01',
 'Kuda Microfinance Bank', '090267250513175607553008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhh'),

-- #6 | May 13, 2025 17:56:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-13 17:56:00+01',
 'Kuda Microfinance Bank', '090267250513175635734008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhh'),

-- #7 | May 13, 2025 17:56:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-13 17:56:00+01',
 'Kuda Microfinance Bank', '090267250513175656070008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhh'),

-- #8 | May 13, 2025 17:57:00 | NGN 460,000.00
(7, 'DEBIT', 460000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-13 17:57:00+01',
 'Kuda Microfinance Bank', '090267250513175714516008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: bhhhh'),

-- #9 | May 28, 2025 08:09:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-28 08:09:00+01',
 'Kuda Microfinance Bank', '090267250528080949403008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhhh - Fee: NGN 10'),

-- #10 | May 28, 2025 08:10:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-28 08:10:00+01',
 'Kuda Microfinance Bank', '090267250528081007913008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhh - Fee: NGN 50'),

-- #11 | May 28, 2025 08:09:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-28 08:09:00+01',
 'Kuda Microfinance Bank', '090267250528080924454008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhh - Fee: NGN 10'),

-- #12 | May 28, 2025 08:13:00 | NGN 460,000.00
(7, 'DEBIT', 460000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-28 08:13:00+01',
 'Kuda Microfinance Bank', '090267250528081321625008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhhh - Fee: NGN 10'),

-- #13 | Jun 11, 2025 18:53:00 | NGN 8,000,000.00
(7, 'DEBIT', 8000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-06-11 18:53:00+01',
 'ALAT by Wema', '000017250611185323761982330346', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO TAJ BANK - Account 0011079520'),

-- #14 | Jul 14, 2025 14:13:00 | NGN 22,000,000.00
(7, 'DEBIT', 22000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-07-14 14:13:00+01',
 'ALAT by Wema', '000017250714141310024869401290', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Taj Bank - Account 0011079520 - hhhh'),

-- #15 | Jul 28, 2025 19:24:00 | NGN 10,000,000.00
(7, 'DEBIT', 10000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-07-28 19:24:00+01',
 'ALAT by Wema', '000017250728192441196157118797', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Taj Bank - Account 0011079520'),

-- #16 | Aug 8, 2025 19:55:00 | NGN 1,910,300.00
(7, 'DEBIT', 1910300.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-08 19:55:00+01',
 'ALAT by Wema', '000017250808195526616623947070', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Opay - Account 8066117570'),

-- #17 | Aug 22, 2025 19:36:00 | NGN 1,811,000.00
(7, 'DEBIT', 1811000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-08-22 19:36:00+01',
 'ALAT by Wema', '000017250822193631174781568819', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Opay - Account 8066117570 - hhhh'),

-- #18 | Sep 2, 2025 21:59:00 | NGN 2,688,000.00
(7, 'DEBIT', 2688000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-02 21:59:00+01',
 'ALAT by Wema', '000017250902215933810647117726', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Opay - Account 8066117570 - hhh'),

-- #19 | Sep 11, 2025 10:11:00 | NGN 2,400,000.00
(7, 'DEBIT', 2400000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-11 10:11:00+01',
 'ALAT by Wema', '000017250911101153377492291353', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Opay - Account 8066117570 - hhhh'),

-- #20 | Sep 20, 2025 17:21:00 | NGN 2,000,000.00
(7, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-20 17:21:00+01',
 'Kuda Microfinance Bank', '090267250920172059387008670535', 'SUCCESSFUL',
 'Transfer to TAJ Bank - Account 0011079520 - Description: hhh');

-- ============================================================
-- VERIFY:
-- Batch 4 row count should be 20
-- Batch 4 total amount should be 70,609,300.00
-- Duplicate check: no duplicate reference_number found in this batch
-- NOTE: source summary said 73,209,300.00; recomputed total from row amounts = 70,609,300.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-04-29 00:00:00+01' AND '2025-09-20 23:59:59+01';
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-04-29 00:00:00+01' AND '2025-09-20 23:59:59+01'
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 7;
-- ============================================================
