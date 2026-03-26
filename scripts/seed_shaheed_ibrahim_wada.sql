-- Seed script for new person: Shaheed Ibrahim Wada
-- person_id: 13 (update if this conflicts with existing IDs)

INSERT INTO persons (id, full_name)
VALUES (13, 'Shaheed Ibrahim Wada')
ON CONFLICT (id) DO NOTHING;

-- VERIFY: Confirm person was inserted
SELECT * FROM persons WHERE id = 13;
