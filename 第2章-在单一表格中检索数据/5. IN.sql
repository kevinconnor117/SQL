USE sql_store;

SELECT *
FROM customers
-- WHERE state = 'VA' OR state = 'GA' OR state = 'FL' 
WHERE state NOT IN ('VA', 'GA', 'FL') ;

# Exercise：得到现货库存数量为49，38，72的产品
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72); 