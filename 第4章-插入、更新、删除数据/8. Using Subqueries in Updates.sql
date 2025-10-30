USE sql_invoicing;

-- UPDATE invoices
-- SET 
-- 	payment_total = invoice_total * 0.5, 
-- 	payment_date = due_date
-- WHERE client_id = 
-- 			(SELECT client_id
-- 			FROM clients
-- 			WHERE name = 'Myworks');
            
-- UPDATE invoices
-- SET 
-- 	payment_total = invoice_total * 0.5, 
-- 	payment_date = due_date
-- WHERE client_id IN 
-- 			(SELECT client_id
-- 			FROM clients
-- 			WHERE state IN ('CA', 'NY'))

-- UPDATE invoices
-- SET 
-- 	payment_total = invoice_total * 0.5, 
-- 	payment_date = due_date
-- -- SELECT * 
-- -- FROM invoices
-- WHERE payment_date IS NULL

# Exercise：order中，为超过3000积分的顾客更新comments订单注释为'Gold Customer'
USE sql_store;

UPDATE orders
SET comments = 'Gold Customer'
WHERE customer_id IN 
			(SELECT customer_id
			FROM customers
			WHERE points > 3000)

# 以下代码不行，会返回5、5、7、7，而不是5、7
-- SELECT customer_id
-- FROM orders o
-- JOIN customers c USING(customer_id)
-- WHERE points > 3000
