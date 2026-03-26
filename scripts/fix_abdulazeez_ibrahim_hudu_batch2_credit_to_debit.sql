-- ============================================================
-- Capital Management System
-- Repair Script: Abdulazeez Ibrahim Hudu Batch 2
-- Purpose: Change mistakenly inserted CREDIT rows to DEBIT
-- Scope: Only the 20 rows from seed_abdulazeez_ibrahim_hudu_batch2.sql
-- ============================================================

BEGIN;

UPDATE transactions
SET type = 'DEBIT'
WHERE person_id = 6
  AND type = 'CREDIT'
  AND (
    reference_number IN (
      '250815010100461013225998',
      '250822010100611606066491',
      '000017250829192329674604975619',
      '250913010100098396767292',
      '250920010100243627286001',
      '250926010100372008880074',
      '251003010100537117787640',
      '251010010100702182702571',
      '251010020100709288188997',
      '000017251017114909526941550990',
      'STAJNG25101784089668',
      '00118980424102025192632',
      '000017251024171507055314907164',
      '00118980424102025200458',
      '000017251031171422967798351531',
      '000017251031174048171098369978',
      '251102020100246427854065',
      '0000172511211634446307915419690',
      '00001725118150939511498235478'
    )
    OR (
      transaction_date IS NULL
      AND reference_number IS NULL
      AND amount = 50000.00
      AND sender = 'MAHMOUD IBRAHIM WADA'
      AND receiver = 'ABDULAZEEZ IBRAHIM HUDU'
      AND bank = 'OPay'
      AND note = 'OPay transfer to Abdulazeez Ibrahim Hudu - confirmation screen only, details incomplete'
    )
  );

-- ============================================================
-- VERIFY:
-- 1. Updated DEBIT rows should be 20
-- 2. Matching CREDIT rows should be 0
-- 3. Total amount should be 49,150,000.00
-- ============================================================

SELECT COUNT(*) AS corrected_debit_rows,
       COALESCE(SUM(amount), 0) AS corrected_debit_total
FROM transactions
WHERE person_id = 6
  AND type = 'DEBIT'
  AND (
    reference_number IN (
      '250815010100461013225998',
      '250822010100611606066491',
      '000017250829192329674604975619',
      '250913010100098396767292',
      '250920010100243627286001',
      '250926010100372008880074',
      '251003010100537117787640',
      '251010010100702182702571',
      '251010020100709288188997',
      '000017251017114909526941550990',
      'STAJNG25101784089668',
      '00118980424102025192632',
      '000017251024171507055314907164',
      '00118980424102025200458',
      '000017251031171422967798351531',
      '000017251031174048171098369978',
      '251102020100246427854065',
      '0000172511211634446307915419690',
      '00001725118150939511498235478'
    )
    OR (
      transaction_date IS NULL
      AND reference_number IS NULL
      AND amount = 50000.00
      AND sender = 'MAHMOUD IBRAHIM WADA'
      AND receiver = 'ABDULAZEEZ IBRAHIM HUDU'
      AND bank = 'OPay'
      AND note = 'OPay transfer to Abdulazeez Ibrahim Hudu - confirmation screen only, details incomplete'
    )
  );

SELECT COUNT(*) AS remaining_credit_rows
FROM transactions
WHERE person_id = 6
  AND type = 'CREDIT'
  AND (
    reference_number IN (
      '250815010100461013225998',
      '250822010100611606066491',
      '000017250829192329674604975619',
      '250913010100098396767292',
      '250920010100243627286001',
      '250926010100372008880074',
      '251003010100537117787640',
      '251010010100702182702571',
      '251010020100709288188997',
      '000017251017114909526941550990',
      'STAJNG25101784089668',
      '00118980424102025192632',
      '000017251024171507055314907164',
      '00118980424102025200458',
      '000017251031171422967798351531',
      '000017251031174048171098369978',
      '251102020100246427854065',
      '0000172511211634446307915419690',
      '00001725118150939511498235478'
    )
    OR (
      transaction_date IS NULL
      AND reference_number IS NULL
      AND amount = 50000.00
      AND sender = 'MAHMOUD IBRAHIM WADA'
      AND receiver = 'ABDULAZEEZ IBRAHIM HUDU'
      AND bank = 'OPay'
      AND note = 'OPay transfer to Abdulazeez Ibrahim Hudu - confirmation screen only, details incomplete'
    )
  );

COMMIT;
