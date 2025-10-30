USE sql_store;

-- SELECT 
-- 	first_name, last_name, points, 
--     (points + 10) * 100 AS 'discount factor'
-- FROM customers;

-- WHERE customer_id = 1
-- ORDER BY first_name

-- SELECT DISTINCT state
-- FROM customers;

# Exercise：获取所有产品的名字，单位价格，并创造一个新列用于表示提价110%
SELECT 
	name, 
    unit_price, 
    unit_price * 1.1 AS new_price
FROM products