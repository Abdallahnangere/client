-- ============================================================
-- Capital Management System
-- Transactions Batch 1 for MUSA DANGONGOLA (person_id = 4)
-- Transactions #1 -- #21  |  Aug 2025 -- Oct 2025
-- All CREDIT
-- Sources: Moniepoint (ZamZam Block Enterprises), Jaiz Bank (Musa Abdullahi Dangongola personal)
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(4, 'Musa Dangongola', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #1 | Moniepoint | 13 Aug 2025 11:47 | ₦5,000,000
(4, 'CREDIT', 5000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-13 11:47:00+01',
 'Moniepoint -> TAJ Bank', 'TRF|2MPT27vk1|1955581902494396416', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Ibrahim Wada, TAJ Bank acc 0012036999'),

-- #2 | Moniepoint | 13 Aug 2025 12:11 | ₦5,000,000
(4, 'CREDIT', 5000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-13 12:11:00+01',
 'Moniepoint -> TAJ Bank', '09040525081312132492770460647', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Ibrahim Wada, TAJ Bank acc 0012036999'),

-- #3 | Moniepoint | 13 Aug 2025 12:28 | ₦4,500,000
(4, 'CREDIT', 4500000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-13 12:28:00+01',
 'Moniepoint -> TAJ Bank', '09040525081313353139939292311420', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Ibrahim Wada, TAJ Bank acc 0012036999'),

-- #4 | Moniepoint | 13 Aug 2025 12:28 | ₦5,000,000
(4, 'CREDIT', 5000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-13 12:28:00+01',
 'Moniepoint -> TAJ Bank', '090405250813122844382351200648', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Ibrahim Wada, TAJ Bank acc 0012036999'),

-- #5 | Moniepoint | 13 Aug 2025 15:42 | ₦3,500,000
(4, 'CREDIT', 3500000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-13 15:42:00+01',
 'Moniepoint -> Ecobank Nigeria', '09040525081315424918039211633', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Ibrahim Wada, Ecobank acc 0110060083'),

-- #6 | Jaiz Bank | 17 Aug 2025 20:53 | ₦15,000,000
(4, 'CREDIT', 15000000.00,
 'MUSA ABDULLAHI DANGONGOLA',
 'MAHMOUD WADA',
 '2025-08-17 20:53:00+01',
 'Jaiz Bank -> Wema Bank', 'JF007350917652480', 'SUCCESSFUL',
 'Jaiz Bank receipt: Musa Abdullahi Dangongola (acc 001*****79) to Mahmoud Wada, Wema Bank acc 025*****26'),

-- #7 | Moniepoint | 17 Aug 2025 20:53 | ₦10,000,000
(4, 'CREDIT', 10000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-08-17 20:53:00+01',
 'Moniepoint -> Wema Bank', '090405250817205316063095822740', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #8 | Moniepoint | 09 Sep 2025 21:07 | ₦10,000,000
(4, 'CREDIT', 10000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-09 21:07:00+01',
 'Moniepoint -> Wema Bank', '09040525090921071338758761221', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #9 | Moniepoint | 09 Sep 2025 19:56 | ₦11,000,000
(4, 'CREDIT', 11000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-09 19:56:00+01',
 'Moniepoint -> Wema Bank', '090405250909195627656089676006', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #10 | Moniepoint | 10 Sep 2025 00:31 | ₦8,000,000
(4, 'CREDIT', 8000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-10 00:31:00+01',
 'Moniepoint -> Wema Bank', '09040525091100314181987090924230', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #11 | Moniepoint | 10 Sep 2025 12:28 | ₦11,000,000
(4, 'CREDIT', 11000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-10 12:28:00+01',
 'Moniepoint -> Wema Bank', '090405250910122814898766124674', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #12 | Moniepoint | 10 Sep 2025 12:29 | ₦9,000,000
(4, 'CREDIT', 9000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-10 12:29:00+01',
 'Moniepoint -> Wema Bank', '09040525091012291234090132998', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #13 | Moniepoint | 11 Sep 2025 02:47 | ₦1,500,000
(4, 'CREDIT', 1500000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-11 02:47:00+01',
 'Moniepoint -> Wema Bank', '090405250912004752877630635405', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #14 | Moniepoint | 18 Sep 2025 17:17 | ₦15,000,000
(4, 'CREDIT', 15000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-18 17:17:00+01',
 'Moniepoint -> Wema Bank', '090405250918151714831457496754', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #15 | Moniepoint | 19 Sep 2025 06:19 | ₦4,000,000
(4, 'CREDIT', 4000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-09-19 06:19:00+01',
 'Moniepoint -> Wema Bank', '090405250919041927619347258678', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #16 | Moniepoint | 13 Oct 2025 19:31 | ₦15,000,000
(4, 'CREDIT', 15000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-10-13 19:31:00+01',
 'Moniepoint -> Wema Bank', 'TRF|2MPT5dh1y|1977804355765477376', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #17 | Moniepoint | 13 Oct 2025 19:32 | ₦7,500,000
(4, 'CREDIT', 7500000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-10-13 19:32:00+01',
 'Moniepoint -> Wema Bank', 'TRF|2MPT5dh1y|1977804635983745024', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #18 | Moniepoint | 14 Oct 2025 01:56 | ₦10,000,000
(4, 'CREDIT', 10000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-10-14 01:56:00+01',
 'Moniepoint -> Wema Bank', 'TRF|2MPT5dh1y|1977901336833110016', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #19 | Moniepoint | 14 Oct 2025 01:57 | ₦7,500,000
(4, 'CREDIT', 7500000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-10-14 01:57:00+01',
 'Moniepoint -> Wema Bank', 'TRF|2MPT5dh1y|1977901650185785344', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026'),

-- #20 | Moniepoint | 20 Oct 2025 12:39 | ₦10,000,000
(4, 'CREDIT', 10000000.00,
 'ZAMZAM BLOCK ENTERPRISES',
 'MAHMOUD WADA',
 '2025-10-20 12:39:00+01',
 'Moniepoint -> Wema Bank', 'TRF|2MPT5dh1y|1980237451322028032', 'SUCCESSFUL',
 'Moniepoint debit receipt: ZamZam Block Enterprises to Mahmoud Wada, Wema Bank acc 0252971026');

-- ============================================================
-- VERIFY:
-- Batch 1 row count should be 20
-- Batch 1 total amount should be 196,000,000.00
--
-- SELECT COUNT(*), COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 4
--   AND type = 'CREDIT';
--
-- SELECT * FROM person_balance_summary WHERE person_id = 4;
-- ============================================================
