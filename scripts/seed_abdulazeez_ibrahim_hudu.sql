-- ============================================================
-- Capital Management System
-- Person Setup for ABDULAZEEZ IBRAHIM HUDU
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(6, 'Abdulazeez Ibrahim Hudu', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
--
-- SELECT * FROM persons WHERE id = 6;
-- ============================================================
