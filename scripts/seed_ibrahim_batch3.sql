-- ============================================================
-- Capital Management System
-- Transactions Batch 3 for IBRAHIM AHMAD BAKO (person_id = 2)
-- Transactions #21 -- #24  |  Sep -- Oct 2025
-- Paste into Neon SQL Editor and run
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- ── SEPTEMBER 2025 ───────────────────────────────────────────

-- #21 | TAJBank | 28 Sep 2025 14:02
(2, 'CREDIT', 10000000.00,
 'BASHIR BAKO IBRAHIM',
 'WADA MAHMOUD IBRAHIM',
 '2025-09-28 14:02:00+01',
 'TAJBank → Providus Bank', '0001927352809 2025140207', 'SUCCESSFUL',
 'Paid via Bashir Bako Ibrahim (TAJBank 000****913) → Wada Providus acc 6508297483. Narration: BIB. Session ID: 000026250928140054000168317823'),

-- ── OCTOBER 2025 ─────────────────────────────────────────────

-- #22 | Access Bank | 05 Oct 2025 16:16:50
(2, 'CREDIT', 10000000.00,
 'UMAR BAKO IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-05 16:16:50+01',
 'Access → JAIZ Bank', 'NXGETZ-09FG251005161522 11497EZRM', 'SUCCESSFUL',
 'Paid via Umar Bako Ibrahim (Access) → Wada JAIZ acc 0020820220'),

-- #23 | Access Bank | 05 Oct 2025 16:19:25
(2, 'CREDIT', 5000000.00,
 'UMAR BAKO IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-05 16:19:25+01',
 'Access → JAIZ Bank', 'NXGETZ-09FG251005161743762WFKVZX', 'SUCCESSFUL',
 'Paid via Umar Bako Ibrahim (Access) → Wada JAIZ acc 0020820220'),

-- #24 | TAJBank | 22 Oct 2025 13:13
(2, 'CREDIT', 14500000.00,
 'TASIU HARUNA MUSA',
 'MAHMOUD WADA',
 '2025-10-22 13:13:00+01',
 'TAJBank → Wema Bank', '00047738222102025131243', 'SUCCESSFUL',
 'Paid via Tasiu Haruna Musa (TAJBank 000****967) → Wada Wema acc 0252971026. Session ID: 000026251022131059000173127838');


-- ============================================================
-- VERIFY:
-- Total count for Ibrahim (should be 24):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 2;

-- Balance summary:
-- SELECT * FROM person_balance_summary WHERE person_id = 2;
-- ============================================================
