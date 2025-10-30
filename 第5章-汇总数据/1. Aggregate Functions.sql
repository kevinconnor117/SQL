-- USE sql_invoicing;

-- SELECT 
-- -- 	MAX(payment_date) AS highest, # 日期也可以表示
-- 	MAX(invoice_total) AS highest,
--     MIN(invoice_total) AS lowest,
--     AVG(invoice_total) AS average,
--     SUM(invoice_total * 1.1) AS total,
-- --     COUNT(invoice_total) AS number_of_invoices,
-- --     COUNT(payment_date) AS count_of_payments # 空值无法计数
-- -- 	   COUNT(DISTINCT client_id) AS total_records, # 不对重复值计数
-- 	COUNT(*) AS total_records
-- FROM invoices
-- WHERE invoice_date > '2019-07-01'

# Exercise：对发票表，返回2019上半年、下半年和全年的总销售额，总付款金额和预期金额
USE sql_invoicing;

SELECT 
	'First half of 2019' AS data_range,
	SUM(invoice_total),
    SUM(payment_total),
    SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 
	'Second half of 2019' AS data_range,
	SUM(invoice_total),
    SUM(payment_total),
    SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT 
	'Total' AS data_range,
	SUM(invoice_total),
    SUM(payment_total),
    SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31'