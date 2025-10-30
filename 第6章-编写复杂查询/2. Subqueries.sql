-- USE sql_store;

-- SELECT *
-- FROM products
-- WHERE unit_price > (
-- 	SELECT unit_price
--     FROM products
--     WHERE product_id = 3
-- )

# Exercise：找到薪资在平均值以上的雇员
USE sql_hr;

SELECT *
FROM employees
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
)