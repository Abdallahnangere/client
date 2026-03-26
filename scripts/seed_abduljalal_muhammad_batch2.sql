-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for ABDULJALAL MUHAMMAD (person_id = 9)
-- Transactions #21 -- #25  |  Oct 2025
-- All CREDIT transactions (incoming payments received)
-- Platform: OneBank (Sterling)
-- Sender: MUHAMMAD ABDULJALAL
-- Receiver: MAHMOUD IBRAHIM WADA
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(9, 'Abduljalal Muhammad', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #21 | Oct 9, 2025 01:22:00 | NGN 150,000.00
(9, 'CREDIT', 150000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-09 01:22:00+01',
 'OneBank (Sterling)', '000001251009132205404451161224', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #22 | Oct 9, 2025 12:09:00 | NGN 400,000.00
(9, 'CREDIT', 400000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-09 12:09:00+01',
 'OneBank (Sterling)', '000001251009120949631242485061', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #23 | Oct 9, 2025 19:35:00 | NGN 110,000.00
(9, 'CREDIT', 110000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-09 19:35:00+01',
 'OneBank (Sterling)', '000001251009193527357364866343', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #24 | Oct 14, 2025 05:49:00 | NGN 260,000.00
(9, 'CREDIT', 260000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-14 05:49:00+01',
 'OneBank (Sterling)', '000001251014054852303682538576', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308'),

-- #25 | Oct 19, 2025 08:44:00 | NGN 200,000.00
(9, 'CREDIT', 200000.00,
 'MUHAMMAD ABDULJALAL',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-19 08:44:00+01',
 'OneBank (Sterling)', '000001251019204433045574348376', 'SUCCESSFUL',
 'Transfer to OPAY DIGITAL SERVICES LIMITED - Account 9066575308');

-- ============================================================
-- VERIFY:
-- Batch 2 row count should be 5
-- Batch 2 total amount should be 1,120,000.00
-- Duplicate check: no duplicate reference_number found in this batch
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'CREDIT'
--   AND transaction_date BETWEEN '2025-10-09 00:00:00+01' AND '2025-10-19 23:59:59+01'
--   AND reference_number IN (
--     '000001251009132205404451161224',
--     '000001251009120949631242485061',
--     '000001251009193527357364866343',
--     '000001251014054852303682538576',
--     '000001251019204433045574348376'
--   );
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'CREDIT'
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
--
-- -- Combined totals for all batches
-- SELECT COUNT(*) AS total_transactions, COALESCE(SUM(amount), 0) AS total_credits
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'CREDIT';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 9;
-- ============================================================
