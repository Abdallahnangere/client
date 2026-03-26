-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for YUNUSA MUHAMMAD ISA (person_id = 7)
-- Transactions #1 -- #19  |  Jul 2025 -- Aug 2025
-- All CREDIT transactions (incoming payments received)
-- Banks: TAJBank, OPay, Access Bank
-- Senders: Yunusa Muhammad Isa, Muhammad Salmanu Muhammad
-- Receiver: MAHMOUD IBRAHIM WADA / MAHMOUD WADA
-- ============================================================
-- NOTE: Row #12 was removed as a confirmed duplicate of row #11
--   (same OPay reference: 250805020100267196221585)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(7, 'Yunusa Muhammad Isa', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Jul 29, 2025 19:40:00 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-29 19:40:00+01',
 'TAJBank', '000360463290720252193949', 'SUCCESSFUL',
 'Transfer to Jaiz Bank - Account 0020820220'),

-- #2 | Jul 29, 2025 21:06:00 | NGN 2,000,000.00
(7, 'CREDIT', 2000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-29 21:06:00+01',
 'TAJBank', '000360463290720252210555', 'SUCCESSFUL',
 'Transfer to Jaiz Bank - Account 0020820220'),

-- #3 | Jul 29, 2025 19:36:45 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-29 19:36:45+01',
 'OPay', '250729020100115144918401', 'SUCCESSFUL',
 'OPay transfer to Jaiz Bank Plc - Account 0020820220'),

-- #4 | Jul 30, 2025 14:12:14 | NGN 4,000,000.00
(7, 'CREDIT', 4000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-30 14:12:14+01',
 'OPay', '250730020100129605215609', 'SUCCESSFUL',
 'OPay transfer to TAJBank - Account 0012036999'),

-- #5 | Aug 1, 2025 21:48:00 | NGN 5,209,000.00
(7, 'CREDIT', 5209000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-08-01 21:48:00+01',
 'TAJBank', '000360463010820252514817', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #6 | Aug 2, 2025 08:25:00 | NGN 5,000,000.00
(7, 'CREDIT', 5000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-02 08:25:00+01',
 'TAJBank', '000360463020820252082529', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0012036999'),

-- #7 | Aug 2, 2025 11:48:00 | NGN 2,000,000.00
(7, 'CREDIT', 2000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-02 11:48:00+01',
 'TAJBank', '000360463020820252114815', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0012036999'),

-- #8 | Aug 2, 2025 08:26:56 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-02 08:26:56+01',
 'OPay', '250802020100186665472237', 'SUCCESSFUL',
 'OPay transfer to TAJBank - Account 0012036999'),

-- #9 | Aug 2, 2025 15:26:34 | NGN 5,000,000.00
(7, 'CREDIT', 5000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-02 15:26:34+01',
 'Access Bank', 'NXGETZ-09FG250802152454022P60JVG', 'SUCCESSFUL',
 'Inter-bank transfer to TAJBank - Account 0012036999'),

-- #10 | Aug 3, 2025 15:04:02 | NGN 500,000.00
(7, 'CREDIT', 500000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-08-03 15:04:02+01',
 'OPay', '250803020100216288654414', 'SUCCESSFUL',
 'OPay transfer to Wema Bank PLC - Account 0252971026'),

-- #11 | Aug 5, 2025 11:03:45 | NGN 2,000,000.00
(7, 'CREDIT', 2000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-05 11:03:45+01',
 'OPay', '250805020100267196221585', 'SUCCESSFUL',
 'OWealth transfer to TAJBank - Account 0012036999'),

-- #12 | Aug 5, 2025 14:12:20 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'MUHAMMAD SALMANU MUHAMMAD',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-05 14:12:20+01',
 'OPay', '250805020100255815243007', 'SUCCESSFUL',
 'OPay transfer to TAJBank - Account 0012036999 - Remark: Halifa'),

-- #13 | Aug 9, 2025 02:26:00 | NGN 5,000,000.00
(7, 'CREDIT', 5000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-09 02:26:00+01',
 'TAJBank', '000360463090820252142545', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0012036999'),

-- #14 | Aug 13, 2025 21:22:00 | NGN 1,000,000.00
(7, 'CREDIT', 1000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-13 21:22:00+01',
 'TAJBank', '000360463130820252512205', 'SUCCESSFUL',
 'Transfer to OPay Digital Service - Account 9066575308'),

-- #15 | Aug 16, 2025 00:21:47 | NGN 1,000,000.00
(7, 'CREDIT', 1000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-16 00:21:47+01',
 'OPay', '250815020100475379274109', 'SUCCESSFUL',
 'OPay transfer to TAJBank - Account 0012036999'),

-- #16 | Aug 19, 2025 23:10:00 | NGN 2,000,000.00
(7, 'CREDIT', 2000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-19 23:10:00+01',
 'TAJBank', '000360463190820252530937', 'SUCCESSFUL',
 'Transfer to OPay Digital Service - Account 9066575308'),

-- #17 | Aug 27, 2025 15:35:56 | NGN 11,000,000.00
(7, 'CREDIT', 11000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-27 15:35:56+01',
 'Access Bank', 'NXGETZ-09FG250827153438786VHSLI', 'SUCCESSFUL',
 'Inter-bank transfer to Jaiz Bank - Account 0020820220'),

-- #18 | Aug 27, 2025 17:57:31 | NGN 5,000,000.00
(7, 'CREDIT', 5000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-27 17:57:31+01',
 'Access Bank', 'NXGETZ-09FG250827175614683ZGD3MD', 'SUCCESSFUL',
 'Inter-bank transfer to TAJBank - Account 0012036999'),

-- #19 | Aug 27, 2025 21:19:04 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-27 21:19:04+01',
 'Access Bank', 'NXGETZ-09FG250827211746471BKRMM9', 'SUCCESSFUL',
 'Inter-bank transfer to TAJBank - Account 0012036999');

-- ============================================================
-- VERIFY:
-- Batch 2 row count should be 19
-- Batch 2 total amount should be 65,709,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'CREDIT'
--   AND transaction_date BETWEEN '2025-07-29 00:00:00+01' AND '2025-08-27 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 7;
-- ============================================================
