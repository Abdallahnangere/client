-- ============================================================
-- Capital Management System
-- Transactions Batch 10 for IBRAHIM ALI YAMMUSA (person_id = 3)
-- Transactions #127 -- #146  |  May 2025 -- Sep 2025
-- All DEBIT
-- Sources: Kuda, TAJBank, Jaiz Bank, Wema Bank (ALAT), SMS, Calculator
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #127 | Kuda | 27 May 2025 10:42
(3, 'DEBIT', 400000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-05-27 10:42:00+01',
 'Kuda -> GTBank', '090267250527094221565008670535', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Kuda 2008670535) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Description: yammu money'),

-- #128 | Kuda | 27 Jun 2025 15:24
(3, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-06-27 15:24:00+01',
 'Kuda -> GTBank', '090267250627142451662008670535', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Kuda 2008670535) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Description: hhhhh. Fee: NGN 10.00'),

-- #129 | Kuda | 27 Jun 2025 15:25
(3, 'DEBIT', 1000000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-06-27 15:25:00+01',
 'Kuda -> GTBank', '090267250627142509573008670535', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Kuda 2008670535) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Description: hhhh. Fee: NGN 10.00'),

-- #130 | Kuda | 28 Jun 2025 05:23
(3, 'DEBIT', 700000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-06-28 05:23:00+01',
 'Kuda -> GTBank', '090267250628042340704008670535', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Kuda 2008670535) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Description: hhhh. Fee: NGN 10.00'),

-- #131 | TAJBank | 05 Jul 2025 12:16
(3, 'DEBIT', 3000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-07-05 12:16:00+01',
 'TAJBank -> GTBank', '00118980405072025121541', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250705121432000152529702'),

-- #132 | Kuda | 06 Jul 2025 09:28
(3, 'DEBIT', 700000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-07-06 09:28:00+01',
 'Kuda -> GTBank', '090267250706082851776008670535', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Kuda 2008670535) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Description: hhhh. Fee: NGN 0.00'),

-- #133 | TAJBank | 12 Jul 2025 11:51 | Beneficiary: Access Bank acc 0795562859
(3, 'DEBIT', 3000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHM ALI YAMMUSA',
 '2025-07-12 11:51:00+01',
 'TAJBank -> Access Bank', 'STAJJNG25071254842956', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahm Ali Yammusa Access Bank acc 0795562859. Session: 000026250712114925000153763533. Narration: NIP/NIP/IBRAHM ALI YAM/Interbank/T'),

-- #134 | Kuda | 13 Jul 2025 10:23 | Beneficiary: Access Bank acc 0795562859
(3, 'DEBIT', 700000.00,
 'MAHMOUD WADA',
 'IBRAHM ALI YAMMUSA',
 '2025-07-13 10:23:00+01',
 'Kuda -> Access Bank', '090267250713092312910008670535', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Kuda 2008670535) -> Ibrahm Ali Yammusa Access Bank acc 0795562859. Description: hhhhh. Fee: NGN 0.00'),

-- #135 | Jaiz Bank | 01 Aug 2025 14:08:59 | Beneficiary: Access Bank acc 079*****59
(3, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHM ALI YAMMUSA',
 '2025-08-01 14:08:59+01',
 'Jaiz Bank -> Access Bank', 'JF107414325874688', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (Jaiz Bank 002*****20) -> Ibrahm Ali Yammusa Access Bank acc 079*****59. Session: 000006250801140859608633946883'),

-- #136 | TAJBank | 02 Aug 2025 14:23
(3, 'DEBIT', 2700000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-02 14:23:00+01',
 'TAJBank -> GTBank', 'STAJJNG25080260742475', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250802142100000157553853. Narration: NIP/NIP/YAMMUSA IBRAHI/Interbank/T'),

-- #137 | TAJBank | 03 Aug 2025 09:47
(3, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-03 09:47:00+01',
 'TAJBank -> GTBank', '00118980403082025094708', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250803094538000157679964'),

-- #138 | TAJBank | 09 Aug 2025 14:29
(3, 'DEBIT', 3700000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-09 14:29:00+01',
 'TAJBank -> GTBank', 'STAJJNG25080963199629', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250809142708000158862279. Narration: NIP/NIP/YAMMUSA IBRAHI/Interbank/T'),

-- #139 | Wema Bank (ALAT) | 15 Aug 2025 19:16 | Beneficiary: Ecobank acc 3660065247
(3, 'DEBIT', 5470383.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-15 19:16:00+01',
 'Wema Bank -> Ecobank', '000017250815191641111637295410', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali Ecobank acc 3660065247. Remark: ALAT NIP TRANSFER TO Ecobank-'),

-- #140 | Wema Bank (ALAT) | 15 Aug 2025 20:14 | Beneficiary: Ecobank acc 3660065247
(3, 'DEBIT', 10000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-15 20:14:00+01',
 'Wema Bank -> Ecobank', '000017250815201406036017327884', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali Ecobank acc 3660065247. Remark: ALAT NIP TRANSFER TO Ecobank-'),

-- #141 | TAJBank (SMS Alert) | 18 Aug 2025 13:20:52 | Yammusa paid Mahmoud
(3, 'DEBIT', 1000000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-18 13:20:52+01',
 'Unknown -> TAJBank', NULL, 'SUCCESSFUL',
 'SMS alert: Credit of NGN 1,000,000 to Mahmoud Ibrahim Wada TAJBank acc ******999 on 18-AUG-2025 13:20:52. Session desc: 10000425081523215113914788068. No formal receipt; SMS credit alert only. Sender bank unknown.'),

-- #142 | Calculator Screenshot | Date UNKNOWN
(3, 'DEBIT', 1750000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 NULL,
 'UNKNOWN (CALCULATOR SCREENSHOT)', NULL, 'SUCCESSFUL',
 'UNCONFIRMED: No formal receipt. Derived from calculator screenshot: 1,400,000 + 280,000 + 70,000 = NGN 1,750,000. Date, bank, and reference unknown.'),

-- #143 | Calculator Screenshot | Date UNKNOWN
-- ⚠️  Confirm if SEPARATE transaction from #138 (TAJBank 09 Aug NGN 3,700,000)
(3, 'DEBIT', 3700000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 NULL,
 'UNKNOWN (CALCULATOR SCREENSHOT)', NULL, 'SUCCESSFUL',
 'UNCONFIRMED: No formal receipt. Derived from calculator screenshot: 2,800,000 + 300,000 x 3 = NGN 3,700,000. Confirm if SEPARATE transaction from #138 (TAJBank 09 Aug NGN 3,700,000) or same — DELETE if duplicate.'),

-- #144 | Wema Bank (ALAT) | 23 Aug 2025 15:06
(3, 'DEBIT', 4820000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-23 15:06:00+01',
 'Wema Bank -> GTBank', '000017250823150650206121903802', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-'),

-- #145 | Wema Bank (ALAT) | 25 Aug 2025 14:13
(3, 'DEBIT', 7181180.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-25 14:13:00+01',
 'Wema Bank -> GTBank', '000017250825141342160052703649', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-'),

-- #146 | Kuda | 20 Sep 2025 20:42
(3, 'DEBIT', 1880000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-20 20:42:00+01',
 'Kuda -> GTBank', '090267250920194232406008670535', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Kuda 2008670535) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Description: bnbbb. Fee: NGN 0.00');

-- ============================================================
-- FLAGGED ITEMS TO REVIEW:
-- 1) #133, #134, #135 — Sent to Yammusa Access Bank acc 0795562859 (not usual GTBank)
-- 2) #139, #140 — Sent to Yammusa Ecobank acc 3660065247 (not usual GTBank)
-- 3) #141 — Yammusa paid Mahmoud (reverse direction). Sender bank unknown; SMS only.
-- 4) #142 — ₦1,750,000 calculator screenshot; no receipt/date/bank. Provide receipt.
-- 5) #143 — ₦3,700,000 calculator screenshot; amount matches #138. Confirm if separate or DUPLICATE — delete if same.
-- ============================================================

-- VERIFY:
-- Batch 10 row count should be 20
-- Batch 10 total amount (including unconfirmed) should be 45,811,563.00
--
-- SELECT COUNT(*) FROM transactions
-- WHERE person_id = 3
--   AND type = 'DEBIT'
--   AND note LIKE '%Kuda%'
--      OR note LIKE '%TAJBank%'
--      OR note LIKE '%CALCULATOR SCREENSHOT%'
--      OR note LIKE '%SMS alert%';
--
-- SELECT COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 3
--   AND type = 'DEBIT'
--   AND (
--     (transaction_date >= '2025-05-27 00:00:00+01' AND transaction_date <= '2025-09-20 23:59:59+01')
--     OR transaction_date IS NULL
--   );
--
-- SELECT * FROM person_balance_summary WHERE person_id = 3;
-- ============================================================
