USE sql_store;

-- WHERE last_name LIKE 'b____y';
-- WHERE last_name LIKE '_____y'
-- WHERE last_name LIKE '%b%'

# Exercise：获取地址包括trail或avenue，而且电话号码最后一位是9的客户
SELECT *
FROM customers
WHERE (address LIKE '%trail%' OR address LIKE '%avenue%') 
	AND phone LIKE '%9'