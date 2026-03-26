-- ============================================================
-- Capital Management System
-- Person Setup for SADIQ MUHAMMAD KABIR
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(5, 'Sadiq Muhammad Kabir', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
--
-- SELECT * FROM persons WHERE id = 5;
-- ============================================================
