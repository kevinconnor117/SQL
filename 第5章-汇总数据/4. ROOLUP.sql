USE sql_invoicing;

-- SELECT
-- 	c.state,
--     c.city,
-- 	SUM(invoice_total) AS total_sales
-- FROM invoices i
-- JOIN clients c USING (client_id)
-- GROUP BY state, city WITH ROLLUP

# Exercise：查询每个付款方式的总金额
SELECT
	pm.name AS payment_method,
    SUM(amount) AS total
FROM payments p
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP
ORDER BY total