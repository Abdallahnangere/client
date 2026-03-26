-- ============================================================
-- Capital Management System
-- Refined Seed Script for IBRAHIM ALI YAMMUSA (person_id = 3)
-- Source batch: receipts labeled IDs 109-128
-- ============================================================

-- Ensure person exists (safe insert)
INSERT INTO persons (id, full_name, phone, email, notes)
VALUES (3, 'Ibrahim Ali Yammusa', NULL, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

INSERT INTO transactions
    (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES

-- 109 | Ecobank -> Wema | 12 May 2025
(3, 'CREDIT', 10000000.00,
 'IBRAHIM YAMMUSA',
 'MAHMOUD WADA',
 '2025-05-12 18:35:00+01',
 'Ecobank -> Wema Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 109. Beneficiary acct: 0252971026. Source type: Other-Local-Banks. Remark: ..'),

-- 110 | Ecobank -> Wema | 13 May 2025
(3, 'CREDIT', 10000000.00,
 'IBRAHIM YAMMUSA',
 'MAHMOUD WADA',
 '2025-05-13 03:09:00+01',
 'Ecobank -> Wema Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 110. Beneficiary acct: 0252971026. Source type: Other-Local-Banks. Remark: ...'),

-- 111 | Ecobank -> Wema | 19 Jun 2025
(3, 'CREDIT', 1000000.00,
 'IBRAHIM YAMMUSA',
 'MAHMOUD WADA',
 '2025-06-19 04:25:00+01',
 'Ecobank -> Wema Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 111. Beneficiary acct: 0252971026. Source type: Other-Local-Banks. Remark: Z'),

-- 112 | Access -> Wema | 19 Jun 2025
(3, 'CREDIT', 3000000.00,
 'KHADIJAT MUKHTAR',
 'MAHMOUD WADA',
 '2025-06-19 23:31:07+01',
 'Access Bank -> Wema Bank', 'NXG000014250619233058268379504421', 'SUCCESSFUL',
 'Receipt ID 112. Beneficiary acct: 0252971026. Source type: INTER-BANK'),

-- 113 | Access -> Wema | 20 Jun 2025
(3, 'CREDIT', 100000.00,
 'IBRAHM ALI YAMMUSA',
 'MAHMOUD WADA',
 '2025-06-20 00:05:35+01',
 'Access Bank -> Wema Bank', 'NXG000014250620000522293590219624', 'SUCCESSFUL',
 'Receipt ID 113. Beneficiary acct: 0252971026. Source type: INTER-BANK. Remark: Bs'),

-- 114 | Access -> Wema | 20 Jun 2025
(3, 'CREDIT', 500000.00,
 'IBRAHM ALI YAMMUSA',
 'MAHMOUD WADA',
 '2025-06-20 05:46:28+01',
 'Access Bank -> Wema Bank', 'NXG000014250620054626243948287465', 'SUCCESSFUL',
 'Receipt ID 114. Beneficiary acct: 0252971026. Source type: INTER-BANK'),

-- 115 | Polaris -> Wema | 20 Jun 2025
(3, 'CREDIT', 500000.00,
 'YAMMUSA IBRAHIM',
 'MAHMOUD WADA',
 '2025-06-20 12:17:00+01',
 'Polaris Bank -> Wema Bank', '0D9403A71A6388597544471574862012', 'SUCCESSFUL',
 'Receipt ID 115. Beneficiary acct: 0252971026. Source type: INTER-BANK'),

-- 116 | Polaris -> Wema | 21 Jun 2025
(3, 'CREDIT', 500000.00,
 'YAMMUSA IBRAHIM',
 'MAHMOUD WADA',
 '2025-06-21 03:19:00+01',
 'Polaris Bank -> Wema Bank', 'BE96F9B8576388607274565748432103', 'SUCCESSFUL',
 'Receipt ID 116. Beneficiary acct: 0252971026. Source type: INTER-BANK'),

-- 117 | Polaris -> Wema | 23 Jun 2025
(3, 'CREDIT', 500000.00,
 'YAMMUSA IBRAHIM',
 'MAHMOUD WADA',
 '2025-06-23 13:15:00+01',
 'Polaris Bank -> Wema Bank', 'EA2EF69C5C6388628134234922472301', 'SUCCESSFUL',
 'Receipt ID 117. Beneficiary acct: 0252971026. Source type: INTER-BANK'),

-- 118 | Polaris -> Taj | 31 Jul 2025
(3, 'CREDIT', 500000.00,
 'YAMMUSA IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-31 17:37:00+01',
 'Polaris Bank -> Taj Bank', '4E730C94236388958023313310633105', 'SUCCESSFUL',
 'Receipt ID 118. Beneficiary acct: 0012036999. Source type: INTER-BANK'),

-- 119 | FirstBank -> Taj | 31 Jul 2025
(3, 'CREDIT', 500000.00,
 'AISHA IBRAHIM',
 'MAHMOUD IBRAHIM WADA',
 '2025-07-31 18:36:38+01',
 'FirstBank -> Taj Bank', '000016250731183644000408191276', 'SUCCESSFUL',
 'Receipt ID 119. Beneficiary acct: 0012036999. Source type: Interbank Transfer. Remark: Ibrahim Ali yammusa'),

-- 120 | Wise (UK) -> Wema | 08 Aug 2025
(3, 'CREDIT', 1000150.00,
 'WISE SENDER',
 'MAHMOUD WADA',
 '2025-08-08 17:27:00+01',
 'Wise (UK) -> Wema Bank', '2055538446025364047', 'IN PROGRESS',
 'Receipt ID 120. Beneficiary acct: 0252971026. Source type: International Transfer. GBP 482.00, fee 0.00'),

-- 121 | Access -> Jaiz | 09 Aug 2025
(3, 'CREDIT', 1000000.00,
 'IBRAHM ALI YAMMUSA',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-09 15:56:38+01',
 'Access Bank -> Jaiz Bank', 'NXGETZ-09FG250809155628716APGONR', 'SUCCESSFUL',
 'Receipt ID 121. Beneficiary acct: 0020820220. Source type: INTER-BANK'),

-- 122 | GTBank -> Jaiz | 11 Aug 2025
(3, 'CREDIT', 500000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD IBRAHIM WADA',
 '2025-08-11 05:34:00+01',
 'GTBank -> Jaiz Bank', '000013250811053411000341692588', 'SUCCESSFUL',
 'Receipt ID 122. Beneficiary acct: 0020820220. Source type: NIBSS Instant Payment'),

-- 123 | GTBank -> Wema | 27 Aug 2025
(3, 'CREDIT', 7000000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD WADA',
 '2025-08-27 10:44:00+01',
 'GTBank -> Wema Bank', '000013250827104428000374437922', 'SUCCESSFUL',
 'Receipt ID 123. Beneficiary acct: 0252971026. Source type: NIBSS Instant Payment'),

-- 124 | GTBank -> Wema | 27 Aug 2025
(3, 'CREDIT', 4000000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD WADA',
 '2025-08-27 21:44:00+01',
 'GTBank -> Wema Bank', '000013250827214412000376116910', 'SUCCESSFUL',
 'Receipt ID 124. Beneficiary acct: 0252971026. Source type: NIBSS Instant Payment'),

-- 125 | GTBank -> Taj | 09 Sep 2025
(3, 'CREDIT', 1000000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD IBRAHIM WADA',
 '2025-09-09 14:48:00+01',
 'GTBank -> Taj Bank', '000013250909144850000403587002', 'SUCCESSFUL',
 'Receipt ID 125. Beneficiary acct: 0012036999. Source type: NIBSS Instant Payment'),

-- 126 | GTBank -> Jaiz | 03 Oct 2025
(3, 'CREDIT', 6000000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD IBRAHIM WADA',
 '2025-10-03 20:56:00+01',
 'GTBank -> Jaiz Bank', '000013251003205654000455891216', 'SUCCESSFUL',
 'Receipt ID 126. Beneficiary acct: 0020821193. Source type: NIBSS Instant Payment'),

-- 127 | UBA -> Wema | undated
(3, 'CREDIT', 1000000.00,
 'UNKNOWN',
 'MAHMOUD WADA',
 NULL,
 'UBA -> Wema Bank', NULL, 'SUCCESSFUL',
 'Receipt ID 127. Beneficiary acct: 0252971026. Source type: INTER-BANK. Date not visible on receipt'),

-- 128 | GTBank -> Opay | 06 Dec 2025
(3, 'CREDIT', 20000.00,
 'YAMMUSA IBRAHIM ALI',
 'MAHMOUD IBRAHIM WADA',
 '2025-12-06 21:00:00+01',
 'GTBank -> Opay', '000013251206190038000597433052', 'SUCCESSFUL',
 'Receipt ID 128. Beneficiary acct: 9066575308. Source type: NIBSS Instant Payment');

-- ============================================================
-- VERIFY
-- Total rows in this batch for person_id = 3 should be 20
-- Expected batch total amount = 49,620,150.00
--
-- SELECT COUNT(*) FROM transactions
-- WHERE person_id = 3
--   AND note LIKE 'Receipt ID %'
--   AND (note LIKE '%Receipt ID 109.%' OR note LIKE '%Receipt ID 110.%' OR note LIKE '%Receipt ID 111.%' OR note LIKE '%Receipt ID 112.%' OR note LIKE '%Receipt ID 113.%' OR note LIKE '%Receipt ID 114.%' OR note LIKE '%Receipt ID 115.%' OR note LIKE '%Receipt ID 116.%' OR note LIKE '%Receipt ID 117.%' OR note LIKE '%Receipt ID 118.%' OR note LIKE '%Receipt ID 119.%' OR note LIKE '%Receipt ID 120.%' OR note LIKE '%Receipt ID 121.%' OR note LIKE '%Receipt ID 122.%' OR note LIKE '%Receipt ID 123.%' OR note LIKE '%Receipt ID 124.%' OR note LIKE '%Receipt ID 125.%' OR note LIKE '%Receipt ID 126.%' OR note LIKE '%Receipt ID 127.%' OR note LIKE '%Receipt ID 128.%');
--
-- SELECT COALESCE(SUM(amount),0) AS total_amount
-- FROM transactions
-- WHERE person_id = 3
--   AND note LIKE 'Receipt ID %'
--   AND (note LIKE '%Receipt ID 109.%' OR note LIKE '%Receipt ID 110.%' OR note LIKE '%Receipt ID 111.%' OR note LIKE '%Receipt ID 112.%' OR note LIKE '%Receipt ID 113.%' OR note LIKE '%Receipt ID 114.%' OR note LIKE '%Receipt ID 115.%' OR note LIKE '%Receipt ID 116.%' OR note LIKE '%Receipt ID 117.%' OR note LIKE '%Receipt ID 118.%' OR note LIKE '%Receipt ID 119.%' OR note LIKE '%Receipt ID 120.%' OR note LIKE '%Receipt ID 121.%' OR note LIKE '%Receipt ID 122.%' OR note LIKE '%Receipt ID 123.%' OR note LIKE '%Receipt ID 124.%' OR note LIKE '%Receipt ID 125.%' OR note LIKE '%Receipt ID 126.%' OR note LIKE '%Receipt ID 127.%' OR note LIKE '%Receipt ID 128.%');
--
-- SELECT * FROM person_balance_summary WHERE person_id = 3;
-- ============================================================
