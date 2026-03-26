-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for IBRAHIM ALI YAMMUSA (person_id = 3)
-- Transactions #129 -- #139  |  Aug -- Oct 2025
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- 129 | Jaiz -> Jaiz (Local) | 11 Aug 2025 12:12
(3, 'CREDIT', 8000000.00,
 'YUSUF IBRAHIM ADAM',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-11 12:12:10+01',
 'Jaiz Bank -> Jaiz Bank', 'JF701893016379392', 'SUCCESSFUL',
 'Receipt ID 129. Beneficiary acct: 0020820220. Source type: Local Transfer. Generated from Jaiz Mobile.'),

-- 130 | Jaiz -> Wema | 16 Aug 2025 13:21
(3, 'CREDIT', 8000000.00,
 'YUSUF IBRAHIM ADAM',
 'MAHMOUD WADA',
 '2025-08-16 13:21:15+01',
 'Jaiz Bank -> Wema Bank', 'JF531218044833792', 'SUCCESSFUL',
 'Receipt ID 130. Beneficiary acct: 0252971026. Source type: NIBSS Instant Payment. Generated from Jaiz Mobile.'),

-- 131 | Access -> Wema | 17 Aug 2025 22:42
(3, 'CREDIT', 1000000.00,
 'IBRAHM ALI YAMMUSA',
 'MAHMOUD WADA',
 '2025-08-17 22:42:50+01',
 'Access Bank -> Wema Bank', 'NXG000014250817224236278602395126', 'SUCCESSFUL',
 'Receipt ID 131. Beneficiary acct: 0252971026. Source type: INTER-BANK.'),

-- 132 | Ecobank -> Wema | 18 Aug 2025 01:50
(3, 'CREDIT', 1000000.00,
 'IBRAHIM YAMMUSA',
 'MAHMOUD WADA',
 '2025-08-18 01:50:00+01',
 'Ecobank -> Wema Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 132. Beneficiary acct: 0252971026. Source type: Other-Local-Banks. Narration: H'),

-- 133 | Zenith -> Ecobank | 18 Aug 2025 15:13
(3, 'CREDIT', 6000000.00,
 'HASSAN KABIR SHARIFAWA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-18 15:13:21+01',
 'Zenith Bank -> Ecobank', NULL, 'SUCCESSFUL',
 'Receipt ID 133. Beneficiary acct: 0110060083. Source type: Inter-Bank Transfer. Narration: I b'),

-- 134 | Ecobank -> Wema | 19 Aug 2025 05:55
(3, 'CREDIT', 1000000.00,
 'IBRAHIM YAMMUSA',
 'MAHMOUD WADA',
 '2025-08-19 05:55:00+01',
 'Ecobank -> Wema Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 134. Beneficiary acct: 0252971026. Source type: Other-Local-Banks. Narration: G'),

-- 135 | Ecobank -> Wema (SMS) | 19 Aug 2025 15:37
(3, 'CREDIT', 1500000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD WADA',
 '2025-08-19 15:37:00+01',
 'Ecobank -> Wema Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 135. Beneficiary acct: 0252971026. Source type: NIBSS Instant Payment. Evidence: Ecobank SMS debit alert.'),

-- 136 | UBA -> Jaiz | undated
(3, 'CREDIT', 1000000.00,
 'UNKNOWN',
 'MAHMOUD IBRAHIM WADA',
 NULL,
 'UBA -> Jaiz Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 136. Beneficiary acct: 0020820220. Source type: INTER-BANK. Date not visible on receipt.'),

-- 137 | Jaiz -> Taj | 25 Aug 2025 15:39
(3, 'CREDIT', 18180000.00,
 'YUSUF IBRAHIM ADAM',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-25 15:39:15+01',
 'Jaiz Bank -> Taj Bank', 'JF827439178113024', 'SUCCESSFUL',
 'Receipt ID 137. Beneficiary acct: 0012036999. Source type: NIBSS Instant Payment. Generated from Jaiz Mobile.'),

-- 138 | Jaiz -> Taj | 25 Aug 2025 23:19
(3, 'CREDIT', 1820000.00,
 'YUSUF IBRAHIM ADAM',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-25 23:19:38+01',
 'Jaiz Bank -> Taj Bank', 'JF943299058257920', 'SUCCESSFUL',
 'Receipt ID 138. Beneficiary acct: 0012036999. Source type: NIBSS Instant Payment. Generated from Jaiz Mobile.'),

-- 139 | Ecobank -> Taj | 05 Oct 2025 13:39
(3, 'CREDIT', 950000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-05 13:39:00+01',
 'Ecobank -> Taj Bank', '2527801230722', 'SUCCESSFUL',
 'Receipt ID 139. Beneficiary acct: 0012036999. Source type: Other-Local-Banks.');

-- ============================================================
-- VERIFY:
-- Batch 2 count for Ibrahim Ali Yammusa (should be 11):
-- SELECT COUNT(*) FROM transactions
-- WHERE person_id = 3
--   AND note LIKE 'Receipt ID 1[23]_.%';
--
-- Batch 2 total amount (should be 48,450,000.00):
-- SELECT COALESCE(SUM(amount), 0) FROM transactions
-- WHERE person_id = 3
--   AND note ~ 'Receipt ID 1(2[9]|3[0-9])\.';
--
-- Running total for person_id = 3:
-- SELECT COUNT(*) FROM transactions WHERE person_id = 3;
-- SELECT * FROM person_balance_summary WHERE person_id = 3;
-- ============================================================
