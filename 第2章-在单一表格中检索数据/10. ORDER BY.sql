USE sql_store;

SELECT first_name, last_name, 10 + 10 AS points 
	# Not need to select the target column in SQL
FROM customers
ORDER BY points, birth_date;
-- ORDER BY state DESC, first_name DESC 
	# state first, then first_name
-- ORDER BY first_name DESC 
	# DESC=descending降序

# Exercise：order_id等于2，且按总价降序排序
SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY quantity * unit_price DESC;

SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC