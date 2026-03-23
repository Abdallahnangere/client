INSERT INTO transactions
  (person_id, type, amount, sender, receiver, transaction_date, bank, reference_number, status, note)
VALUES
  (1, 'DEBIT', 3429500.0,
   'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
   NULL,
   NULL, NULL, 'SUCCESSFUL',
   'Calculator — expression: 55,233,000 - 51,803,500'),

  (1, 'DEBIT', 4016307.27,
   'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
   NULL,
   NULL, NULL, 'SUCCESSFUL',
   'Calculator — expression: ...07.26643598615917 - 55,803,500'),

  (1, 'DEBIT', 5321750.17,
   'MAHMOUD IBRAHIM WADA', 'SAID ABDULLAHI ABDULMUDALLIB',
   NULL,
   NULL, NULL, 'SUCCESSFUL',
   'Calculator — expression: ...50.174216027874564 - 77,138,500');
