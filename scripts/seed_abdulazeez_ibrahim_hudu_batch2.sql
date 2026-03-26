-- ============================================================
-- Capital Management System
-- Transactions Batch 2 for ABDULAZEEZ IBRAHIM HUDU (person_id = 6)
-- Transactions #1 -- #20  |  Aug 2025 -- Dec 2025
-- All DEBIT
-- Sources: OPay, ALAT (Wema Bank), Taj Bank, Sterling Bank (STAJ)
-- Sender on most: MAHMOUD IBRAHIM WADA
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(6, 'Abdulazeez Ibrahim Hudu', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Aug 15, 2025 12:09:35 | NGN 100,000 (OPay PDF)
(6, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-08-15 12:09:35+01',
 'OPay', '250815010100461013225998', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | OPay 813 873 4828'),

-- #2 | Aug 22, 2025 16:53:24 | NGN 100,000 (OPay PDF)
(6, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-08-22 16:53:24+01',
 'OPay', '250822010100611606066491', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | OPay 813 873 4828'),

-- #3 | Aug 29, 2025 19:23:00 | NGN 1,100,000 (ALAT PDF)
(6, 'DEBIT', 1100000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-08-29 19:23:00+01',
 'ALAT by Wema', '000017250829192329674604975619', 'SUCCESSFUL',
 'ALAT NIP Transfer to Jaiz Bank - Abdulazeez Ibrahim Hudu | Acc: 0007584790'),

-- #4 | Sep 13, 2025 21:35:43 | NGN 100,000 (OPay PDF)
(6, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-09-13 21:35:43+01',
 'OPay', '250913010100098396767292', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | OPay 813 873 4828'),

-- #5 | Sep 20, 2025 14:49:43 | NGN 100,000 (Image 3 - OPay screenshot)
(6, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-09-20 14:49:43+01',
 'OPay', '250920010100243627286001', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | OPay 813 873 4828'),

-- #6 | Sep 26, 2025 11:18:27 | NGN 100,000 (OPay PDF)
(6, 'DEBIT', 100000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-09-26 11:18:27+01',
 'OPay', '250926010100372008880074', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | OPay 813 873 4828'),

-- #7 | Oct 3, 2025 13:23:26 | NGN 150,000 (OPay PDF)
(6, 'DEBIT', 150000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-03 13:23:26+01',
 'OPay', '251003010100537117787640', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | OPay 813 873 4828'),

-- #8 | Oct 10, 2025 12:58:58 | NGN 400,000 (OPay PDF)
(6, 'DEBIT', 400000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-10 12:58:58+01',
 'OPay', '251010010100702182702571', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | OPay 813 873 4828'),

-- #9 | Oct 10, 2025 18:17:15 | NGN 2,000,000 (OPay PDF)
(6, 'DEBIT', 2000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-10 18:17:15+01',
 'OPay', '251010020100709288188997', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu | Jaiz Bank 0007584790'),

-- #10 | Oct 17, 2025 11:49:00 | NGN 1,450,000 (Image 4 - ALAT screenshot)
(6, 'DEBIT', 1450000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-17 11:49:00+01',
 'ALAT by Wema', '000017251017114909526941550990', 'SUCCESSFUL',
 'ALAT NIP Transfer to Abdulazeez Ibrahim Hudu | Acc: 0007584790'),

-- #11 | Oct 17, 2025 17:14:22 | NGN 12,000,000 (Image 6 - Sterling Bank screenshot)
(6, 'DEBIT', 12000000.00,
 'UNKNOWN SENDER (STERLING BANK RECEIPT)',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-17 17:14:22+01',
 'Sterling Bank', 'STAJNG25101784089668', 'SUCCESSFUL',
 'Interbank NIP Transfer to Abdulazeez Ibrahim Hudu - Jaiz Bank 0007584790 | Session: 000026251017171220000172235237'),

-- #12 | Oct 24, 2025 19:27:00 | NGN 6,500,000 (Image 7 - Taj Bank screenshot)
(6, 'DEBIT', 6500000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-24 19:27:00+01',
 'Taj Bank', '00118980424102025192632', 'SUCCESSFUL',
 'Taj Bank NIP Transfer to Abdulazeez Ibrahim Hudu - Jaiz Bank 0007584790 | Acc: 001****999'),

-- #13 | Oct 24, 2025 (time not shown) | NGN 2,000,000 (Image 8 - ALAT screenshot)
(6, 'DEBIT', 2000000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-24 00:00:00+01',
 'ALAT by Wema', '000017251024171507055314907164', 'SUCCESSFUL',
 'ALAT NIP Transfer to Abdulazeez Ibrahim Hudu - Jaiz Bank | Acc: 0007584790 (time not shown on source receipt)'),

-- #14 | Oct 24, 2025 20:05:00 | NGN 6,000,000 (Image 11 - Taj Bank screenshot)
(6, 'DEBIT', 6000000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-24 20:05:00+01',
 'Taj Bank', '00118980424102025200458', 'SUCCESSFUL',
 'Taj Bank NIP Transfer to Abdulazeez Ibrahim Hudu - Jaiz Bank 0007584790 | Acc: 001****999'),

-- #15 | Oct 31, 2025 (time not shown) | NGN 5,000,000 (Image 9 - ALAT screenshot)
(6, 'DEBIT', 5000000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-31 00:00:00+01',
 'ALAT by Wema', '000017251031171422967798351531', 'SUCCESSFUL',
 'ALAT NIP Transfer to Abdulazeez Ibrahim Hudu - Jaiz Bank | Acc: 0007584790 (time not shown on source receipt)'),

-- #16 | Oct 31, 2025 17:40:00 | NGN 5,000,000 (Image 10 - ALAT screenshot)
(6, 'DEBIT', 5000000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-10-31 17:40:00+01',
 'ALAT by Wema', '000017251031174048171098369978', 'SUCCESSFUL',
 'ALAT NIP Transfer to Abdulazeez Ibrahim Hudu | Acc: 0007584790'),

-- #17 | Nov 2, 2025 15:44:19 | NGN 500,000 (Image 12 - OPay screenshot)
(6, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-11-02 15:44:19+01',
 'OPay', '251102020100246427854065', 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu - Jaiz Bank 0007584790'),

-- #18 | Dec 11, 2025 16:34:00 | NGN 500,000 (Image 1 - ALAT screenshot)
(6, 'DEBIT', 500000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-12-11 16:34:00+01',
 'ALAT by Wema', '0000172511211634446307915419690', 'SUCCESSFUL',
 'ALAT NIP Transfer to Abdulazeez Ibrahim Hudu | Acc: 0007584790'),

-- #19 | Nov 18, 2025 15:09:00 | NGN 6,000,000 (Image 2 - ALAT screenshot)
(6, 'DEBIT', 6000000.00,
 'MAHMOUD WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 '2025-11-18 15:09:00+01',
 'ALAT by Wema', '00001725118150939511498235478', 'SUCCESSFUL',
 'ALAT NIP Transfer to Abdulazeez Ibrahim Hudu | Acc: 0007584790'),

-- #20 | OPay NGN 50,000 confirmation screen (Image 5) - exact datetime not visible
(6, 'DEBIT', 50000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULAZEEZ IBRAHIM HUDU',
 NULL,
 'OPay', NULL, 'SUCCESSFUL',
 'OPay transfer to Abdulazeez Ibrahim Hudu - confirmation screen only, details incomplete');

-- ============================================================
-- VERIFY:
-- Batch 2 row count should be 20
-- Batch 2 total amount should be 49,150,000.00
-- Incomplete rows (NULL transaction_date/reference_number) should be 1
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 6
--   AND type = 'DEBIT'
--   AND (
--     transaction_date >= '2025-08-15 00:00:00+01'
--     OR transaction_date IS NULL
--   );
--
-- SELECT COUNT(*) AS incomplete_rows
-- FROM transactions
-- WHERE person_id = 6
--   AND type = 'DEBIT'
--   AND transaction_date IS NULL
--   AND reference_number IS NULL;
--
-- SELECT * FROM person_balance_summary WHERE person_id = 6;
-- ============================================================
