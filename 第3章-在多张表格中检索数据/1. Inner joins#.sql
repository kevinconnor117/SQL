# 基本语法
-- SELECT *
-- FROM orders
-- INNER JOIN customers ON orders.customer_id = customers.customer_id;
-- 'INNER' can be omitted

# 前缀指代特定表
-- SELECT order_id, orders.customer_id, first_name, last_name
-- FROM orders
-- JOIN customers ON orders.customer_id = customers.customer_id;

# 简称alias以减少重复
-- SELECT order_id, o.customer_id, first_name, last_name 
-- FROM orders AS o
-- JOIN customers AS c ON o.customer_id = c.customer_id;

# Exercise：链接order_items和products，得到产品id和名字，和items表的数量和单价
SELECT order_id, oi.product_id, name, oi.unit_price, quantity
FROM order_items AS oi
JOIN products AS p ON oi.product_id = p.product_id
-- 先选中所有列*，再挑选需要的列