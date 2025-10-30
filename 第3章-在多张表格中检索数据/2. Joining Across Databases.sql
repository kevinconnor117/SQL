-- SELECT *
-- FROM order_items AS oi
-- JOIN sql_inventory.products AS p ON oi.product_id = p.product_id

USE sql_inventory;
SELECT *
FROM sql_store.order_items AS oi
JOIN products AS p ON oi.product_id = p.product_id