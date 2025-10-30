USE sql_store;

-- SELECT *
-- FROM customers
-- LIMIT 6, 3 # 跳过前6个，选择第7-9个

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3