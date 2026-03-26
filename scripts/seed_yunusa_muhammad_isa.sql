-- ============================================================
-- Capital Management System
-- New Person: YUNUSA MUHAMMAD ISA
-- person_id = 7
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(7, 'Yunusa Muhammad Isa', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
-- SELECT * FROM persons WHERE id = 7;
-- ============================================================
