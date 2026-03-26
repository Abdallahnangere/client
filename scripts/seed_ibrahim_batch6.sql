-- ============================================================
-- Capital Management System
-- Transactions Batch 6 for IBRAHIM AHMAD BAKO (person_id = 2)
-- Transactions #65 -- #69  |  Oct -- Dec 2025
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #65 | ALAT/Wema | 20 Oct 2025 17:55
(2, 'DEBIT', 2286000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-10-20 17:55:00+01',
 'ALAT/Wema -> FirstBank', '000017251020175459988993018527', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO Ibrahim Ahmad Bako FROM MAHMOUD WADA'),

-- #66 | ALAT/Wema | 27 Oct 2025 (time not shown)
(2, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-10-27 00:00:00+01',
 'ALAT/Wema -> FirstBank', '000017251027201154943366339113', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO Ibrahim Ahmad Bako FROM MAHMOUD WADA'),

-- #67 | ALAT/Wema | 21 Nov 2025 20:55
(2, 'DEBIT', 1200000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-11-21 20:55:00+01',
 'ALAT/Wema -> FirstBank', '000017251121205509086829929942', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO Ibrahim Ahmad Bako FROM MAHMOUD WADA'),

-- #68 | ALAT/Wema | 28 Nov 2025 20:24
(2, 'DEBIT', 300000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-11-28 20:24:00+01',
 'ALAT/Wema -> FirstBank', '0000172511282020446099374702231', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO Ibrahim Ahmad Bako FROM MAHMOUD WADA'),

-- #69 | OPay | 01 Dec 2025 18:35:47
(2, 'DEBIT', 1400000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-12-01 18:35:47+01',
 'OPay -> FirstBank', '251201020100007494169785', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004251201173551146581160547');


-- ============================================================
-- VERIFY:
-- Total count for Ibrahim (should be 69):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 2;
-- SELECT * FROM person_balance_summary WHERE person_id = 2;
-- ============================================================
