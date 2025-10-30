USE sql_store;

-- SELECT 
-- 	order_id,
--     IFNULL(shipper_id, 'Not assigned') AS shipper
-- FROM orders; 

-- SELECT 
-- 	order_id,
--     COALESCE(shipper_id, comments, 'Not assigned') AS shipper
-- FROM orders;

# Exercise：返回顾客和电话，顾客列是全名，电话列如果没有电话就写unknown
SELECT 
	CONCAT(first_name, ' ' ,last_name) AS customer,
    COALESCE(phone, 'Unknown') AS phone
FROM customers