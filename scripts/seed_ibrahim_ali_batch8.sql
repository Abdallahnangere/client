-- ============================================================
-- Capital Management System
-- Transactions Batch 8 for IBRAHIM ALI YAMMUSA (person_id = 3)
-- Transactions #89 -- #107  |  Oct 2025 -- Dec 2025
-- All DEBIT
-- Sender: MAHMOUD IBRAHIM WADA (Wema Bank / OPay 906****308)
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #89 | Wema Bank (ALAT) | 15 Oct 2025 16:13
(3, 'DEBIT', 8710000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-15 16:13:00+01',
 'Wema Bank -> GTBank', '000017251015161349411179750761', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'),

-- #90 | Wema Bank (ALAT) | 22 Oct 2025 16:45
(3, 'DEBIT', 1065000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-22 16:45:00+01',
 'Wema Bank -> GTBank', '0000172510222164502772233910615', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'),

-- #91 | OPay | 25 Oct 2025 19:00:58
(3, 'DEBIT', 2020000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-25 19:00:58+01',
 'OPay -> GTBank', '251025020100056797408945', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251025180101143865609409'),

-- #92 | OPay | 28 Oct 2025 23:35:33
(3, 'DEBIT', 300000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-28 23:35:33+01',
 'OPay -> GTBank', '251028020100131751033534', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251028223537144081297635'),

-- #93 | OPay | 29 Oct 2025 22:18:26
(3, 'DEBIT', 700000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-29 22:18:26+01',
 'OPay -> GTBank', '251029020100155498769601', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251029211830144152674901'),

-- #94 | OPay | 30 Oct 2025 17:58:09
(3, 'DEBIT', 20000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-10-30 17:58:09+01',
 'OPay -> GTBank', '251030020100172817346797', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251030165815144203778240'),

-- #95 | OPay | Date UNKNOWN — success screen only, no receipt details
(3, 'DEBIT', 100010.00,
 'MAHMOUD IBRAHIM WADA',
 'UNKNOWN RECEIVER (UNCONFIRMED)',
 NULL,
 'OPay -> GTBank', NULL, 'SUCCESSFUL',
 'UNCONFIRMED: Date/recipient/reference missing. OPay transfer of NGN 100,010.00; only success screen provided.'),

-- #96 | OPay | Date UNKNOWN — success screen only, no receipt details
(3, 'DEBIT', 313000.00,
 'MAHMOUD IBRAHIM WADA',
 'UNKNOWN RECEIVER (UNCONFIRMED)',
 NULL,
 'OPay -> GTBank', NULL, 'SUCCESSFUL',
 'UNCONFIRMED: Date/recipient/reference missing. OPay transfer of NGN 313,000.00; only success screen provided.'),

-- #97 | Wema Bank (ALAT) | 04 Nov 2025 12:00
(3, 'DEBIT', 50000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-11-04 12:00:00+01',
 'Wema Bank -> GTBank', '000017251104120051904311247243', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'),

-- #98 | OPay | 05 Nov 2025 17:55:46 | Different receiver
(3, 'DEBIT', 146341.00,
 'MAHMOUD IBRAHIM WADA',
 'BUNKURE TEXTILES',
 '2025-11-05 17:55:46+01',
 'OPay -> FCMB', '251105020100326568079412', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Bunkure Textiles FCMB acc 1026165431. Session: 09FG251105175550058BQI0L2'),

-- #99 | OPay | Date UNKNOWN — success screen only, no receipt details
(3, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'UNKNOWN RECEIVER (UNCONFIRMED)',
 NULL,
 'OPay -> GTBank', NULL, 'SUCCESSFUL',
 'UNCONFIRMED: Date/recipient/reference missing. OPay transfer of NGN 100,000.00; only success screen provided.'),

-- #100 | Wema Bank (ALAT) | 07 Nov 2025 12:33 | Different receiver
(3, 'DEBIT', 7000000.00,
 'MAHMOUD WADA',
 'MUHAMMAD IBRAHIM JAZULI',
 '2025-11-07 12:33:00+01',
 'Wema Bank -> [Confirm Bank]', '000017251107123314084932870540', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Muhammad Ibrahim Jazuli acc 0531726726. Remark: ALAT NIP TRANSFER TO MUHAMMAD IBRAHIM JAZULI FROM MAHMOUD WADA'),

-- #101 | OPay | 14 Nov 2025 07:36:56
(3, 'DEBIT', 470000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-11-14 07:36:56+01',
 'OPay -> GTBank', '251114020100544316284083', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251114063659145265043224'),

-- #102 | OPay | 20 Nov 2025 22:25:39
(3, 'DEBIT', 460000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-11-20 22:25:39+01',
 'OPay -> GTBank', '251120020100719755310206', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251120212543145768477018'),

-- #103 | OPay | 21 Nov 2025 16:13:26
(3, 'DEBIT', 150000.00,
 'MAHMOUD IBRAHIM WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-11-21 16:13:26+01',
 'OPay -> GTBank', '251121020100735493637897', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251121151329145813692012'),

-- #104 | Wema Bank (ALAT) | 28 Nov 2025 20:18
(3, 'DEBIT', 360000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-11-28 20:18:00+01',
 'Wema Bank -> GTBank', '000017251128201833062944698902', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'),

-- #105 | OPay | 01 Dec 2025 19:20:55 | Different receiver
(3, 'DEBIT', 200000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUKHTAR ALI',
 '2025-12-01 19:20:55+01',
 'OPay -> OPay', '251201010100008952530861', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Mukhtar Ali OPay acc 7066533668.'),

-- #106 | Wema Bank (ALAT) | 02 Dec 2025 16:18
(3, 'DEBIT', 96000.00,
 'MAHMOUD WADA',
 'YAMMUSA IBRAHIM ALI',
 '2025-12-02 16:18:00+01',
 'Wema Bank -> GTBank', '000017251202161812003466997849', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'),

-- #107 | OPay | 08 Dec 2025 19:26:30 | Different receiver
(3, 'DEBIT', 50000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUKHTAR ALI',
 '2025-12-08 19:26:30+01',
 'OPay -> OPay', '251208010100207494020461', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Mukhtar Ali OPay acc 7066533668.');

-- ============================================================
-- VERIFY:
-- Batch 8 row count should be 19
-- Batch 8 total amount should be 22,370,351.00
--
-- SELECT COUNT(*) FROM transactions
-- WHERE person_id = 3
--   AND type = 'DEBIT'
--   AND note IN (
--     'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251025180101143865609409',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251028223537144081297635',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251029211830144152674901',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251030165815144203778240',
--     'UNCONFIRMED: Date/recipient/reference missing. OPay transfer of NGN 100,010.00; only success screen provided.',
--     'UNCONFIRMED: Date/recipient/reference missing. OPay transfer of NGN 313,000.00; only success screen provided.',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Bunkure Textiles FCMB acc 1026165431. Session: 09FG251105175550058BQI0L2',
--     'UNCONFIRMED: Date/recipient/reference missing. OPay transfer of NGN 100,000.00; only success screen provided.',
--     'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Muhammad Ibrahim Jazuli acc 0531726726. Remark: ALAT NIP TRANSFER TO MUHAMMAD IBRAHIM JAZULI FROM MAHMOUD WADA',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251114063659145265043224',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251120212543145768477018',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Session: 100004251121151329145813692012',
--     'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Mukhtar Ali OPay acc 7066533668.',
--     'Paid via Mahmoud Wada (Wema Bank / ALAT) -> Yammusa Ibrahim Ali GTBank acc 0453949612. Remark: ALAT NIP TRANSFER TO Yammusa Ibrahim Ali FROM MAHMOUD WADA'
--   );
--
-- SELECT COALESCE(SUM(amount), 0) FROM transactions
-- WHERE person_id = 3
--   AND type = 'DEBIT'
--   AND transaction_date >= '2025-10-15 00:00:00+01'
--   AND (transaction_date <= '2025-12-08 23:59:59+01' OR transaction_date IS NULL);
--
-- SELECT * FROM person_balance_summary WHERE person_id = 3;
--
-- ⚠️ Needs confirmation:
-- #95 (100,010), #96 (313,000), #99 (100,000): missing date/receiver/reference
-- #100 receiving bank for account 0531726726 is not yet confirmed
-- ============================================================
