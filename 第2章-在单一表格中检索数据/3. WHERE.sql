USE sql_store;

-- WHERE birth_date > '1990-01-01';
-- WHERE state = 'va'
-- WHERE state != 'VA'
-- WHERE points > 3000

# Exercise：获取今年下的订单
SELECT *
FROM orders
WHERE order_date >= '2025-01-01'