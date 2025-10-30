-- USE sql_store;

-- SELECT 
--     o.order_id,
-- 	c.first_name, 
-- 	sh.name AS shipper
-- FROM orders o
-- JOIN customers c 
--     USING (customer_id)	-- ON c.customer_id = o.customer_id
-- LEFT JOIN shippers sh 
-- 	USING (shipper_id);

-- SELECT *
-- FROM order_items oi
-- JOIN order_item_notes oin
-- 	USING (order_id, product_id) # 多个pk

# Exercise：发票日期，顾客，数量，支付方式
USE sql_invoicing;

SELECT 
	p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_methods
FROM payments p
JOIN clients c
	USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id