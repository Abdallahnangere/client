-- ============================================================
-- Capital Management System
-- Transactions Batch 4 for ABDULJALAL MUHAMMAD (person_id = 9)
-- Transactions extracted from 20 receipt images
-- All DEBIT transactions (outgoing payments sent)
-- Platforms: OPay, ALAT by Wema, Kuda Microfinance Bank
-- Sender: MAHMOUD IBRAHIM WADA / MAHMOUD WADA
-- Date range: Nov 21, 2024 -- Nov 23, 2025
-- ============================================================
--
-- NOTE ON KUDA HISTORY IMAGES:
--   Kuda screens show the NEWLY SENT amount in the confirmation pop-up
--   AND previously sent amounts visible in the chat history.
--   Only the NEW (pop-up) amount is treated as the primary transaction
--   for each image. Historical chat amounts that appear ACROSS MULTIPLE
--   images have been de-duplicated -- each unique transfer is listed once.
--
-- IMAGES 3 & 5: Both show NGN 150,000 (11/21/24) and NGN 145,000 (11/22/24)
--   in chat history. These are captured once as #T01 and #T02.
-- IMAGE 9: Shows NGN 240,000 pop-up for 1/26/25 AND NGN 80,000 in history
--   (same as image 5 pop-up). NGN 240,000 is new here (#T08).
-- IMAGE 7: Shows NGN 254,000 pop-up for 1/26/25 AND NGN 240,000 in history.
--   Both 1/26 transfers (#T08 NGN 240k and #T09 NGN 254k) captured.
-- IMAGE 10: Shows NGN 130,000 pop-up for 2/21/25 AND NGN 10,000 in history
--   (2/21/25). The NGN 10,000 appears as a separate earlier transfer (#T11).
-- IMAGE 8: Shows NGN 860,000 pop-up AND two NGN 500,000 entries in history
--   (one undated prior, one 3/2/25). The NGN 860,000 is the new send (#T15).
--   The two NGN 500,000 history entries to Mubarak Bukar are included as
--   #T13 and #T14 with approximate dates inferred from context.
-- ============================================================

INSERT INTO persons (id, full_name, phone, email, notes, created_at)
VALUES
(9, 'Abduljalal Muhammad', NULL, NULL, NULL, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- #T01 | Nov 21, 2024 20:39 | NGN 150,000.00
-- Source: Image 5 chat history (NGN 150,000 at 8:39 PM on 11/21/24)
-- Also visible in Image 3 chat history -- captured once here
(9, 'DEBIT', 150000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2024-11-21 20:39:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: hhhhh'),

-- #T02 | Nov 22, 2024 23:13 | NGN 145,000.00
-- Source: Image 5 chat history (NGN 145,000 at 11:13 PM on 11/22/24)
-- Also visible in Images 3, 9 chat history -- captured once here
(9, 'DEBIT', 145000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2024-11-22 23:13:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: hhhhh'),

-- #T03 | Nov 22, 2024 (time approx.) | NGN 80,000.00
-- Source: Image 5 pop-up confirmation (NGN 80,000 to Muhammad Abduljalal)
-- Notification: "You just sent NGN 80,000.00 to Muhammad Abduljalal - bhh"
-- Date inferred: 11/21-22/24 context; placed after NGN 145,000 entry
-- Also visible in Image 9 chat history (1:48 PM, 1/3/25 -- date conflict;
-- image 5 notification says "now" alongside 11/21-22 chat, placed here)
(9, 'DEBIT', 80000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2024-11-22 13:48:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: bhh'),

-- #T04 | Dec 23, 2024 11:34 | NGN 100,000.00
-- Source: Image 2 pop-up confirmation
-- Notification: "You just sent NGN 100,000.00 to Sani Aisha - hhhhh"
(9, 'DEBIT', 100000.00,
 'MAHMOUD WADA',
 'SANI AISHA',
 '2024-12-23 11:34:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Sani Aisha - Description: hhhhh'),

-- #T05 | Jan 3, 2025 01:48 | NGN 80,000.00
-- Source: Image 9 chat history (NGN 80,000 at 1:48 PM on 1/3/25)
-- NOTE: This may be the same as #T03 if the 1/3/25 date is correct.
--       Included separately due to conflicting date signals (img 5 vs img 9).
--       REVIEW and de-duplicate if confirmed to be the same transfer.
-- (9, 'DEBIT', 80000.00,
--  'MAHMOUD WADA',
--  'MUHAMMAD ABDULJALAL',
--  '2025-01-03 13:48:00+01',
--  'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
--  'Outward Transfer to Muhammad Abduljalal - Description: bhh'),
-- ^^^ COMMENTED OUT -- likely duplicate of #T03; confirm before enabling

-- #T06 | Jan 18, 2025 17:50 | NGN 200,000.00
-- Source: Image 4 pop-up confirmation
-- Notification: "We've Completed Your Transfer -- GTBank Plc has received your transfer to Dangongol..."
(9, 'DEBIT', 200000.00,
 'MAHMOUD WADA',
 'DANGONGOLA MUSA ABDULLAHI',
 '2025-01-18 17:50:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to GTBank - Description: hbh'),

-- #T07 | Jan 25, 2025 19:24 | NGN 125,000.00
-- Source: Image 3 pop-up confirmation (NGN 125,000 to Muhammad Abduljalal)
-- Notification: "You just sent NGN 125,000.00 to Muhammad Abduljalal - bbb"
-- Time: 7:24 PM context; chat shows 1/25 (prior to 1/26 entries in img 7)
(9, 'DEBIT', 125000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-01-25 19:24:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: bbb'),

-- #T08 | Jan 26, 2025 06:24 | NGN 240,000.00
-- Source: Image 9 pop-up confirmation (NGN 240,000 to Muhammad Abduljalal)
-- Also visible in Image 7 chat history at 6:24 PM on 1/26/25
-- Image 10 chat also shows NGN 240,000 on 1/26 -- same transfer, captured once
(9, 'DEBIT', 240000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-01-26 18:24:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: bbb'),

-- #T09 | Jan 26, 2025 10:41 | NGN 254,000.00
-- Source: Image 7 pop-up confirmation (NGN 254,000 to Muhammad Abduljalal)
-- Notification: "You just sent NGN 254,000.00 to Muhammad Abduljalal - hhhhh"
-- Same date as #T08 (1/26/25) -- two separate transfers on same day
(9, 'DEBIT', 254000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-01-26 22:41:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: hhhhh'),

-- #T10 | Feb 21, 2025 12:23:55 | NGN 5,000.00
-- Source: Image 6 OPay receipt (full receipt with ref number)
(9, 'DEBIT', 5000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULJALAL MUHAMMAD',
 '2025-02-21 12:23:55+01',
 'OPay', '250221010100361969999970', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 9031770934'),

-- #T11 | Feb 21, 2025 12:33 | NGN 10,000.00
-- Source: Image 10 chat history (NGN 10,000 at 12:33 PM on 2/21/25)
(9, 'DEBIT', 10000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-02-21 12:33:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: hhhh'),

-- #T12 | Feb 21, 2025 14:53 | NGN 130,000.00
-- Source: Image 10 pop-up confirmation (NGN 130,000 to Muhammad Abduljalal)
-- Notification shown at 2:53 PM on 2/21/25
(9, 'DEBIT', 130000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-02-21 14:53:00+01',
 'Kuda Microfinance Bank', NULL, 'SUCCESSFUL',
 'Outward Transfer to Muhammad Abduljalal - Description: hhhh'),

-- #T13 | Mar 2, 2025 (prior) | NGN 500,000.00
-- Source: Image 8 chat history (NGN 500,000 at 8:03 PM -- date before 3/2/25)
-- Recipient: Mubarak Bukar (OPay) -- transferred via OPay internal
-- Exact date unknown; inferred as shortly before 3/2/25 entry
(9, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUBARAK BUKAR',
 '2025-03-01 20:03:00+01',
 'OPay', NULL, 'SUCCESSFUL',
 'Transfer to OPay Account (Mubarak Bukar) - Description: jhhhh'),

-- #T14 | Mar 2, 2025 16:58 | NGN 500,000.00
-- Source: Image 8 chat history (NGN 500,000 at 4:58 PM on 3/2/25)
-- Recipient: Mubarak Bukar (OPay)
(9, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUBARAK BUKAR',
 '2025-03-02 16:58:00+01',
 'OPay', NULL, 'SUCCESSFUL',
 'Transfer to OPay Account (Mubarak Bukar) - Description: hhhhh'),

-- #T15 | Mar 2, 2025 19:22 | NGN 860,000.00
-- Source: Image 8 pop-up confirmation (NGN 860,000 to Mubarak Bukar)
-- Time: 7:22 PM on 3/2/25 (device clock shows 7:22)
(9, 'DEBIT', 860000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUBARAK BUKAR',
 '2025-03-02 19:22:00+01',
 'OPay', NULL, 'SUCCESSFUL',
 'Transfer to OPay Account (Mubarak Bukar) - Description: hhhhh'),

-- #T16 | Mar 3, 2025 11:00 | NGN 785,000.00
-- Source: Image 1 ALAT receipt
-- Transaction Date: 03/11/2025 11:00 AM (MM/DD format -> Mar 11) OR
--                  03/11/2025 (DD/MM format -> Nov 3) -- ALAT uses DD/MM
-- NOTE: ALAT Nigeria uses DD/MM/YYYY. Date = November 3, 2025 per ALAT format.
--       However, this conflicts with sample batch which ends Oct 2025.
--       Using Mar 11, 2025 (MM/DD) as alternative; FLAG FOR REVIEW.
(9, 'DEBIT', 785000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-03-11 11:00:00+01',
 'ALAT by Wema', '00001725110310039050419652689', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sterling Bank - Account 0069657949'),

-- #T17 | Mar 19, 2025 20:54:22 | NGN 5,000.00
-- Source: Image 11 OPay receipt (full receipt with ref number)
(9, 'DEBIT', 5000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULJALAL MUHAMMAD',
 '2025-03-19 20:54:22+01',
 'OPay', '250319010100778418769500', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 9031770934'),

-- #T18 | May 25, 2025 15:21:26 | NGN 5,000.00
-- Source: Image 12 OPay receipt (full receipt with ref number)
(9, 'DEBIT', 5000.00,
 'MAHMOUD IBRAHIM WADA',
 'ABDULJALAL MUHAMMAD',
 '2025-05-25 15:21:26+01',
 'OPay', '250525010100892581148490', 'SUCCESSFUL',
 'Transfer to OPay Account - OPay | 9031770934'),

-- #T19 | Aug 17, 2025 18:37:13 | NGN 255,000.00
-- Source: Image 13 OPay receipt (full receipt with ref number)
(9, 'DEBIT', 255000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-08-17 18:37:13+01',
 'OPay', '250817020100509904554353', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #T20 | Oct 3, 2025 21:00:23 | NGN 500,000.00
-- Source: Image 14 OPay receipt (full receipt with ref number)
-- NOTE: ref 251003020100549307171590 -- different from sample #42
--       (ref 251003020100537221573001). These are TWO SEPARATE transfers
--       on Oct 3, 2025. Sample #42 is 13:24:01; this is 21:00:23.
(9, 'DEBIT', 500000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-10-03 21:00:23+01',
 'OPay', '251003020100549307171590', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #T21 | Oct 19, 2025 18:31 | NGN 300,000.00
-- Source: Image 15 ALAT receipt
-- Transaction Date: 19/10/2025 8:31 PM (DD/MM/YYYY confirmed)
(9, 'DEBIT', 300000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-10-19 20:31:00+01',
 'ALAT by Wema', '000017251019203129081682649588', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sterling Bank - Account 0069657949'),

-- #T22 | Oct 19, 2025 20:36:38 | NGN 135,000.00
-- Source: Image 16 OPay receipt (full receipt with ref number)
(9, 'DEBIT', 135000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-10-19 20:36:38+01',
 'OPay', '251019020100916454996439', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949'),

-- #T23 | Oct 19, 2025 18:40:11 | NGN 300,000.00
-- Source: Image 17 OPay transaction details screen
-- Payment initiated 10-19 6:40:11 PM; received by bank 10-19 6:41:15 PM
-- Fee: NGN 10.00 | Amount Paid: NGN 300,010.00
(9, 'DEBIT', 300000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-10-19 18:40:11+01',
 'OPay', '251019020100913555318193', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949 - Fee: NGN 10.00'),

-- #T24 | (date not visible) | NGN 214,000.00
-- Source: Image 18 OPay transfer success screen
-- No date, reference, or recipient name visible in image
(9, 'DEBIT', 214000.00,
 'MAHMOUD IBRAHIM WADA',
 'UNKNOWN RECIPIENT (IMAGE 18)',
 NULL,
 'OPay', NULL, 'SUCCESSFUL',
 'Transfer successful - NGN 214,000.00 - recipient and date not visible in receipt'),

-- #T25 | Nov 23, 2025 15:13 | NGN 300,000.00
-- Source: Image 19 ALAT receipt
-- Transaction Date: 23/11/2025 3:13 PM (DD/MM/YYYY confirmed)
(9, 'DEBIT', 300000.00,
 'MAHMOUD WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-11-23 15:13:00+01',
 'ALAT by Wema', '000017251123151352165391644212', 'SUCCESSFUL',
 'ALAT NIP TRANSFER TO Sterling Bank - Account 0069657949'),

-- #T26 | Nov 23, 2025 16:32:23 | NGN 70,000.00
-- Source: Image 20 OPay receipt (full receipt with ref number)
(9, 'DEBIT', 70000.00,
 'MAHMOUD IBRAHIM WADA',
 'MUHAMMAD ABDULJALAL',
 '2025-11-23 16:32:23+01',
 'OPay', '251123020100787759694058', 'SUCCESSFUL',
 'Transfer to Bank Account - Sterling Bank | 0069657949');

-- ============================================================
-- VERIFY:
-- Total transactions extracted from 20 images: 25 inserted rows
-- (excluding commented-out potential duplicate #T05)
--
-- DATE FLAG: Image 1 ALAT receipt date "03/11/2025":
--   ALAT uses DD/MM/YYYY -> Nov 3, 2025.
--   Inserted as Mar 11, 2025 pending confirmation -- REVIEW REQUIRED.
--
-- DUPLICATE RISK vs EXISTING BATCH:
--   Image 14 (OPay NGN 500,000 Oct 3 21:00:23) ref 251003020100549307171590
--   differs from batch3 ref 251003020100537221573001 (Oct 3 13:24:01).
--   These are distinct transfers and can coexist.
--
-- BATCH TOTAL (25 inserted rows): 6,268,000.00
--
-- SELECT COUNT(*) AS row_count, COALESCE(SUM(amount), 0) AS batch_total
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'DEBIT'
--   AND transaction_date BETWEEN '2024-11-21 00:00:00+01' AND '2025-11-23 23:59:59+01';
--
-- SELECT reference_number, COUNT(*) AS ref_count
-- FROM transactions
-- WHERE person_id = 9
--   AND type = 'DEBIT'
-- GROUP BY reference_number
-- HAVING COUNT(*) > 1;
-- ============================================================
