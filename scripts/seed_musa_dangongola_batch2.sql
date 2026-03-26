-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for MUSA DANGONGOLA (person_id = 4)
-- Transactions #1 -- #20  |  Apr 2025 -- Jun 2025
-- All DEBIT
-- Sources: Kuda outward transfers
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(4, 'Musa Dangongola', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | 2025-04-08 | NGN 1,150,000
(4, 'DEBIT', 1150000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-04-08 09:53:00+01',
 'Kuda -> UBA', '090267250408095301940008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352'),

-- #2 | 2025-05-02 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-02 17:29:00+01',
 'Kuda -> UBA', '090267250502162906779008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhh'),

-- #3 | 2025-05-02 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-02 17:29:00+01',
 'Kuda -> UBA', '090267250502162931891008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: bbbbb'),

-- #4 | 2025-05-02 | NGN 550,000
(4, 'DEBIT', 550000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-02 17:30:00+01',
 'Kuda -> UBA', '090267250502163045838008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhh'),

-- #5 | 2025-05-02 | NGN 400,000
(4, 'DEBIT', 400000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-02 17:31:00+01',
 'Kuda -> UBA', '090267250502163129876008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hjjj'),

-- #6 | 2025-05-06 | NGN 500,000
(4, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-06 16:28:00+01',
 'Kuda -> UBA', '090267250506152855227008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: bbbb'),

-- #7 | 2025-05-16 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-16 16:27:00+01',
 'Kuda -> UBA', '090267250516152735924008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhh'),

-- #8 | 2025-05-16 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-16 16:27:00+01',
 'Kuda -> UBA', '090267250516152759194008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhhh'),

-- #9 | 2025-05-16 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-16 16:28:00+01',
 'Kuda -> UBA', '090267250516152830553008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhh'),

-- #10 | 2025-05-16 | NGN 1,700,000
(4, 'DEBIT', 1700000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-16 16:29:00+01',
 'Kuda -> UBA', '090267250516152903367008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: jhhj'),

-- #11 | 2025-05-19 | NGN 500,000
(4, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-19 09:41:00+01',
 'Kuda -> UBA', '090267250519084105096008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhh'),

-- #12 | 2025-05-27 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-27 17:07:00+01',
 'Kuda -> UBA', '090267250527160658848008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhhh'),

-- #13 | 2025-05-27 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-27 17:09:00+01',
 'Kuda -> UBA', '090267250527160951944008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhh'),

-- #14 | 2025-05-27 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-27 17:10:00+01',
 'Kuda -> UBA', '090267250527161010485008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhhh'),

-- #15 | 2025-05-27 | NGN 1,700,000
(4, 'DEBIT', 1700000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-27 17:12:00+01',
 'Kuda -> UBA', '090267250527161158720008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhh'),

-- #16 | 2025-05-30 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-30 17:25:00+01',
 'Kuda -> UBA', '090267250530162459170008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: hhhhhh'),

-- #17 | 2025-05-30 | NGN 200,000
(4, 'DEBIT', 200000.00,
 'MAHMOUD WADA',
 'MUSA ABDULLAHI DANGONGOLA',
 '2025-05-30 17:25:00+01',
 'Kuda -> UBA', '090267250530162513704008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Musa Abdullahi Dangongola, UBA acc 2192846352, Desc: nnbb'),

-- #18 | 2025-06-06 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-06 15:22:00+01',
 'Kuda -> Moniepoint', '090267250606142231626008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Mahir Building Materials, Moniepoint acc 8232141934'),

-- #19 | 2025-06-06 | NGN 2,000,000
(4, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-06 15:22:00+01',
 'Kuda -> Moniepoint', '090267250606142252789008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Mahir Building Materials, Moniepoint acc 8232141934'),

-- #20 | 2025-06-06 | NGN 1,000,000
(4, 'DEBIT', 1000000.00,
 'MAHMOUD WADA',
 'MAHIR BUILDING MATERIALS',
 '2025-06-06 15:23:00+01',
 'Kuda -> Moniepoint', '090267250606142307042008670535', 'SUCCESSFUL',
 'Kuda Outward Transfer to Mahir Building Materials, Moniepoint acc 8232141934');

-- ============================================================
-- VERIFY:
-- Batch 2 row count should be 20
-- Batch 2 total amount should be 29,700,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 4
--   AND type = 'DEBIT'
--   AND reference_number IN (
--     '090267250408095301940008670535',
--     '090267250502162906779008670535',
--     '090267250502162931891008670535',
--     '090267250502163045838008670535',
--     '090267250502163129876008670535',
--     '090267250506152855227008670535',
--     '090267250516152735924008670535',
--     '090267250516152759194008670535',
--     '090267250516152830553008670535',
--     '090267250516152903367008670535',
--     '090267250519084105096008670535',
--     '090267250527160658848008670535',
--     '090267250527160951944008670535',
--     '090267250527161010485008670535',
--     '090267250527161158720008670535',
--     '090267250530162459170008670535',
--     '090267250530162513704008670535',
--     '090267250606142231626008670535',
--     '090267250606142252789008670535',
--     '090267250606142307042008670535'
--   );
--
-- SELECT * FROM person_balance_summary WHERE person_id = 4;
-- ============================================================
