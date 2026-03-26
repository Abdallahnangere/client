-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for ABDULJALAL MUHAMMAD (person_id = 9)
-- Transactions #1 -- #20  |  Dec 2024 -- Oct 2025
-- All CREDIT transactions (incoming payments received)
-- Platforms: OPay, OneBank (Sterling), First Bank, OWealth, Moniepoint, GTCO, Jaiz Mobile, Kuda Microfinance Bank
-- Sender: ABDULJALAL MUHAMMAD / MUHAMMAD ABDULJALAL / Various
-- Receiver: MAHMOUD IBRAHIM WADA / MAHMOUD WADA
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(9, 'Abduljalal Muhammad', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Dec 13, 2024 16:09:39 | NGN 100,000.00
(9, 'CREDIT', 100000.00,
 'ABDULJALAL MUHAMMAD',
 'MAHMOUD WADA',
 '2024-12-13 16:09:39+01',
 'OPay', '241213020100376245401787', 'SUCCESSFUL',
 'Transfer to Bank Account - Wema Bank PLC | 0252971026'),

-- #2 | Dec 13, 2024 15:24:42 | NGN 500,000.00
(9, 'CREDIT', 500000.00,
 'SAGIRU ASSABU',
 'MAHMOUD WADA',
 '2024-12-13 15:24:42+01',
 'First Bank', '000016241213152452000089671422', 'SUCCESSFUL',
 'Interbank Transfer - Narration: Dan cigili dawanau kano - Account *****13014'),

-- #3 | Dec 13, 2024 22:01:26 | NGN 85,000.00
(9, 'CREDIT', 85000.00,
 'ABDULJALAL MUHAMMAD',
 'MAHMOUD WADA',
 '2024-12-13 22:01:26+01',
 'OPay', '241213020100381418282395', 'SUCCESSFUL',
 'Transfer to Bank Account - Wema Bank PLC | 0252971026'),

-- #4 | Dec 13, 2024 22:42:42 | NGN 90,000.00
(9, 'CREDIT', 90000.00,
 'ABDULJALAL MUHAMMAD',
 'MAHMOUD WADA',
 '2024-12-13 22:42:42+01',
 'OWealth', '241213020100381931610694', 'SUCCESSFUL',
 'Transfer to Bank Account - Wema Bank PLC | 0252971026'),

-- #5 | Dec 13, 2024 22:41:00 | NGN 110,000.00
(9, 'CREDIT', 110000.00,
 'UMMI ILIYASU',
 'MAHMOUD WADA',
 '2024-12-13 22:41:00+01',
 'First Bank', '000016241232241000008953447', 'SUCCESSFUL',
 'Interbank Transfer - Narration: None - Account *****97547'),

-- #6 | Dec 13, 2024 17:02:00 | NGN 100,000.00
(9, 'CREDIT', 100000.00,
 'H & H MASHA ALLAH ENTERPERISES',
 'MAHMOUD WADA',
 '2024-12-13 17:02:00+01',
 'Moniepoint', '090405241213702478969150646467', 'SUCCESSFUL',
 'Transfer - Beneficiary: MAHMOUD WADA | 0252971026 - Wema Bank'),

-- #7 | Dec 14, 2024 14:15:34 | NGN 15,000.00
(9, 'CREDIT', 15000.00,
 'FATIMA SHUAIBU ALIYU',
 'MAHMOUD WADA',
 '2024-12-14 14:15:34+01',
 'OPay', '241214020100389090928752', 'SUCCESSFUL',
 'Transfer to Bank Account - Wema Bank PLC | 0252971026'),

-- #8 | Dec 17, 2024 15:21:00 | NGN 50,000.00
(9, 'CREDIT', 50000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD WADA',
 '2024-12-17 15:21:00+01',
 'GTCO', '000013241217152127000035669150', 'SUCCESSFUL',
 'NIBBS Instant Payment Outward to Wema Bank'),

-- #9 | Jan 2, 2025 00:32:37 | NGN 200,000.00
(9, 'CREDIT', 200000.00,
 'SAHALU HUSSAIN AGRO ALLIED PRODUCTION',
 'MAHMOUD WADA',
 '2025-01-02 00:32:37+01',
 'Jaiz Mobile', 'JF1370168403', 'SUCCESSFUL',
 'NIBBS Instant Payment - Payment Narration: Fatima - Account 001*****72'),

-- #10 | Mar 9, 2025 19:26:00 | NGN 105,000.00
(9, 'CREDIT', 105000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-03-09 19:26:00+01',
 'OneBank (Sterling)', '000001251007060147280822752133', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #11 | Apr 20, 2025 00:22:55 | NGN 10,000.00
(9, 'CREDIT', 10000.00,
 'ABDULJALAL MUHAMMAD',
 'MAHMOUD IBRAHIM WADA',
 '2025-04-20 00:22:55+01',
 'OPay', '250419010100286259670226', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 906 657 5308'),

-- #12 | May 16, 2025 04:02:00 | NGN 500,000.00
(9, 'CREDIT', 500000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-05-16 04:02:00+01',
 'OneBank (Sterling)', '000001250516160204846704121323', 'SUCCESSFUL',
 'Transfer to Kuda Microfinance Bank - Account 2008670535'),

-- #13 | May 16, 2025 09:24:00 | NGN 4,100,000.00
(9, 'CREDIT', 4100000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-05-16 09:24:00+01',
 'OneBank (Sterling)', '000001250516092252057367523827', 'SUCCESSFUL',
 'Transfer to Kuda Microfinance Bank - Account 2008670535'),

-- #14 | Jun 14, 2025 21:55:00 | NGN 50,000.00
(9, 'CREDIT', 50000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-06-14 21:55:00+01',
 'OneBank (Sterling)', '000001250614215510078486047828', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #15 | Jun 24, 2025 12:08:00 | NGN 300,000.00
(9, 'CREDIT', 300000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-06-24 12:08:00+01',
 'OneBank (Sterling)', '000001250624000810220053407637', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #16 | Jun 29, 2025 11:51:00 | NGN 50,000.00
(9, 'CREDIT', 50000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-06-29 11:51:00+01',
 'OneBank (Sterling)', '000001250629115052428235004385', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #17 | Jul 6, 2025 11:44:00 | NGN 100,000.00
(9, 'CREDIT', 100000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-06 11:44:00+01',
 'OneBank (Sterling)', '000001250706234420561258728857', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #18 | Aug 17, 2025 21:10:00 | NGN 100,000.00
(9, 'CREDIT', 100000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-17 21:10:00+01',
 'OneBank (Sterling)', '000001250817210940838218007184', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #19 | Sep 15, 2025 00:00:00 | NGN 1,000,000.00
(9, 'CREDIT', 1000000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-15 00:00:00+01',
 'OneBank (Sterling)', '000001250915000008275718437834', 'SUCCESSFUL',
 'Transfer to Kuda Microfinance Bank - Account 2008670535'),

-- #20 | Oct 7, 2025 06:02:00 | NGN 940,000.00
(9, 'CREDIT', 940000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-07 06:02:00+01',
 'OneBank (Sterling)', '000001251007060147280822752133', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308');

-- ============================================================
-- VERIFY:
-- Batch 1 row count should be 20
-- Batch 1 total amount should be 8,505,000.00
-- Duplicate check: reference 000001251007060147280822752133 appears in rows #10 and #20
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'CREDIT'
--   AND transaction_date BETWEEN '2024-12-13 00:00:00+01' AND '2025-10-07 23:59:59+01';
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'CREDIT'
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 9;
-- ============================================================
