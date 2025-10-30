-- SELECT
-- 	client_id,
-- 	SUM(invoice_total) AS total_sales,
-- 	COUNT(*) AS number_of_invoices
-- FROM invoices
-- # 此处不能写WHERE，因为还没有对数据进行分组
-- GROUP BY client_id
-- HAVING total_sales > 500 AND number_of_invoices > 5;

# Exercise：查询在弗吉尼亚、并且花费了超过100美金的客户
# sql的合并并不需要像stata的merge一样挑选一对多或者多对一，可以直接运行
USE sql_store;

SELECT 
	c.customer_id, c.first_name, c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
-- WHERE state = 'VA'
GROUP BY c.customer_id, c.first_name, c.last_name # 此处直接按顾客分组即可，不需要思考每个订单的总价再加总
HAVING total_sales > 100

# 尝试
-- SELECT 
-- 	o.customer_id,
-- 	o.order_id,
--     SUM(oi.quantity * oi.unit_price)
-- FROM orders o
-- JOIN order_items oi USING (order_id)
-- GROUP BY order_id