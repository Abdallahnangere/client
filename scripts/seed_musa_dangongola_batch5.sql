-- ============================================================
-- Capital Management System
-- Transactions Batch 5 for MUSA DANGONGOLA (person_id = 4)
-- Transactions #1 -- #10  |  Apr 2025 -- Aug 2025
-- All DEBIT
-- Sources: OPay, ALAT (Wema), TAJ Bank
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(4, 'Musa Dangongola', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | 2025-04-25 | NGN 500,000 | OPay -> UBA
(4, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-04-25 17:24:54+01',
 'OPay -> UBA', '250425020100375587854419', 'SUCCESSFUL',
 'OPay Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Session: 100004250425162511131507850833'),

-- #2 | 2025-04-25 | NGN 1,850,000 | OPay -> UBA
(4, 'DEBIT', 1850000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-04-25 17:27:47+01',
 'OPay -> UBA', '250425020100375595639278', 'SUCCESSFUL',
 'OPay Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Session: 100004250425162819131508397014'),

-- #3 | 2025-06-03 | NGN 15,000,000 | ALAT (Wema) -> Moniepoint
(4, 'DEBIT', 15000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-03 14:04:00+01',
 'ALAT (Wema) -> Moniepoint', '000017250603140432517457046599', 'SUCCESSFUL',
 'ALAT Transfer IFO Mahir Building Materials, Remark: TRF IFO MAHIR BUILDING MATERIALS BO MAHMOUD WADA'),

-- #4 | 2025-07-04 | NGN 1,500,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 1500000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-07-04 19:42:00+01',
 'TAJ Bank -> Moniepoint', '00118980404072025194154', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250704194020000152450006'),

-- #5 | 2025-07-07 | NGN 1,500,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 1500000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-07-07 19:24:00+01',
 'TAJ Bank -> Moniepoint', '00118980407072025192416', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250707192302000152932424'),

-- #6 | 2025-07-08 | NGN 2,200,000 | OPay -> Moniepoint
(4, 'DEBIT', 2200000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-07-08 18:15:34+01',
 'OPay -> Moniepoint', '250708020100695536108372', 'SUCCESSFUL',
 'OPay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 100004250708171538136391204637'),

-- #7 | 2025-07-11 | NGN 20,000,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 20000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-07-11 18:21:00+01',
 'TAJ Bank -> Moniepoint', '00118980411072025182049', 'SUCCESSFUL',
 'TAJWay Transfer to Mahir Building Materials, Moniepoint acc 8232141934, Session: 000026250711181931000153663034'),

-- #8 | 2025-07-31 | NGN 2,250,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 2250000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-07-31 19:16:00+01',
 'TAJ Bank -> Moniepoint', '00118980431072025191552', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 00002625073119191426000157213871'),

-- #9 | 2025-08-02 | NGN 4,250,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 4250000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-02 17:23:00+01',
 'TAJ Bank -> Moniepoint', '00118980402082025172317', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250802172142000157594802'),

-- #10 | 2025-08-03 | NGN 1,000,000 | TAJ Bank -> Moniepoint
(4, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ZAMZAM BLOCK ENTERPRISES - ZAM ZAM ENTERPRISE',
 '2025-08-03 09:46:00+01',
 'TAJ Bank -> Moniepoint', '00118980403082025094625', 'SUCCESSFUL',
 'TAJWay Transfer to Zamzam Block Enterprises, Moniepoint acc 4707869589, Session: 000026250803094423000157679796');

-- ============================================================
-- VERIFY:
-- Batch 5 row count should be 10
-- Batch 5 total amount should be 50,050,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 4
--   AND type = 'DEBIT'
--   AND reference_number IN (
--     '250425020100375587854419',
--     '250425020100375595639278',
--     '000017250603140432517457046599',
--     '00118980404072025194154',
--     '00118980407072025192416',
--     '250708020100695536108372',
--     '00118980411072025182049',
--     '00118980431072025191552',
--     '00118980402082025172317',
--     '00118980403082025094625'
--   );
--
-- SELECT * FROM person_balance_summary WHERE person_id = 4;
-- ============================================================
