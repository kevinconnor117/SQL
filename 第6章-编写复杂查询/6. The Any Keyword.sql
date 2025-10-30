# 选择至少有两张发票的客户
# 用子查询获得每个客户的发票数

-- SELECT *
-- FROM clients
-- WHERE client_id IN (
-- 	SELECT client_id
-- 	FROM invoices
-- 	GROUP BY client_id
-- 	HAVING COUNT(*) >= 2
-- );

SELECT *
FROM clients
WHERE client_id = ANY (
	SELECT client_id
	FROM invoices
	GROUP BY client_id
	HAVING COUNT(*) >= 2
)