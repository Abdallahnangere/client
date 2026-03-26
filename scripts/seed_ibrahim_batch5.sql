-- ============================================================
-- Capital Management System
-- Transactions Batch 5 for IBRAHIM AHMAD BAKO (person_id = 2)
-- Transactions #45 -- #64  |  Aug -- Nov 2025
-- ============================================================

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #45 | ALAT/Wema | 03 Nov 2025 14:29
(2, 'DEBIT', 3000000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-11-03 14:29:00+01',
 'ALAT/Wema -> FirstBank', '00001725110314290000000000777800', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO Ibrahim Ahmad Bako FROM MAHMOUD WADA'),

-- #46 | OPay | 20 Aug 2025 17:56:44
(2, 'DEBIT', 1090000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-20 17:56:44+01',
 'OPay -> FirstBank', '250820020100571276016902', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250820165648139414341639'),

-- #47 | OPay | 23 Aug 2025 12:09:57
(2, 'DEBIT', 1300000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-23 12:09:57+01',
 'OPay -> FirstBank', '250823020100627500079082', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004250823111000139585516647'),

-- #48 | TAJBank | 27 Aug 2025 20:05
(2, 'DEBIT', 1620000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-27 20:05:00+01',
 'TAJBank -> FirstBank', '0011898042707082025200512', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026250827200325000162176303'),

-- #49 | TAJBank | 29 Aug 2025 17:32
-- Beneficiary: ALAMEEN M BABA GENERAL ENTERPRISES (OPS) - JAIZ Bank
(2, 'DEBIT', 20000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ALAMEEN M BABA GENERAL ENTERPRISES',
 '2025-08-29 17:32:00+01',
 'TAJBank -> JAIZ Bank', 'STAJJNG25082968676339', 'SUCCESSFUL',
 'Paid via TAJBank (001****999) -> Alameen M Baba General Enterprises (OPS) JAIZ Bank acc 0018024515. Narration: NIP/trsf bo MAHMOUD IBRAHIM WADA/kn ifo ALAMEEN. Session: 000026250829172956000162572386'),

-- #50 | Calculator | 29 Aug 2025
-- Calculator screenshot: 17,421 x 96 = 1,672,416
(2, 'DEBIT', 1672416.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-08-29 00:00:00+01',
 NULL, NULL, 'SUCCESSFUL',
 'Calculator entry: 17,421 x 96 = 1,672,416. Exact time not available.'),

-- #51 | TAJBank | 09 Sep 2025 14:55
(2, 'DEBIT', 1341463.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-09 14:55:00+01',
 'TAJBank -> FirstBank', '00118980409092025145416', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026250909145226000164665918'),

-- #52 | TAJBank | 10 Sep 2025 09:58
(2, 'DEBIT', 8000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-10 09:58:00+01',
 'TAJBank -> FirstBank', '00118980410092025095728', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026250910095532000164800694'),

-- #53 | TAJBank | 10 Sep 2025 11:01
(2, 'DEBIT', 5000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-10 11:01:00+01',
 'TAJBank -> FirstBank', '00118980410092025110100', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026250910105923000164813875'),

-- #54 | TAJBank | 10 Sep 2025 11:04
(2, 'DEBIT', 1000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-10 11:04:00+01',
 'TAJBank -> FirstBank', '00118980410092025110353', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 0000262509101110206000164814441'),

-- #55 | ALAT/Wema | 10 Sep 2025 (time not shown)
(2, 'DEBIT', 1000000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-10 00:00:00+01',
 'ALAT/Wema -> FirstBank', '000017250910092922477561781346', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO FBN-'),

-- #56 | TAJBank | 10 Sep 2025 15:24
(2, 'DEBIT', 3000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-10 15:24:00+01',
 'TAJBank -> FirstBank', '00118980410092025152348', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026250910152151000164879396'),

-- #57 | TAJBank | 10 Sep 2025 21:28
(2, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-10 21:28:00+01',
 'TAJBank -> FirstBank', '00118980410092025212819', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026250910212621000164964701'),

-- #58 | TAJBank | 12 Sep 2025 19:32
(2, 'DEBIT', 3000000.00,
 'YUNUSA MUHAMMAD ISA',
 'IBRAHIM AHMAD BAKO',
 '2025-09-12 19:32:00+01',
 'TAJBank -> FirstBank', '00036046312092025193133', 'SUCCESSFUL',
 'Paid via Yunusa Muhammad Isa (TAJBank 001****520) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026250912192926000165338310'),

-- #59 | Calculator | Sep 2025
-- Calculator screenshot: 3,738,675.3345 (partial expression visible)
(2, 'DEBIT', 3738675.33,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 NULL,
 NULL, NULL, 'SUCCESSFUL',
 'Calculator entry: result = 3,738,675.3345. Exact date and time not available.'),

-- #60 | ALAT/Wema | 03 Oct 2025 16:58
(2, 'DEBIT', 2403000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-10-03 16:58:00+01',
 'ALAT/Wema -> FirstBank', '000017251003165859496144115427', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO IBRAHIM AHMAD BAKO FROM MAHMOUD WADA'),

-- #61 | ALAT/Wema | 13 Oct 2025 19:45
(2, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-10-13 19:45:00+01',
 'ALAT/Wema -> FirstBank', '000017251013194559907648892680', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO IBRAHIM AHMAD BAKO FROM MAHMOUD WADA'),

-- #62 | TAJBank | 14 Oct 2025 17:09
(2, 'DEBIT', 1500000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-10-14 17:09:00+01',
 'TAJBank -> FirstBank', '00118980414102025170839', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (TAJBank 001****999) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 000026251014170713000171639004'),

-- #63 | OPay | 14 Oct 2025 17:11:59
(2, 'DEBIT', 26000.00,
 'MAHMOUD IBRAHIM WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-10-14 17:11:59+01',
 'OPay -> FirstBank', '251014020100796755988333', 'SUCCESSFUL',
 'Paid via Mahmoud Ibrahim Wada (OPay 906****308) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Session: 100004251014161202143095074727'),

-- #64 | ALAT/Wema | 20 Oct 2025 13:48
(2, 'DEBIT', 5500000.00,
 'MAHMOUD WADA',
 'IBRAHIM AHMAD BAKO',
 '2025-10-20 13:48:00+01',
 'ALAT/Wema -> FirstBank', '000017251020134834023222888325', 'SUCCESSFUL',
 'Paid via Mahmoud Wada (ALAT/Wema) -> Ibrahim Ahmad Bako FirstBank acc 3134126466. Remark: ALAT NIP TRANSFER TO Ibrahim Ahmad Bako FROM MAHMOUD WADA');


-- ============================================================
-- VERIFY:
-- Total count for Ibrahim (should be 64):
-- SELECT COUNT(*) FROM transactions WHERE person_id = 2;
-- SELECT * FROM person_balance_summary WHERE person_id = 2;
-- ============================================================
