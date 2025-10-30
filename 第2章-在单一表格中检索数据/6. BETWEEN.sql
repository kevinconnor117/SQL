USE sql_store;

SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

# Exercise：查询出生日期在1990-2000之间的客户
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';