USE sql_invoicing;

SELECT *
FROM (
	SELECT
		c.client_id, c.name,
		(SELECT SUM(invoice_total)
			FROM invoices i
			WHERE client_id = c.client_id) AS total_sales,
		(SELECT AVG(invoice_total) FROM invoices) AS average,
		(SELECT total_sales - average) AS difference
	FROM clients c
) AS sales_summary
WHERE total_sales IS NOT NULL