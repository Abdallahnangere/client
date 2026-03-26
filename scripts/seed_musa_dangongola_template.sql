-- ============================================================
-- Capital Management System
-- Transactions Template for MUSA DANGONGOLA (person_id = 4)
-- ============================================================
-- INSTRUCTIONS:
-- 1. Replace <<BATCH_NUMBER>> with 1, 2, 3, etc.
-- 2. For each transaction, fill in:
--    - amount: NGN value (numeric, no comma)
--    - sender: Name of person/business sending money
--    - receiver: Name of person/business receiving money (usually "MUSA DANGONGOLA")
--    - transaction_date: YYYY-MM-DD HH:MM:SS+01 (use +01 for Nigeria time)
--    - bank: Source/destination bank or channel (e.g., "OPay", "Wema Bank -> GTBank")
--    - reference_number: Receipt/transaction reference from the receipt
--    - status: 'SUCCESSFUL' or 'PENDING' or 'FAILED'
--    - note: Brief description from receipt (include receipt #, account numbers, etc.)
-- 3. Type is automatically 'DEBIT' for outflows or 'CREDIT' for inflows
-- 4. Delete example rows and add your own data
-- ============================================================

-- EXAMPLE: CREDIT transaction (money received by fund)
-- INSERT INTO transactions
--     (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
-- VALUES
-- (4, 'CREDIT', 5000000.00,
--  'MUSA DANGONGOLA',
--  'FUND ACCOUNT',
--  '2025-06-10 14:30:00+01',
--  'GTBank', '123456789', 'SUCCESSFUL',
--  'Receipt #001: Musa Dangongola deposit via GTBank acc 0056789123');

-- EXAMPLE: DEBIT transaction (money paid out by fund)
-- INSERT INTO transactions
--     (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
-- VALUES
-- (4, 'DEBIT', 2500000.00,
--  'MUSA DANGONGOLA',
--  'RECIPIENT NAME',
--  '2025-07-15 09:45:00+01',
--  'OPay -> GTBank', '987654321', 'SUCCESSFUL',
--  'Receipt #002: Musa Dangongola paid RECIPIENT NAME via OPay, GTBank acc 0056789123');

-- ============================================================
-- START FILLING IN YOUR DATA BELOW:
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | <<DATE>> | <<AMOUNT>>
-- (4, '<<TYPE>>', <<AMOUNT>>,
--  '<<SENDER_NAME>>',
--  '<<RECEIVER_NAME>>',
--  '<<YYYY-MM-DD HH:MM:SS+01>>',
--  '<<BANK>>', '<<REFERENCE_NUMBER>>', '<<STATUS>>',
--  '<<NOTE>>'),

;

-- ============================================================
-- VERIFY:
-- SELECT COUNT(*), SUM(amount) FROM transactions WHERE person_id = 4;
-- SELECT * FROM person_balance_summary WHERE person_id = 4;
-- ============================================================
