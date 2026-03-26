-- ============================================================
-- Capital Management System
-- Transactions Batch 3 for ABDULAZEEZ IBRAHIM HUDU (person_id = 6)
-- Transactions #1 -- #5  |  Nov 2025 -- Dec 2025
-- All DEBIT transactions (outgoing payments)
-- Platform: ALAT by Wema
-- Sender: MAHMOUD WADA
-- Receiver: ABDULAZEEZ IBRAHIM HUDU (Account: 0007584790)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(6, 'Abdulazeez Ibrahim Hudu', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Nov 2, 2025 18:45:00 | NGN 250,000.00
(6, 'DEBIT', 250000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-11-02 18:45:00+01',
 'ALAT by Wema', '000017251102184502229899414775', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Abdulazeez Ibrahim Hudu FROM MAHMOUD WADA'),

-- #2 | Nov 19, 2025 08:26:00 | NGN 500,000.00
(6, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-11-19 08:26:00+01',
 'ALAT by Wema', '000017251119082614717088526510', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Abdulazeez Ibrahim Hudu FROM MAHMOUD WADA'),

-- #3 | Nov 25, 2025 12:00:00 | NGN 200,000.00
(6, 'DEBIT', 200000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-11-25 12:00:00+01',
 'ALAT by Wema', '000017251125164328482832715895', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Abdulazeez Ibrahim Hudu FROM MAHMOUD WADA'),

-- #4 | Dec 1, 2025 13:13:00 | NGN 6,270,000.00
(6, 'DEBIT', 6270000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-12-01 13:13:00+01',
 'ALAT by Wema', '000017251201131334084356194347', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO ABDULAZEEZ IBRAHIM HUDU FROM MAHMOUD WADA'),

-- #5 | Dec 15, 2025 09:28:00 | NGN 400,010.00
(6, 'DEBIT', 400010.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-12-15 09:28:00+01',
 'ALAT by Wema', 'ALAT-TRANSFER-202512150928', 'SUCCESSFUL',
 'Transfer successful - Recent payment to Abdulazeez Ibrahim Hudu');

-- ============================================================
-- VERIFY:
-- Batch 3 row count should be 5
-- Batch 3 total amount should be 7,620,010.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 6
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2025-11-02 00:00:00+01' AND '2025-12-15 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 6;
-- ============================================================
