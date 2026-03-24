-- ============================================================
-- Capital Management System
-- New Person: IBRAHIM AHMAD BAKO
-- Run in Neon SQL Editor
-- ============================================================

-- Fix sequence if it is out of sync with existing rows
SELECT setval('persons_id_seq', COALESCE((SELECT MAX(id) FROM persons), 0), true);

-- Insert only if not already present (safe to re-run)
INSERT INTO persons (full_name, notes)
SELECT 'IBRAHIM AHMAD BAKO', NULL
WHERE NOT EXISTS (
    SELECT 1 FROM persons WHERE full_name = 'IBRAHIM AHMAD BAKO'
);

-- ============================================================
-- VERIFY:
-- SELECT * FROM persons ORDER BY id;
-- ============================================================
