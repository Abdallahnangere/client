-- ============================================================
-- Capital Management System
-- Transactions Batch 4 for MUSA DANGONGOLA (person_id = 4)
-- Transactions #1 -- #20  |  Jun 2025 -- Sep 2025
-- All DEBIT
-- Sources: OPay, TAJ Bank, Moniepoint, ALAT (Wema), Wema Bank, Providus Bank
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(4, 'Musa Dangongola', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | 2025-06-08 | NGN 500,000 | OPay -> UBA
(4, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-06-08 10:46:07+01',
 'OPay -> UBA', '250608020100144458840878', 'SUCCESSFUL',
 'OPay Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Session: 100004250608094611134364462204'),

-- #2 | 2025-07-01 | NGN 2,200,000 | OPay -> Moniepoint
(4, 'DEBIT', 2200000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-07-01 18:04:41+01',
 'OPay -> Moniepoint', '250701020100561329074615', 'SUCCESSFUL',
 'OPay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 100004250701170458135898901638'),

-- #3 | 2025-07-29 | NGN 2,100,000 | OPay -> Moniepoint
(4, 'DEBIT', 2100000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-07-29 19:44:55+01',
 'OPay -> Moniepoint', '250729020100115297211421', 'SUCCESSFUL',
 'OPay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 100004250729184459137848435031'),

-- #4 | 2025-08-01 | NGN 3,000,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 3000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-01 09:59:00+01',
 'TAJ Bank -> Moniepoint', '00118980401082025095852', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250801095718000157286103'),

-- #5 | 2025-08-06 | NGN 2,200,000 | OPay -> Moniepoint
(4, 'DEBIT', 2200000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-06 13:25:22+01',
 'OPay -> Moniepoint', '250806020100276033175826', 'SUCCESSFUL',
 'OPay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 100004250806122526138412793701'),

-- #6 | 2025-08-07 | NGN 3,250,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 3250000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-07 17:53:00+01',
 'TAJ Bank -> Moniepoint', '00118980407082025175221', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250807175100000158539805'),

-- #7 | 2025-08-11 | NGN 2,000,000 | Moniepoint -> Moniepoint
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-11 11:00:17+01',
 'Moniepoint -> Moniepoint', '250811020100375640432521', 'SUCCESSFUL',
 'Moniepoint Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589'),

-- #8 | 2025-08-11 | NGN 1,250,000 | ALAT (Wema) -> Moniepoint
(4, 'DEBIT', 1250000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-11 11:12:00+01',
 'ALAT (Wema) -> Moniepoint', '000017250811111218554064995204', 'SUCCESSFUL',
 'ALAT NIP Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589'),

-- #9 | 2025-08-15 | NGN 10,000,000 | Jaiz Bank -> Moniepoint
(4, 'DEBIT', 10000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-15 19:44:46+01',
 'Jaiz Bank -> Moniepoint', 'JF265345149202432', 'SUCCESSFUL',
 'Jaiz Mobile Transfer to Zamzam Block Enterprises, Moniepoint acc (masked), Session: 000006250815194445881866663585'),

-- #10 | 2025-08-15 | NGN 6,250,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 6250000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-15 14:47:00+01',
 'TAJ Bank -> Moniepoint', '00118980415082025144646', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250815144500000159937448'),

-- #11 | 2025-08-15 | NGN 3,500,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 3500000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-15 14:51:00+01',
 'TAJ Bank -> Moniepoint', '00118980415082025145029', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250815144856000159938338'),

-- #12 | 2025-08-16 | NGN 10,000,000 | Jaiz Bank -> Moniepoint
(4, 'DEBIT', 10000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-16 14:21:12+01',
 'Jaiz Bank -> Moniepoint', 'JF546307833614336', 'SUCCESSFUL',
 'Jaiz Mobile Transfer to Zamzam Block Enterprises, Moniepoint acc (masked), Session: 000006250816142112076060043073'),

-- #13 | 2025-08-16 | NGN 10,000,000 | Jaiz Bank -> Moniepoint
(4, 'DEBIT', 10000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-16 18:25:50+01',
 'Jaiz Bank -> Moniepoint', 'JF607872050024448', 'SUCCESSFUL',
 'Jaiz Mobile Transfer to Zamzam Block Enterprises, Moniepoint acc 470*****89, Session: 000006250816182550974820225989'),

-- #14 | 2025-08-23 | NGN 2,500,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 2500000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-23 10:03:00+01',
 'TAJ Bank -> Moniepoint', '00118980423082025100326', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250823100115000161312532'),

-- #15 | 2025-08-25 | NGN 6,250,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 6250000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-25 15:04:00+01',
 'TAJ Bank -> Moniepoint', '00118980425082025150341', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250825150213000161707645'),

-- #16 | 2025-08-25 | NGN 6,250,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 6250000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-25 16:17:00+01',
 'TAJ Bank -> Moniepoint', '00118980425082025161724', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250825161535000161727325'),

-- #17 | 2025-08-29 | NGN 2,500,000 | ALAT (Wema) -> Moniepoint
(4, 'DEBIT', 2500000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-29 23:03:00+01',
 'ALAT (Wema) -> Moniepoint', '000017250829230337102905060956', 'SUCCESSFUL',
 'ALAT NIP Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589'),

-- #18 | 2025-08-29 | NGN 2,100,000 | ALAT (Wema) -> Moniepoint
(4, 'DEBIT', 2100000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-29 23:04:00+01',
 'ALAT (Wema) -> Moniepoint', '0000172508292304304218705061031', 'SUCCESSFUL',
 'ALAT NIP Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589'),

-- #19 | 2025-08-30 | NGN 10,000,000 | Wema Bank (ALAT) -> Moniepoint
(4, 'DEBIT', 10000000.00,
 'WADAHS MULTIPURPOSE CONCEPT',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-30 12:33:00+01',
 'Wema Bank -> Moniepoint', 'AFBSSST-90af33d0b7a64635a982532a84100340', 'SUCCESSFUL',
 'Wema Bank Transfer from Wadahs Multipurpose Concept to Zamzam Block Enterprises, Moniepoint acc 4707869589'),

-- #20 | 2025-09-26 | NGN 6,871,000 | Providus Bank -> Moniepoint
(4, 'DEBIT', 6871000.00,
 'WADA MAHMOUD IBRAHIM',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-09-26 16:35:21+01',
 'Providus Bank -> Moniepoint', '000023250926163521004174460673', 'SUCCESSFUL',
 'Providus Bank Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, From acc 6508***483');

-- ============================================================
-- VERIFY:
-- Batch 4 row count should be 20
-- Batch 4 total amount should be 92,721,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 4
--   AND type = 'DEBIT'
--   AND reference_number IN (
--     '250608020100144458840878',
--     '250701020100561329074615',
--     '250729020100115297211421',
--     '00118980401082025095852',
--     '250806020100276033175826',
--     '00118980407082025175221',
--     '250811020100375640432521',
--     '000017250811111218554064995204',
--     'JF265345149202432',
--     '00118980415082025144646',
--     '00118980415082025145029',
--     'JF546307833614336',
--     'JF607872050024448',
--     '00118980423082025100326',
--     '00118980425082025150341',
--     '00118980425082025161724',
--     '000017250829230337102905060956',
--     '0000172508292304304218705061031',
--     'AFBSSST-90af33d0b7a64635a982532a84100340',
--     '000023250926163521004174460673'
--   );
--
-- SELECT * FROM person_balance_summary WHERE person_id = 4;
-- ============================================================
