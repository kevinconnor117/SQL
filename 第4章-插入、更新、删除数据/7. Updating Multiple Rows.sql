-- USE sql_invoicing;

-- UPDATE invoices
-- SET 
-- 	payment_total = invoice_total * 0.5, 
-- 	payment_date = due_date
-- WHERE client_id IN (3, 4);

# Exercise：给所有1990年以前出生的人加50积分
USE	sql_store;

UPDATE customers
SET	points = points + 50
WHERE birth_date < '1990-01-01'