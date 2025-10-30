-- SELECT *
-- FROM clients
-- WHERE client_id NOT IN (
-- 	SELECT DISTINCT client_id
--     FROM invoices
-- );
-- # ↑↓代码功能一致，但上方代码更直接易读
-- SELECT *
-- FROM clients
-- LEFT JOIN invoices USING (client_id)
-- WHERE invoice_id IS NULL

# Exercise：找到订购了lettuce的客户，要客户的id，名和姓。使用子查询和连接两种方法
USE sql_store;

-- SELECT DISTINCT
-- 	customer_id, first_name, last_name
-- FROM customers
-- WHERE customer_id IN (
-- 	SELECT customer_id
--     FROM orders
--     WHERE order_id IN (
-- 		SELECT order_id
--         FROM order_items
--         WHERE product_id = 3
--         )
-- );

# 这个方法揭示了三个表格中的内在联系，而且过滤条件也比较清晰
SELECT DISTINCT
	c.customer_id, c.first_name, c.last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3;

-- SELECT DISTINCT
-- 	c.customer_id, c.first_name, c.last_name
-- FROM customers c
-- WHERE customer_id IN (
-- 	SELECT o.customer_id
--     FROM orders o
--     JOIN order_items oi USING (order_id)
--     WHERE oi.product_id = 3
-- )