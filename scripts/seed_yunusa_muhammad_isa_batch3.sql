-- ============================================================
-- Capital Management System
-- Transactions Batch 3 for YUNUSA MUHAMMAD ISA (person_id = 7)
-- Transactions #1 -- #15  |  Aug 2025 -- Oct 2025
-- All CREDIT transactions (set per instruction)
-- Banks: TAJBank, OPay, Access Bank
-- Sender: YUNUSA MUHAMMAD ISA
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(7, 'Yunusa Muhammad Isa', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Aug 30, 2025 10:07:00 | NGN 10,000,000.00
(7, 'CREDIT', 10000000.00,
 'YUNUSA MUHAMMAD ISA',
 'WADAHS MULTIPURPOSE CONCEPT',
 '2025-08-30 10:07:00+01',
 'TAJBank', '000360463300820252100659', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0126939963'),

-- #2 | Aug 31, 2025 15:16:19 | NGN 650,000.00
(7, 'CREDIT', 650000.00,
 'YUNUSA MUHAMMAD ISA',
 'MUNZALI DANLADI',
 '2025-08-31 15:16:19+01',
 'OPay', '250831170100800438228758', 'SUCCESSFUL',
 'OPay transfer - Account 903 322 3310'),

-- #3 | Sep 1, 2025 16:56:00 | NGN 15,000,000.00
(7, 'CREDIT', 15000000.00,
 'YUNUSA MUHAMMAD ISA',
 'WADAHS MULTIPURPOSE CONCEPT',
 '2025-09-01 16:56:00+01',
 'TAJBank', '000360463010920252165555', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0126939963'),

-- #4 | Sep 2, 2025 05:34:00 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-09-02 05:34:00+01',
 'TAJBank', '000360463020920252053335', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #5 | Sep 3, 2025 10:21:00 | NGN 2,000,000.00
(7, 'CREDIT', 2000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-03 10:21:00+01',
 'TAJBank', '000360463030920252102118', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0012036999'),

-- #6 | Sep 5, 2025 15:00:00 | NGN 2,000,000.00
(7, 'CREDIT', 2000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-09-05 15:00:00+01',
 'TAJBank', '000360463050920252145939', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #7 | Sep 5, 2025 18:25:29 | NGN 1,000,000.00
(7, 'CREDIT', 1000000.00,
 'YUNUSA MUHAMMAD ISA',
 'WADAHS MULTIPURPOSE CONCEPT',
 '2025-09-05 18:25:29+01',
 'OPay', '250905020100917609722523', 'SUCCESSFUL',
 'OPay transfer to Wema Bank PLC - Account 0126939963'),

-- #8 | Sep 5, 2025 21:13:43 | NGN 7,000.00
(7, 'CREDIT', 7000.00,
 'YUNUSA MUHAMMAD ISA',
 'WADAHS MULTIPURPOSE CONCEPT',
 '2025-09-05 21:13:43+01',
 'OPay', '250905020100921772236805', 'SUCCESSFUL',
 'OPay transfer to Wema Bank PLC - Account 0126939963'),

-- #9 | Sep 12, 2025 18:37:00 | NGN 5,000,000.00
(7, 'CREDIT', 5000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-12 18:37:00+01',
 'TAJBank', '000360463120920252183725', 'SUCCESSFUL',
 'Transfer to Opay Digital Service - Account 9066575308'),

-- #10 | Sep 12, 2025 19:32:00 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-12 19:32:00+01',
 'TAJBank', '000360463120920252193133', 'SUCCESSFUL',
 'Transfer to First Bank of Nigeria - Account 3134126466'),

-- #11 | Sep 12, 2025 23:52:00 | NGN 12,000,000.00
(7, 'CREDIT', 12000000.00,
 'YUNUSA MUHAMMAD ISA',
 'SHAHEED WADA IBRAHIM',
 '2025-09-12 23:52:00+01',
 'TAJBank', '000360463120920252235136', 'SUCCESSFUL',
 'Transfer to JAIZ Bank - Account 0012066010'),

-- #12 | Sep 13, 2025 18:33:00 | NGN 3,837,000.00
(7, 'CREDIT', 3837000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-13 18:33:00+01',
 'TAJBank', '000360463130920252183255', 'SUCCESSFUL',
 'Transfer to Kuda Microfinance Bank - Account 2008670535'),

-- #13 | Sep 26, 2025 15:41:00 | NGN 25,000,000.00
(7, 'CREDIT', 25000000.00,
 'YUNUSA MUHAMMAD ISA',
 'USMAN MUAZU',
 '2025-09-26 15:41:00+01',
 'TAJBank', '000360463260920252154052', 'SUCCESSFUL',
 'Transfer to Zenith Bank PLC - Account 2211379229'),

-- #14 | Sep 26, 2025 15:43:00 | NGN 25,000,000.00
(7, 'CREDIT', 25000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MUAZU USMAN',
 '2025-09-26 15:43:00+01',
 'TAJBank', '000360463260920252154307', 'SUCCESSFUL',
 'Transfer to Providus Bank - Account 6508266571'),

-- #15 | Oct 4, 2025 22:59:01 | NGN 10,000,000.00
(7, 'CREDIT', 10000000.00,
 'YUNUSA MUHAMMAD ISA',
 'ABBA MUHAMMAD ISAH',
 '2025-10-04 22:59:01+01',
 'Access Bank', 'NXGETZ-09FG251004225846737YRF5AW', 'SUCCESSFUL',
 'Inter-bank transfer to TAJ BANK - Account 0003750088');

-- ============================================================
-- VERIFY:
-- Batch 3 row count should be 15
-- Batch 3 total amount should be 117,494,000.00
-- NOTE: source summary said 121,494,000.00; recomputed from row amounts = 117,494,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'CREDIT'
--   AND transaction_date BETWEEN '2025-08-30 00:00:00+01' AND '2025-10-04 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 7;
-- ============================================================
