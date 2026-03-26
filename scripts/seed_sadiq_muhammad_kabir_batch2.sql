-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for SADIQ MUHAMMAD KABIR (person_id = 5)
-- Transactions #1 -- #14  |  Oct 2025 -- Dec 2025
-- All CREDIT
-- Sources: ALAT (Wema Bank), OPay, Providus Bank, Monie Point
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(5, 'Sadiq Muhammad Kabir', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Oct 6, 2025 12:25 | NGN 4,000,000 | OPay -> Wema Bank
(5, 'CREDIT', 4000000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-10-06 12:25:48+01',
 'OPay', '25100602010060724906799', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD WADA via Wema Bank PLC | Acc: 0252971026'),

-- #2 | Oct 7, 2025 22:25 | NGN 150,000 | OPay -> OPay
(5, 'CREDIT', 150000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-07 22:25:13+01',
 'OPay', '25100701010064471688428', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD IBRAHIM WADA | OPay: 906 657 5308 | Payment method: OWealth'),

-- #3 | Oct 18, 2025 09:09 | NGN 6,000,000 | ALAT -> Wema/ALAT
(5, 'CREDIT', 6000000.00,
 'SADIQ KABIR',
 'MAHMOUD WADA',
 '2025-10-18 09:09:00+01',
 'Wema/ALAT', '335008197148', 'SUCCESSFUL',
 'ALAT transfer to MAHMOUD WADA from SADIQ KABIR | Acc: 0252971026'),

-- #4 | Oct 18, 2025 09:18 | NGN 4,000,000 | OPay -> Wema Bank
(5, 'CREDIT', 4000000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-10-18 09:18:21+01',
 'OPay', '25101802010087871694329', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD WADA via Wema Bank PLC | Acc: 0252971026'),

-- #5 | Oct 26, 2025 | NGN 8,200,000 | ALAT -> Providus Bank
(5, 'CREDIT', 8200000.00,
 'SADIQ KABIR',
 'WADA MAHMOUD IBRAHIM',
 '2025-10-26 01:06:00+01',
 'Providus Bank', '000017251026130604374775682193', 'SUCCESSFUL',
 'ALAT NIP InterBank transfer to WADA MAHMOUD IBRAHIM via Providus Bank | Acc: 6508297483'),

-- #6 | Nov 5, 2025 16:49 | NGN 400,000 | OPay -> OPay
(5, 'CREDIT', 400000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-11-05 16:49:23+01',
 'OPay', '25110501010032497189454', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD IBRAHIM WADA | OPay: 906 657 5308'),

-- #7 | Nov 5, 2025 16:55 | NGN 100,000 | OPay -> OPay
(5, 'CREDIT', 100000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-11-05 16:55:36+01',
 'OPay', '25110501010032478876612', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD IBRAHIM WADA | OPay: 906 657 5308'),

-- #8 | Nov 11, 2025 23:18 | NGN 3,000,000 | ALAT -> Wema/ALAT
(5, 'CREDIT', 3000000.00,
 'SADIQ KABIR',
 'MAHMOUD WADA',
 '2025-11-11 23:18:00+01',
 'Wema/ALAT', '330873358546', 'SUCCESSFUL',
 'ALAT transfer to MAHMOUD WADA from SADIQ KABIR | Acc: 0252971026'),

-- #9 | Nov 18, 2025 | NGN 40,000,000 | ALAT -> ALAT (NIP)
(5, 'CREDIT', 40000000.00,
 'HAFIZ MOHAMMAD TAYYIB',
 'HAFIZ MOHAMMAD TAYYIB',
 '2025-11-18 01:50:00+01',
 'Wema/ALAT', '000013251118131205000554396149', 'SUCCESSFUL',
 'NIP transfer: HAFIZ MOHAMMAD TAYYIB to HAFIZ MOHAMMAD TAYYIB'),

-- #10 | Nov 30, 2025 13:34 | NGN 300,000 | OPay -> Monie Point
(5, 'CREDIT', 300000.00,
 'SADIQ MOHAMMAD KABIR',
 'HASSAN HUDU IBRAHIM',
 '2025-11-30 13:34:17+01',
 'Monie Point', '25113002010097225861552', 'SUCCESSFUL',
 'OPay transfer to HASSAN HUDU IBRAHIM via Monie Point | Acc: 9013936129'),

-- #11 | Dec 1, 2025 17:19 | NGN 1,000,000 | OPay -> OPay
(5, 'CREDIT', 1000000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-12-01 17:19:48+01',
 'OPay', '25120101010000548710060', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD IBRAHIM WADA | OPay: 906 657 5308'),

-- #12 | Dec 2, 2025 05:29 | NGN 2,000,000 | OPay -> OPay
(5, 'CREDIT', 2000000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-12-02 05:29:27+01',
 'OPay', '25120201010001687730', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD IBRAHIM WADA | OPay: 906 657 5308'),

-- #13 | Dec 2, 2025 05:33 | NGN 250,000 | OPay -> OPay
(5, 'CREDIT', 250000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD IBRAHIM WADA',
 '2025-12-02 05:33:58+01',
 'OPay', '25120201010001695247575', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD IBRAHIM WADA | OPay: 906 657 5308'),

-- #14 | Dec 8, 2025 13:04 | NGN 2,000,000 | OPay -> Wema Bank
(5, 'CREDIT', 2000000.00,
 'SADIQ MOHAMMAD KABIR',
 'MAHMOUD WADA',
 '2025-12-08 13:04:14+01',
 'Wema Bank', '25120802010019649027747', 'SUCCESSFUL',
 'OPay transfer to MAHMOUD WADA via Wema Bank PLC | Acc: 0252971026');

-- ============================================================
-- VERIFY:
-- Batch 2 row count should be 14
-- Batch 2 total amount should be 71,400,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 5
--   AND type = 'CREDIT'
--   AND transaction_date BETWEEN '2025-10-06 00:00:00+01' AND '2025-12-08 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 5;
-- ============================================================
