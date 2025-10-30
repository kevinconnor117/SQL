USE sql_invoicing;

-- CREATE VIEW sales_by_client AS 
-- SELECT 
-- 	c.client_id,
--     c.name,
--     SUM(invoice_total) AS total_sales
-- FROM clients c
-- JOIN invoices i USING (client_id)
-- GROUP BY client_id, name;

-- SELECT * 
-- FROM sales_by_client
-- WHERE total_sales > 500
-- ORDER BY total_sales DESC;

# Exercise：创建视图，包括每个客户的balance结余
CREATE VIEW clients_balance AS
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name