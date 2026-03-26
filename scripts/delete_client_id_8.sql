-- ============================================================
-- Capital Management System
-- Delete Client Script
-- Target: person_id = 8
-- ============================================================

BEGIN;

-- Preview current records for client id 8
SELECT * FROM persons WHERE id = 8;
SELECT COUNT(*) AS tx_count FROM transactions WHERE person_id = 8;

-- Delete the client.
-- NOTE: transactions are removed automatically via FK ON DELETE CASCADE.
DELETE FROM persons
WHERE id = 8;

-- Verify deletion
SELECT * FROM persons WHERE id = 8;
SELECT COUNT(*) AS tx_count_after FROM transactions WHERE person_id = 8;

COMMIT;

-- ============================================================
-- Optional rollback during testing:
-- ROLLBACK;
-- ============================================================
