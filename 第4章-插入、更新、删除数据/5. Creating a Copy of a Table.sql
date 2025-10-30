-- CREATE TABLE orders_archived AS
-- SELECT * FROM orders
# 这样的插入不会带入表格属性，即PK和AI等

-- INSERT INTO orders_archived
-- SELECT *
-- FROM orders
-- WHERE order_date < '2019-01-01'

# Exercise：创造发票表部分记录的复制，不要客户名id列，而是要客户名字列，同时只复制支付过的发票
USE sql_invoicing;

CREATE TABLE invoices_archived AS
SELECT 
	i.invoice_id, i.number, 
    c.name AS client,
    i.invoice_total, i.payment_total, i.invoice_date, i.payment_date, i.due_date
FROM invoices i
JOIN clients c USING(client_id)
WHERE i.payment_date IS NOT NULL

# 如果再次执行会出现错误，因为已经存在了invoices_archived表了