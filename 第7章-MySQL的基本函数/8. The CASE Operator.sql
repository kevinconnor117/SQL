-- SELECT 
-- 	order_id,
-- 	CASE
-- 		WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
--         WHEN YEAR(order_date) = YEAR(NOW()) -1 THEN 'Last Year'
--         WHEN YEAR(order_date) < YEAR(NOW()) -1 THEN 'Archived'
--         ELSE 'Future'
-- 	END AS category
-- FROM orders;

# Exercise：客户积分分组练习
SELECT 
	CONCAT(first_name, ' ', last_name) AS customer,
    points,
	CASE
		WHEN points > 3000 THEN 'Gold'
        WHEN points >= 2000 THEN 'Silver'
        ELSE 'BRONZE'
	END AS category
FROM customers
ORDER BY points DESC