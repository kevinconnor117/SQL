-- 找到有发票的客户
-- SELECT *
-- FROM clients
-- WHERE client_id IN (
-- 	SELECT DISTINCT client_id
-- 	FROM invoices
-- );

-- SELECT *
-- FROM clients c
-- WHERE EXISTS (
-- 	SELECT DISTINCT client_id
-- 	FROM invoices
--     WHERE client_id = c.client_id
-- );

# Exercise：找到从来没有被订购过的产品
USE sql_store;

SELECT *
FROM products p
WHERE NOT EXISTS (
	SELECT DISTINCT product_id
    FROM order_items
    WHERE product_id = p.product_id
);