-- ============================================================
-- Capital Management System
-- Transactions Batch 6 for MUSA DANGONGOLA (person_id = 4)
-- Transactions #1 -- #14  |  Mar 2025 -- Jun 2025
-- All DEBIT
-- Sources: Kuda popup/chat records
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(4, 'Musa Dangongola', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Jun 04, 2025 18:22 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-04 18:22:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials - hhhhh'),

-- #2 | Jun 04, 2025 18:22 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-04 18:22:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials - hhhhh'),

-- #3 | Jun 04, 2025 18:22 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-04 18:22:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials - hhhhh'),

-- #4 | Jun 04, 2025 18:23 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-04 18:23:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials - hhhhh'),

-- #5 | Jun 06, 2025 15:22 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-06 15:22:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials - hhhhh'),

-- #6 | Jun 06, 2025 15:22 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-06 15:22:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials - hhhhh'),

-- #7 | Jun 06, 2025 18:23 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-06 18:23:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials - hhhhh'),

-- #8 | Jun 06, 2025 18:23 | NGN 500,000
(4, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-06 18:23:00+01',
 'Kuda -> Moniepoint', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Mahir Building Materials'),

-- #9 | Mar 09, 2025 14:32 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-03-09 14:32:00+01',
 'Kuda -> JAIZ Bank', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Musa Abdullahi Dangongola'),

-- #10 | Mar 10, 2025 11:49 | NGN 600,000
(4, 'DEBIT', 600000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-03-10 11:49:00+01',
 'Kuda -> JAIZ Bank', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Musa Abdullahi Dangongola'),

-- #11 | Mar 19, 2025 14:08 | NGN 600,000
(4, 'DEBIT', 600000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-03-19 14:08:00+01',
 'Kuda -> JAIZ Bank', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Musa Abdullahi Dangongola'),

-- #12 | Mar 20, 2025 15:36 | NGN 1,100,000
(4, 'DEBIT', 1100000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-03-20 15:36:00+01',
 'Kuda -> JAIZ Bank', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Musa Abdullahi Dangongola'),

-- #13 | Mar 21, 2025 14:27 | NGN 500,000
(4, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-03-21 14:27:00+01',
 'Kuda -> UBA', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Musa Abdullahi Dangongola, UBA'),

-- #14 | Mar 31, 2025 10:21 | NGN 500,000
(4, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-03-31 10:21:00+01',
 'Kuda -> JAIZ Bank', NULL, 'SUCCESSFUL',
 'Kuda Transfer to Musa Abdullahi Dangongola - hhhhh');

-- ============================================================
-- VERIFY:
-- Batch 6 row count should be 14
-- Batch 6 total amount should be 19,800,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 4
--   AND type = 'DEBIT'
--   AND transaction_date IN (
--     '2025-06-04 18:22:00+01',
--     '2025-06-04 18:23:00+01',
--     '2025-06-06 15:22:00+01',
--     '2025-06-06 18:23:00+01',
--     '2025-03-09 14:32:00+01',
--     '2025-03-10 11:49:00+01',
--     '2025-03-19 14:08:00+01',
--     '2025-03-20 15:36:00+01',
--     '2025-03-21 14:27:00+01',
--     '2025-03-31 10:21:00+01'
--   );
--
-- SELECT * FROM person_balance_summary WHERE person_id = 4;
-- ============================================================
