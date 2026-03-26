-- ============================================================
-- Capital Management System
-- Transactions Batch 11 for IBRAHIM ALI YAMMUSA (person_id = 3)
-- Transactions #147 -- #158  |  Jun 2025 -- Sep 2025
-- All DEBIT
-- Sources: OPay, Wema Bank (ALAT)
-- ============================================================
-- ALSO RESOLVES TWO FLAGGED ITEMS FROM BATCH 10:
--   Batch 10 #142 (NGN 1,750,000 calculator) -> confirmed receipt is #148 (Wema, 11 Jun)
--   Batch 10 #143 (NGN 3,700,000 calculator) -> confirmed receipt is #154 (Wema, 16 Aug)
--     -> It IS a SEPARATE transaction from #138 (TAJBank 09 Aug)
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #147 | OPay | 03 Jun 2025 22:53:41
(3, 'DEBIT', 1400000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-06-03 22:53:41+01',
 'OPay -> GTBank', '250603020100064722109211', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004250603215358134067297074'),

-- #148 | Wema Bank (ALAT) | 11 Jun 2025 14:28 | Resolves Batch 10 #142
(3, 'DEBIT', 1750000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-06-11 14:28:00+01',
 'Wema Bank -> GTBank', '000017250611142802623972170722', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-Yammu money'),

-- #149 | Wema Bank (ALAT) | 18 Jun 2025 13:21
(3, 'DEBIT', 2100000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-06-18 13:21:00+01',
 'Wema Bank -> GTBank', '000017250618132133496045566774', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-'),

-- #150 | Wema Bank (ALAT) | 31 Jul 2025 08:27
(3, 'DEBIT', 5000000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-07-31 08:27:00+01',
 'Wema Bank -> GTBank', '000017250731082718216148392851', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO OTB-'),

-- #151 | Wema Bank (ALAT) | 31 Jul 2025 15:52 | Beneficiary: Unity Bank acc 0062521389
(3, 'DEBIT', 5000000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-07-31 15:52:00+01',
 'Wema Bank -> Unity Bank', '000017250731155211128078663037', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali Unity Bank acc 0062521389. Remark: ALAT NIP TRANSFER TO Unity Bank-'),

-- #152 | Wema Bank (ALAT) | 08 Aug 2025 07:53
(3, 'DEBIT', 4069204.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-08 07:53:00+01',
 'Wema Bank -> GTBank', '000017250808075331394453547373', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-yammu'),

-- #153 | Wema Bank (ALAT) | 15 Aug 2025 14:03
(3, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-15 14:03:00+01',
 'Wema Bank -> GTBank', '000017250815140346253957108149', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-'),

-- #154 | Wema Bank (ALAT) | 16 Aug 2025 12:44 | Resolves Batch 10 #143
-- Confirmed SEPARATE from #138 (TAJBank 09 Aug NGN 3,700,000)
(3, 'DEBIT', 3700000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-16 12:44:00+01',
 'Wema Bank -> GTBank', '0000172508161244455693017562129', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-'),

-- #155 | OPay | 30 Aug 2025 16:09:36
(3, 'DEBIT', 820000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-30 16:09:36+01',
 'OPay -> GTBank', '250830020100780663893552', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004250830150939140053308494'),

-- #156 | Wema Bank (ALAT) | 02 Sep 2025 09:22
(3, 'DEBIT', 222900.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-02 09:22:00+01',
 'Wema Bank -> GTBank', '000017250902092244683278665211', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-'),

-- #157 | OPay | 26 Sep 2025 10:16:26
(3, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-26 10:16:26+01',
 'OPay -> GTBank', '250926020100370635898533', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004250926091630141824058107'),

-- #158 | OPay | 30 Sep 2025 09:22:33 | Different receiver
(3, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'YUNUSA MUHAMMAD ISA',
 '2025-09-30 09:22:33+01',
 'OPay -> OPay', '250930180100459141999393', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yunusa Muhammad Isa OPay acc 8066117570. Different receiver — not Yammusa Ibrahim Ali.');

-- ============================================================
-- PATCH FOR BATCH 10 UNCONFIRMED ROWS:
-- Run these UPDATEs to resolve the calculator placeholders inserted earlier.
--
-- UPDATE transactions SET
--   transaction_date   = '2025-06-11 14:28:00+01',
--   bank               = 'Wema Bank -> GTBank',
--   reference_number   = '000017250611142802623972170722',
--   note               = 'Receipt confirmed (was Batch 10 #142). Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-Yammu money'
-- WHERE person_id = 3
--   AND amount = 1750000.00
--   AND bank = 'UNKNOWN (CALCULATOR SCREENSHOT)'
--   AND reference_number IS NULL;
--
-- UPDATE transactions SET
--   transaction_date   = '2025-08-16 12:44:00+01',
--   bank               = 'Wema Bank -> GTBank',
--   reference_number   = '0000172508161244455693017562129',
--   note               = 'Receipt confirmed (was Batch 10 #143). SEPARATE from #138 (TAJBank 09 Aug NGN 3,700,000). Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612.'
-- WHERE person_id = 3
--   AND amount = 3700000.00
--   AND bank = 'UNKNOWN (CALCULATOR SCREENSHOT)'
--   AND reference_number IS NULL;
-- ============================================================

-- ============================================================
-- FLAGGED ITEMS TO REVIEW:
-- 1) #151 — Sent to Yammusa Unity Bank acc 0062521389. Confirm this is Yammusa's account.
-- 2) #158 — Paid to YUNUSA MUHAMMAD ISA (OPay), not Yammusa. Confirm if person_id = 3
--           is correct or if this belongs to a different person.
-- ============================================================

-- VERIFY:
-- Batch 11 row count should be 12
-- Batch 11 total amount should be 25,162,104.00
--
-- SELECT COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 3
--   AND type = 'DEBIT'
--   AND reference_number IN (
--     '250603020100064722109211',
--     '000017250611142802623972170722',
--     '000017250618132133496045566774',
--     '000017250731082718216148392851',
--     '000017250731155211128078663037',
--     '000017250808075331394453547373',
--     '000017250815140346253957108149',
--     '0000172508161244455693017562129',
--     '250830020100780663893552',
--     '000017250902092244683278665211',
--     '250926020100370635898533',
--     '250930180100459141999393'
--   );
--
-- SELECT * FROM person_balance_summary WHERE person_id = 3;
-- ============================================================
