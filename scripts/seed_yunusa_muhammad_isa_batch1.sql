-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for YUNUSA MUHAMMAD ISA (person_id = 7)
-- Transactions #1 -- #20  |  May 2025 -- Jul 2025
-- All CREDIT transactions (incoming payments received)
-- Banks: TAJBank, Access Bank, OPay, OneBank, Wema Bank, FCMB, Zenith Bank
-- Senders: Yunusa Muhammad Isa, Abba Muhammad Isah, Bukar Mubarak,
--          Muhsin Ibrahim Wada, Next Door Park Kano, Sulamd General Enterprises
-- Receiver: MAHMOUD WADA / MAHMOUD IBRAHIM WADA
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(7, 'Yunusa Muhammad Isa', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | May 6, 2025 08:54:00 | NGN 8,000,000.00
(7, 'CREDIT', 8000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-05-06 08:54:00+01',
 'TAJBank', '000360463060520250085341', 'SUCCESSFUL',
 'Transfer to Kuda Microfinance Bank - Account 2008670535'),

-- #2 | May 6, 2025 12:56:00 | NGN 8,000,000.00
(7, 'CREDIT', 8000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-05-06 12:56:00+01',
 'TAJBank', '000360463060520252125542', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #3 | May 13, 2025 13:45:55 | NGN 14,000,000.00
(7, 'CREDIT', 14000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-05-13 13:45:55+01',
 'Access Bank', 'NXG00001425051313452926608863451', 'SUCCESSFUL',
 'Inter-bank transfer to Kuda Microfinance Bank - Account 2008670535'),

-- #4 | May 13, 2025 13:48:14 | NGN 7,000,000.00
(7, 'CREDIT', 7000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-05-13 13:48:14+01',
 'Access Bank', 'NXGETZ-09FG250513134916315EU6K4C', 'SUCCESSFUL',
 'Inter-bank transfer to Wema Bank - Account 0252971026'),

-- #5 | May 20, 2025 14:59:00 | NGN 25,000,000.00
(7, 'CREDIT', 25000000.00,
 'YUNUSA MUHAMMAD ISA',
 'ABBA MUHAMMAD ISAH',
 '2025-05-20 14:59:00+01',
 'TAJBank', '000360463200520252145924', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0003750088'),

-- #6 | May 21, 2025 14:27:31 | NGN 600,000.00
(7, 'CREDIT', 600000.00,
 'MUHSIN IBRAHIM WADA',
 'SAID ABDULLAHI ABDULMUDALLIB',
 '2025-05-21 14:27:31+01',
 'OPay', '250521010100821859745985', 'SUCCESSFUL',
 'OPay transfer - Account 813 079 0151'),

-- #7 | May 28, 2025 08:28:00 | NGN 5,000,000.00
(7, 'CREDIT', 5000000.00,
 'BUKAR MUBARAK',
 'YUNUSA MUHAMMAD ISA',
 '2025-05-28 08:28:00+01',
 'OneBank', '000001250528082746151437680650', 'SUCCESSFUL',
 'Transfer to Access Bank - Account 1882987182'),

-- #8 | Jun 2, 2025 11:56:00 | NGN 25,000,000.00
(7, 'CREDIT', 25000000.00,
 'ABBA MUHAMMAD ISAH',
 'MAHMOUD WADA',
 '2025-06-02 11:56:00+01',
 'TAJBank', '000371809020620252115614', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #9 | Jun 3, 2025 11:44:00 | NGN 23,000,000.00
(7, 'CREDIT', 23000000.00,
 'ABBA MUHAMMAD ISAH',
 'MAHMOUD WADA',
 '2025-06-03 11:44:00+01',
 'TAJBank', '000371809030620252114412', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #10 | Jun 10, 2025 12:31:00 | NGN 24,000,000.00
(7, 'CREDIT', 24000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-06-10 12:31:00+01',
 'TAJBank', '000360463100620252123133', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #11 | Jun 10, 2025 12:33:26 | NGN 24,000,000.00
(7, 'CREDIT', 24000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-06-10 12:33:26+01',
 'Access Bank', 'NXGETZ-09FG250610123515353VS47R', 'SUCCESSFUL',
 'Inter-bank transfer to Wema Bank - Account 0252971026'),

-- #12 | Jun 10, 2025 12:36:00 | NGN 8,000,000.00
(7, 'CREDIT', 8000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-06-10 12:36:00+01',
 'TAJBank', '000360463100620252123544', 'SUCCESSFUL',
 'Transfer to Wema Bank - Account 0252971026'),

-- #13 | Jun 20, 2025 13:18:25 | NGN 4,000,000.00
(7, 'CREDIT', 4000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-06-20 13:18:25+01',
 'Access Bank', 'NXG00001425062013182427423126611', 'SUCCESSFUL',
 'Inter-bank transfer to Wema Bank - Account 0252971026'),

-- #14 | Jun 27, 2025 20:46:09 | NGN 155,700.00
(7, 'CREDIT', 155700.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-06-27 20:46:09+01',
 'OPay', '250627170100489928471956', 'SUCCESSFUL',
 'OPay transfer - Account 906 657 5308'),

-- #15 | Jul 11, 2025 15:19:00 | NGN 20,000,000.00
(7, 'CREDIT', 20000000.00,
 'ABBA MUHAMMAD ISAH',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-11 15:19:00+01',
 'TAJBank', '000371809110720252151859', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0012036999'),

-- #16 | Jul 11, 2025 08:49:00 | NGN 2,700,000.00
(7, 'CREDIT', 2700000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-11 08:49:00+01',
 'TAJBank', '000360463110720250084902', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0012036999'),

-- #17 | Jul 11, 2025 21:13:00 | NGN 17,000,000.00
(7, 'CREDIT', 17000000.00,
 'NEXT DOOR PARK KANO',
 'MAHMOUD WADA',
 '2025-07-11 21:13:00+01',
 'FCMB', 'FCMB-DEBIT-202507112113', 'SUCCESSFUL',
 'Payment from Next Door Park Kano to Wema/ALAT - Account 0252971026'),

-- #18 | Jul 12, 2025 09:36:05 | NGN 4,000,000.00
(7, 'CREDIT', 4000000.00,
 'SULAMD GENERAL ENTERPRISES',
 'MAHMOUD WADA',
 '2025-07-12 09:36:05+01',
 'Zenith Bank', 'ZENITH-IB-202507120936', 'SUCCESSFUL',
 'Inter-bank transfer to Wema Bank - Account 0252971026'),

-- #19 | Jul 29, 2025 09:47:00 | NGN 20,000,000.00
(7, 'CREDIT', 20000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-29 09:47:00+01',
 'TAJBank', '000360463290720250094646', 'SUCCESSFUL',
 'Transfer to TAJBank - Account 0012036999'),

-- #20 | May 13, 2025 17:00:00 | NGN 3,000,000.00
(7, 'CREDIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'MAHMOUD WADA',
 '2025-05-13 17:00:00+01',
 'Wema Bank', 'PSM00010031688', 'SUCCESSFUL',
 'Transfer from Yunusa Muhammad Isa - WBP Transfer');

-- ============================================================
-- VERIFY:
-- Batch 1 row count should be 20
-- Batch 1 total amount should be 242,455,700.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 7
--   AND type = 'CREDIT'
--   AND transaction_date BETWEEN '2025-05-06 00:00:00+01' AND '2025-07-29 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 7;
-- ============================================================
