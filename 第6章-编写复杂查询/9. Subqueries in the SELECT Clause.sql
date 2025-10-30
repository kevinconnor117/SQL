USE sql_invoicing;

-- SELECT 
-- 	invoice_id,
--     invoice_total,
--     (SELECT AVG(invoice_total)
-- 		FROM invoices) AS invoice_average,
-- 	invoice_total -  (SELECT invoice_average) AS difference # 这一句不是标准的sql语句，最好不要在同一层查询里写别名
-- FROM invoices;

# Exercise：返回每个客户的总销售额，平均值和差异
SELECT
	c.client_id, c.name,
    (SELECT SUM(invoice_total)
		FROM invoices i
        WHERE client_id = c.client_id) AS total_sales,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
	(SELECT total_sales - average) AS difference
FROM clients c;

# 避免相关子查询的写法
-- SELECT
--     c.client_id,
--     c.name,
--     SUM(invoice_total) AS total_sales,
--     avg_table.average,
--     SUM(invoice_total) - avg_table.average AS difference
-- FROM clients c
-- LEFT JOIN invoices i USING (client_id)
-- JOIN (
--     SELECT AVG(invoice_total) AS average
--     FROM invoices
-- ) avg_table
-- GROUP BY
--     c.client_id,
--     c.name,
--     avg_table.average;