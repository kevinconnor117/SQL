-- 找到从来没有被订购过的产品
-- USE sql_store;

-- SELECT *
-- FROM products
-- WHERE product_id NOT IN(
-- 	SELECT DISTINCT product_id # 不加distinct也可以
-- 	FROM order_items
-- )

# Exercise：找到没有发票的客户
USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id NOT IN (
	SELECT DISTINCT client_id
    FROM invoices
)