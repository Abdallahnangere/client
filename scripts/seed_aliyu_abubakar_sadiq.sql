-- ============================================================
-- Capital Management System
-- New Person: ALIYU ABUBAKAR SADIQ
-- person_id = 12
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(12, 'Aliyu Abubakar Sadiq', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
-- SELECT * FROM persons WHERE id = 12;
-- ============================================================
