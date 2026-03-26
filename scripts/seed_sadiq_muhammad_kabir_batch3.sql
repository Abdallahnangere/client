-- ============================================================
-- Capital Management System
-- Transactions Batch 3 for SADIQ MUHAMMAD KABIR (person_id = 5)
-- Transactions #1 -- #13  |  May 2025 -- Sep 2025
-- All DEBIT transactions (outgoing payments)
-- Platform: OPay
-- Sender: MAHMOUD IBRAHIM WADA (OPay | 906****308)
-- Receiver: SADIQ MUHAMMAD KABIR (OPay | 911 799 4043)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(5, 'Sadiq Muhammad Kabir', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | May 6, 2025 15:03:04 | NGN 100,000.00
(5, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-05-06 15:03:04+01',
 'OPay', '250506010100562901398884', 'SUCCESSFUL',
 'Payment from HASSAN HUDU IBRAHIM'),

-- #2 | Jun 8, 2025 09:38:29 | NGN 200,000.00
(5, 'DEBIT', 200000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-06-08 09:38:29+01',
 'OPay', '250608010100143481173053', 'SUCCESSFUL',
 'Transfer received'),

-- #3 | Jun 22, 2025 09:42:30 | NGN 700,000.00
(5, 'DEBIT', 700000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-06-22 09:42:30+01',
 'OPay', '250622010100387534716054', 'SUCCESSFUL',
 'Business payment'),

-- #4 | Jul 6, 2025 13:08:53 | NGN 800,000.00
(5, 'DEBIT', 800000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-07-06 13:08:53+01',
 'OPay', '250706010100653318491543', 'SUCCESSFUL',
 'Monthly disbursement'),

-- #5 | Jul 13, 2025 15:25:17 | NGN 350,000.00
(5, 'DEBIT', 350000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-07-13 15:25:17+01',
 'OPay', '250713010100790396066786', 'SUCCESSFUL',
 'Project funding'),

-- #6 | Jul 14, 2025 15:18:07 | NGN 30,000.00
(5, 'DEBIT', 30000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-07-14 15:18:07+01',
 'OPay', '250714010100809610586915', 'SUCCESSFUL',
 'Expense reimbursement'),

-- #7 | Jul 27, 2025 19:51:30 | NGN 1,450,000.00
(5, 'DEBIT', 1450000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-07-27 19:51:30+01',
 'OPay', '250727010100075101956062', 'SUCCESSFUL',
 'Major capital disbursement'),

-- #8 | Jul 31, 2025 15:25:54 | NGN 15,000.00
(5, 'DEBIT', 15000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-07-31 15:25:54+01',
 'OPay', '250731010100152069241815', 'SUCCESSFUL',
 'Minor expense'),

-- #9 | Aug 10, 2025 17:23:02 | NGN 500,000.00
(5, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-08-10 17:23:02+01',
 'OPay', '250810010100363138776245', 'SUCCESSFUL',
 'Operating capital'),

-- #10 | Aug 11, 2025 04:13:25 | NGN 500,000.00
(5, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-08-11 04:13:25+01',
 'OPay', '250811010100371120674489', 'SUCCESSFUL',
 'Additional funding'),

-- #11 | Aug 17, 2025 08:06:03 | NGN 195,000.00
(5, 'DEBIT', 195000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-08-17 08:06:03+01',
 'OPay', '250817010100498665353077', 'SUCCESSFUL',
 'Operational expenses'),

-- #12 | Aug 31, 2025 14:49:39 | NGN 2,160,000.00
(5, 'DEBIT', 2160000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-08-31 14:49:39+01',
 'OPay', '250831010100799889089771', 'SUCCESSFUL',
 'Large capital transfer'),

-- #13 | Sep 14, 2025 11:42:15 | NGN 1,000,000.00
(5, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'SADIQ MUHAMMAD KABIR',
 '2025-09-14 11:42:15+01',
 'OPay', '250914010100106324889193', 'SUCCESSFUL',
 'Business expansion funding');

-- ============================================================
-- VERIFY:
-- Batch 3 row count should be 13
-- Batch 3 total amount should be 8,000,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 5
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-05-06 00:00:00+01' AND '2025-09-14 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 5;
-- ============================================================
