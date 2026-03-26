-- ============================================================
-- Capital Management System
-- New Person: ALMUJTABA MUHAMMAD AYAGI
-- person_id = 11
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(11, 'Almujtaba Muhammad Ayagi', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
-- SELECT * FROM persons WHERE id = 11;
-- ============================================================
