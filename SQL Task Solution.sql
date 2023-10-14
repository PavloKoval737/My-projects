SELECT 
    'Transaction' AS Transaction_Type, 
    t.status AS Transaction_Status, 
    p.name AS Psp_Name, 
    t.amount AS Amount, 
    c.iso_code AS Currency, 
    pc.bin_country AS Bin_Country 
FROM transactions t 
INNER JOIN Psp p ON t.psp_id = p.Id 
INNER JOIN Currencies c ON t.currency_id = c.id 
INNER JOIN Payment_credentials pc ON t.payment_credentials_id = pc.id 
 
UNION ALL 
 
SELECT 
    'Refund' AS Transaction_Type, 
    r.refund_status AS Transaction_Status, 
    p.name AS Psp_Name, 
    r.amount AS Amount, 
    c.iso_code AS Currency, 
    pc.bin_country AS Bin_Country 
FROM refunds r 
INNER JOIN Psp p ON r.psp_id = p.Id 
INNER JOIN Currencies c ON r.currency_id = c.id 
INNER JOIN Payment_credentials pc ON r.payment_credentials_id = pc.id 
 
UNION ALL 
 
SELECT 
    'Chargeback' AS Transaction_Type, 
    chb.chb_status AS Transaction_Status, 
    p.name AS Psp_Name, 
    chb.amount AS Amount, 
    c.iso_code AS Currency, 
    pc.bin_country AS Bin_Country 
FROM chargebacks chb 
INNER JOIN Psp p ON chb.psp_id = p.Id 
INNER JOIN Currencies c ON chb.currency_id = c.id 
INNER JOIN Payment_credentials pc ON chb.payment_credentials_id = pc.id;