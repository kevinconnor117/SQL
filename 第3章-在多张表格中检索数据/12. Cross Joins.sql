-- SELECT 
-- 	c.first_name AS customer,
--     p.name AS product
-- FROM customers c
-- CROSS JOIN products p
-- ORDER BY c.first_name;

-- SELECT 
-- 	c.first_name AS customer,
--     p.name AS product
-- FROM customers c, products p
-- ORDER BY c.first_name

# Exercise：shipper and products
USE sql_store;

SELECT 
	sh.name AS shipper,
    p.name AS product
FROM shippers sh, products p 
ORDER BY sh.name;

SELECT
	sh.name AS shipper,
    p.name AS product
FROM shippers sh
CROSS JOIN products p
ORDER BY sh.name;