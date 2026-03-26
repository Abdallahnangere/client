-- ============================================================
-- Capital Management System
-- Transactions Batch 4 for IBRAHIM AHMAD BAKO (person_id = 2)
-- Transactions #25 -- #44  |  Aug -- Oct 2025
-- All DEBIT: Mahmoud Wada -> Ibrahim Ahmad Bako
-- Paste into Neon SQL Editor and run
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- -- AUGUST 2025 -------------------------------------------------

-- #25 | OPay | 02 Aug 2025 15:09:47
(2, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-02 15:09:47+01',
 'OPay -> FirstBank', '250802020100195298317242', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250802140956138131542787'),

-- #26 | ALAT/Wema | 03 Aug 2025 23:38
(2, 'DEBIT', 400000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-03 23:38:00+01',
 'ALAT/Wema -> FirstBank', '000017250803233804926051433302', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-'),

-- #27 | TAJBank | 08 Aug 2025
(2, 'DEBIT', 825709.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-08 00:00:00+01',
 'TAJBank -> FirstBank', 'STAJJNG25080862876366', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank) -> Ibrahim Ahmad Bako FirstBank acc 313****466. Time not visible on receipt'),

-- #28 | OPay | 12 Aug 2025 08:09:02
(2, 'DEBIT', 1447000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-12 08:09:02+01',
 'OPay -> FirstBank', '250812020100393242243679', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250812070905138827475911'),

-- #29 | Ecobank | 13 Aug 2025 20:10
(2, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-13 20:10:00+01',
 'Ecobank -> FirstBank', NULL, 'SUCCESSFUL',
 'Paid via Mahmoud Wada (Ecobank) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Narration: Uhh. Session: 000010250813191008111081242516'),

-- #30 | JAIZ Bank | 15 Aug 2025 13:45:26
(2, 'DEBIT', 15000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM ABDULRAZAK BAKO',
 '2025-08-15 13:45:26+01',
 'JAIZ Bank -> FirstBank', 'JF174917859168256', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (JAIZ acc 002*****20) -> Ibrahim Abdulrazak Bako FirstBank. Session: 000006250815134526098444217591'),

-- #31 | TAJBank | 15 Aug 2025 13:55
(2, 'DEBIT', 6928000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM ABDULRAZAK BAKO',
 '2025-08-15 13:55:00+01',
 'TAJBank -> FirstBank', '0011898040415082025135425', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Abdulrazak Bako FirstBank acc 3067354011. Session: 000026250815135251000159925584'),

-- #32 | ALAT/Wema | 19 Aug 2025 22:39
(2, 'DEBIT', 1000000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-19 22:39:00+01',
 'ALAT/Wema -> FirstBank', '000017250819223927913039178467', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-'),

-- #33 | ALAT/Wema | 22 Aug 2025 17:33
(2, 'DEBIT', 2090000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-22 17:33:00+01',
 'ALAT/Wema -> FirstBank', '000017250822173356442801493844', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-jhhh'),

-- #34 | OPay | 22 Aug 2025 18:33:44
(2, 'DEBIT', 700000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-22 18:33:44+01',
 'OPay -> FirstBank', '250822020100613874401458', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250822173350139545311174'),

-- #35 | ALAT/Wema | 23 Aug 2025 05:31
(2, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-23 05:31:00+01',
 'ALAT/Wema -> FirstBank', '00001725082305053104225141667087', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-hhh'),

-- #36 | OPay | 24 Aug 2025 20:39:54
(2, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-24 20:39:54+01',
 'OPay -> FirstBank', '250824020100657796298432', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250824193957139675984631'),

-- #37 | ALAT/Wema | 25 Aug 2025 15:13
(2, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-25 15:13:00+01',
 'ALAT/Wema -> FirstBank', '000017250825151340654332738338', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-'),

-- #38 | ALAT/Wema | 29 Aug 2025 20:05
(2, 'DEBIT', 1672000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-29 20:05:00+01',
 'ALAT/Wema -> FirstBank', '000017250829200506896134998625', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-'),

-- -- SEPTEMBER 2025 ----------------------------------------------

-- #39 | ALAT/Wema | 03 Sep 2025 07:49
(2, 'DEBIT', 1611000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-03 07:49:00+01',
 'ALAT/Wema -> FirstBank', '000017250903074910260927181488', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-jhh'),

-- #40 | ALAT/Wema | 03 Sep 2025 13:52
(2, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-03 13:52:00+01',
 'ALAT/Wema -> FirstBank', '000017250903135226493697389296', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-'),

-- #41 | OPay | 09 Sep 2025 17:56:22
(2, 'DEBIT', 20000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-09 17:56:22+01',
 'OPay -> FirstBank', '250909020100003611358734', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250909165626140733999221'),

-- #42 | ALAT/Wema | 11 Sep 2025 10:12
(2, 'DEBIT', 3000000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-11 10:12:00+01',
 'ALAT/Wema -> FirstBank', '000017250911101251717412291868', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-'),

-- #43 | OPay | 14 Sep 2025 12:30:15
(2, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-14 12:30:15+01',
 'OPay -> FirstBank', '250914020100107350320802', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250914113019141045898670'),

-- -- OCTOBER 2025 ------------------------------------------------

-- #44 | OPay | 11 Oct 2025 00:25:18
(2, 'DEBIT', 150000.00,
 'MAHMOUD IBRAHIM WADA',
 'AHMAD BAKO IBRAHIM',
 '2025-10-11 00:25:18+01',
 'OPay -> OPay', '251010010100716252402345', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ahmad Bako Ibrahim OPay acc 806 616 7077. Internal OPay transfer');


-- ============================================================
-- VERIFY:
-- Total count for Ibrahim (should be 44):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 2;

-- Balance summary:
-- SELECT * FROM person_balance_summary WHERE person_id = 2;
-- ============================================================
