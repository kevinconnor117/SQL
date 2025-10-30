# Exercise：返回今年的所有订单
USE sql_store;

SELECT * 
FROM orders
WHERE YEAR(order_date) = YEAR(NOW())