USE sql_invoicing;

-- SELECT
-- 	client_id,
-- 	SUM(invoice_total) AS total_sales
-- FROM invoices
-- WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
-- GROUP BY client_id
-- ORDER BY total_sales DESC;

-- SELECT 
-- 	c.state,
--     c.city,
-- 	SUM(invoice_total) AS total_sales
-- FROM invoices i
-- JOIN clients c USING (client_id)
-- GROUP BY state, city

# Exercise：date，付款方式，总付款金额
SELECT 
	p.date,
    pm.name AS payment_method,
    SUM(amount) AS total_payments
FROM payments p
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY p.date, pm.name
ORDER BY date