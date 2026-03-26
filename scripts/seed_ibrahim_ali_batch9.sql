-- ============================================================
-- Capital Management System
-- Transactions Batch 9 for IBRAHIM ALI YAMMUSA (person_id = 3)
-- Transactions #108 -- #126  |  Aug 2025 -- Oct 2025
-- All DEBIT (Mahmoud -> Yammusa)
-- Sources: TAJBank, Wema Bank (ALAT), Providus Bank, OPay, GTBank (GetriPay)
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #108 | TAJBank | 25 Aug 2025 16:33
(3, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-25 16:33:00+01',
 'TAJBank -> GTBank', '00118980425082025163245', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250825163056000161731783'),

-- #109 | Wema Bank | 30 Aug 2025 00:00 | Business account sender
(3, 'DEBIT', 4000000.00,
 'WADAHS MULTIPURPOSE CONCEPT',
 'YAMMUSA IBRAHIM ALI',
 '2025-08-30 00:00:00+01',
 'Wema Bank -> GTBank', 'S93378035', 'SUCCESSFUL',
 'Paid via Wadahs Multipurpose Concept (Wema Bank) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Purpose: MOBILE TRANSFER TO GTB-'),

-- #110 | TAJBank | 06 Sep 2025 20:16
(3, 'DEBIT', 2820000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-06 20:16:00+01',
 'TAJBank -> GTBank', '00118980406092025201546', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250906201354000164188495'),

-- #111 | Wema Bank (ALAT) | 07 Sep 2025 08:18
(3, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-07 08:18:00+01',
 'Wema Bank -> GTBank', '000017250907081839773679349154', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO GTB-hhh'),

-- #112 | TAJBank | 08 Sep 2025 18:05
(3, 'DEBIT', 7178397.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-08 18:05:00+01',
 'TAJBank -> GTBank', '00118980408092025180456', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250908180300000164512532'),

-- #113 | TAJBank | 09 Sep 2025 08:52
(3, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-09 08:52:00+01',
 'TAJBank -> GTBank', '00118980409092025085245', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250909085021000164586640'),

-- #114 | TAJBank | 09 Sep 2025 09:24 | Different beneficiary bank
(3, 'DEBIT', 625264.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-09 09:24:00+01',
 'TAJBank -> Ecobank', '00118980409092025092404', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali Ecobank acc 3660065247. Session: 000026250909092208000164591458'),

-- #115 | TAJBank | 16 Sep 2025 16:25
(3, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-16 16:25:00+01',
 'TAJBank -> GTBank', '00118980416092025162448', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250916162406000166049085'),

-- #116 | TAJBank | 18 Sep 2025 16:30
(3, 'DEBIT', 4642000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-18 16:30:00+01',
 'TAJBank -> GTBank', '00118980418092025162936', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250918162833000166445748'),

-- #117 | TAJBank | 19 Sep 2025 15:50
(3, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-19 15:50:00+01',
 'TAJBank -> GTBank', '00118980419092025154937', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 000026250919154827000166632729'),

-- #118 | Wema Bank (ALAT) | 24 Sep 2025 20:25
(3, 'DEBIT', 5000000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-24 20:25:00+01',
 'Wema Bank -> GTBank', '000017250924202544496168688592', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'),

-- #119 | Providus Bank | 26 Sep 2025 17:13:05
(3, 'DEBIT', 9336933.00,
 'WADA MAHMOUD IBRAHIM',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-26 17:13:05+01',
 'Providus Bank -> GTBank', '000023250926171305004174466025', 'SUCCESSFUL',
 'Paid via Wada Mahmoud Ibrahim (Providus Bank 6508***483) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Narration: Hhhh'),

-- #120 | OPay | 26 Sep 2025 19:20:14
(3, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-26 19:20:14+01',
 'OPay -> GTBank', '250926020100383123830269', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004250926182017141866729592'),

-- #121 | GTBank (GetriPay) | 26 Sep 2025 19:37:31 | Sender blank on receipt
(3, 'DEBIT', 2000000.00,
 'UNKNOWN SENDER (GETRIPAY RECEIPT)',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-26 19:37:31+01',
 'GTBank -> GTBank', 'GTP2857201758911850968', 'SUCCESSFUL',
 'Paid via GTBank PLC (GetriPay) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Narration: Good. Sender name not shown on receipt.'),

-- #122 | Providus Bank | 27 Sep 2025 22:54:14
(3, 'DEBIT', 4000000.00,
 'WADA MAHMOUD IBRAHIM',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-27 22:54:14+01',
 'Providus Bank -> GTBank', '000023250927225414004174627970', 'SUCCESSFUL',
 'Paid via Wada Mahmoud Ibrahim (Providus Bank 6508***483) -> Yammusa Ibrahim Ali GTBank acc 0453949612.'),

-- #123 | Providus Bank | 28 Sep 2025 12:29:07
(3, 'DEBIT', 1000000.00,
 'WADA MAHMOUD IBRAHIM',
 'YAMMUSA IBRAHIM ALI',
 '2025-09-28 12:29:07+01',
 'Providus Bank -> GTBank', '000023250928122907004174672353', 'SUCCESSFUL',
 'Paid via Wada Mahmoud Ibrahim (Providus Bank 6508***483) -> Yammusa Ibrahim Ali GTBank acc 0453949612.'),

-- #124 | Wema Bank (ALAT) | 08 Oct 2025 19:21
(3, 'DEBIT', 600000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-08 19:21:00+01',
 'Wema Bank -> GTBank', '000017251008192124755086606809', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'),

-- #125 | OPay | 09 Oct 2025 18:37:03
(3, 'DEBIT', 400000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-09 18:37:03+01',
 'OPay -> GTBank', '251009020100685815183939', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251009173706142764244583'),

-- #126 | Wema Bank (ALAT) | 11 Oct 2025 23:56
(3, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-11 23:56:00+01',
 'Wema Bank -> GTBank', '000017251011235604836988130852', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA');

-- ============================================================
-- FLAGGED ITEMS TO REVIEW:
-- 1) #109 sender is WADAHS MULTIPURPOSE CONCEPT (business account)
-- 2) #114 beneficiary bank is Ecobank acct 3660065247 (different from usual GTBank)
-- 3) #121 sender name missing on receipt; inserted as UNKNOWN SENDER (GETRIPAY RECEIPT)
-- 4) 18 Aug 2025 SMS credit to Mahmoud TAJBank was not inserted (incoming to Mahmoud, not payment to Yammusa)
-- ============================================================

-- VERIFY:
-- Batch 9 row count should be 19
-- Batch 9 total amount should be 59,102,594.00
--
-- SELECT COUNT(*) FROM transactions
-- WHERE person_id = 3
--   AND type = 'DEBIT'
--   AND note LIKE 'Paid via %';
--
-- SELECT COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 3
--   AND type = 'DEBIT'
--   AND transaction_date >= '2025-08-25 00:00:00+01'
--   AND transaction_date <= '2025-10-11 23:59:59+01';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 3;
-- ============================================================
