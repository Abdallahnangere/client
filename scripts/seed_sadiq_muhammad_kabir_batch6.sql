-- ============================================================
-- Capital Management System
-- Transactions Batch 6 - DEBITS for SADIQ MUHAMMAD KABIR (person_id = 5)
-- Transactions #21 -- #40  |  Nov 2025 -- Dec 2025
-- All DEBIT
-- Receivers: MAHMOUD IBRAHIM WADA via OPay, ALAT, TAJBank
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(5, 'Sadiq Muhammad Kabir', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #21 | Nov 02, 2025 21:12 | NGN 200,000
(5, 'DEBIT', 200000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA - 0252****26',
 '2025-11-02 21:12:00+01',
 'ALAT', '332572779401', 'SUCCESSFUL',
 'ALAT TRANSFER TO SADIQ KABIR FROM MAHMOUD WADA - Party with Davido Live'),

-- #22 | Nov 03, 2025 11:20 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-11-03 11:20:00+01',
 'ALAT', '000017251103112011317949666640660', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Party with Davido Live'),

-- #23 | Nov 03, 2025 09:25 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-11-03 09:25:00+01',
 'ALAT', '000017251103092504646719599920', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Party with Davido Live'),

-- #24 | Nov 16, 2025 17:14 | NGN 300,000
(5, 'DEBIT', 300000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-16 17:14:10+01',
 'OPay', '251116010100608314416587', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #25 | Nov 17, 2025 12:44 | NGN 50,000
(5, 'DEBIT', 50000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-17 12:44:10+01',
 'OPay', '251117010100626284090948', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #26 | Nov 17, 2025 15:42 | NGN 400,000
(5, 'DEBIT', 400000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-17 15:42:50+01',
 'OPay', '251117010100630903428584', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #27 | Nov 18, 2025 04:26 | NGN 2,500,000
(5, 'DEBIT', 2500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - 001****999',
 '2025-11-18 04:26:00+01',
 'TAJBank', '001189804181120251625538', 'SUCCESSFUL',
 'Transfer to Mahmoud Ibrahim Wada via Opay Digital Service'),

-- #28 | Nov 23, 2025 11:37 | NGN 100,000
(5, 'DEBIT', 100000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-23 11:37:44+01',
 'OPay', '251123010100781039690608', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #29 | Nov 23, 2025 13:02 | NGN 600,000
(5, 'DEBIT', 600000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-11-23 13:02:00+01',
 'ALAT', '000017251123130201603661592885', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Party with Davido Live'),

-- #30 | Nov 24, 2025 13:15 | NGN 20,000
(5, 'DEBIT', 20000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-24 13:15:48+01',
 'OPay', '251124010100808009510409', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #31 | Nov 25, 2025 01:20 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-11-25 01:20:00+01',
 'ALAT', '000017251125132011305672576735', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - hhh'),

-- #32 | Nov 25, 2025 04:42 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-11-25 04:42:00+01',
 'ALAT', '000017251125164246452412715440', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Party with Davido Live'),

-- #33 | Nov 26, 2025 06:51 | NGN 1,000,000
(5, 'DEBIT', 1000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-11-26 06:51:00+01',
 'ALAT', '000017251126065100824452959477', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Party with Davido Live'),

-- #34 | Nov 26, 2025 12:35 | NGN 220,000
(5, 'DEBIT', 220000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-26 12:35:37+01',
 'OPay', '251126010100860723014813', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #35 | Nov 26, 2025 15:48 | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-26 15:48:08+01',
 'OPay', '251126010100865703950670', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #36 | Nov 29, 2025 08:17 | NGN 47,000
(5, 'DEBIT', 47000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-11-29 08:17:10+01',
 'OPay', '251129010100936612388952', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #37 | Dec 01, 2025 12:47 | NGN 300,000
(5, 'DEBIT', 300000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA - OPay 906****308',
 '2025-12-01 12:47:30+01',
 'OPay', '251201010100997495602542', 'SUCCESSFUL',
 'OPay transfer to Mahmoud Ibrahim Wada'),

-- #38 | Dec 02, 2025 01:12 | NGN 2,000,000
(5, 'DEBIT', 2000000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-12-02 01:12:00+01',
 'ALAT', '000017251202131205336556868152', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sadiq Mohammad Kabir FROM MAHMOUD WADA - Party with Davido Live'),

-- #39 | Additional transfer (from Image 1) | NGN 300,000
(5, 'DEBIT', 300000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-11-03 08:21:00+01',
 'Mobile Banking', 'MB20251103001', 'SUCCESSFUL',
 'Mobile transfer'),

-- #40 | Additional transfer (from Image 4) | NGN 500,000
(5, 'DEBIT', 500000.00,
 'SADIQ MUHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-11-03 04:07:00+01',
 'Mobile Banking', 'MB20251103002', 'SUCCESSFUL',
 'Mobile transfer');

-- ============================================================
-- VERIFY:
-- Batch 6 row count should be 20
-- Batch 6 total amount should be 12,537,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 5
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-11-02 00:00:00+01' AND '2025-12-02 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 5;
-- ============================================================
