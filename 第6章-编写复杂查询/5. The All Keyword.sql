-- 筛选出大于客户3“所有”（即比每一个客户3的发票额都大）发票额的发票alter
-- 以下两个方法一个理解为“比所有都大”，一个理解为“比最大的大”
USE sql_invoicing;

-- SELECT *
-- FROM invoices
-- WHERE invoice_total > (
-- 	SELECT MAX(invoice_total)
-- 	FROM invoices
-- 	WHERE client_id = 3
-- )

SELECT *
FROM invoices
WHERE invoice_total > ALL (
	SELECT invoice_total
    FROM invoices
    WHERE client_id = 3
)