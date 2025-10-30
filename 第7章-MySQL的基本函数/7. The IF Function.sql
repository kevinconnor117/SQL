-- SELECT 
-- 	order_id,
--     order_date,
--     IF(
-- 		YEAR(order_date) = YEAR(NOW()), 
--         'Active', 
--         'Archived') AS category
-- FROM orders

# Exercise：返回产品id，名称，被订购的次数，频率
SELECT 
	oi.product_id, 
    p.name,
    COUNT(*) AS orders,
    IF (COUNT(*) > 1, 'Many times', 'Once') AS frequency
FROM order_items oi
JOIN products p USING (product_id)
GROUP BY oi.product_id, p.name