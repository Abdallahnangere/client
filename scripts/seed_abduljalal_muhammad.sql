-- ============================================================
-- Capital Management System
-- New Person: ABDULJALAL MUHAMMAD
-- person_id = 9
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(9, 'Abduljalal Muhammad', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
-- SELECT * FROM persons WHERE id = 9;
-- ============================================================
