USE sql_store;

-- WHERE birth_date <= '1990-01-01' AND points <= 1000
-- WHERE NOT (birth_date > '1990-01-01' OR points > 1000)

-- WHERE birth_date > '1990-01-01' OR (points > 1000 AND state = 'VA');
-- WHERE birth_date > '1990-01-01' AND points > 1000;

# Exercise：获得订单编号为6，且总价格大于30的项目

SELECT *
FROM order_items
WHERE order_id = 6 AND quantity * unit_price > 30