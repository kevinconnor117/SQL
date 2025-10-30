USE sql_invoicing;

-- DELETE FROM invoices # 直接执行会删除表格内所有数据
-- WHERE invoice_id = 1

DELETE FROM invoices
WHERE client_id = 
			(SELECT client_id
			FROM clients
			WHERE name = 'Myworks')