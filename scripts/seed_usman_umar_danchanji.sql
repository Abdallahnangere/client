-- ============================================================
-- Capital Management System
-- New Person: USMAN UMAR DANCHANJI
-- person_id = 10
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(10, 'Usman Umar Danchanji', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
-- SELECT * FROM persons WHERE id = 10;
-- ============================================================
