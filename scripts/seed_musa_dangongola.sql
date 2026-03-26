-- ============================================================
-- Capital Management System
-- New Person: MUSA DANGONGOLA (person_id = 4)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(4, 'Musa Dangongola', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- VERIFY:
-- SELECT * FROM persons WHERE id = 4;
-- ============================================================
