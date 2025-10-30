USE sql_store;

-- WHERE phone IS NULL
-- WHERE phone IS NOT NULL

# Exercise：查询还没有发货的订单
SELECT *
FROM orders
WHERE shipped_date IS NULL;