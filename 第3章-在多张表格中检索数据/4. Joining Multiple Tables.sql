-- USE sql_store;

-- SELECT 
-- 	o.order_id, o.order_date, 
--     c.first_name, c.last_name, 
--     os.name AS status
-- FROM orders AS o
-- JOIN customers AS c ON o.customer_id = c.customer_id
-- JOIN order_statuses AS os ON o.status = os.order_status_id

# Exercise：client，payment，payment methods生成一份报告，显示付款和更多详细信息
USE sql_invoicing;

SELECT
	p.date, p.invoice_id, p.amount,
    c.name,
    pm.name AS payment_method
FROM payments AS p
JOIN payment_methods AS pm ON p.payment_method = pm.payment_method_id
JOIN clients AS c ON p.client_id = c.client_id