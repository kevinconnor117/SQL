-- SELECT 
-- 	c.customer_id, c.first_name, 
--     o.order_id,
--     sh.name AS shipper
-- FROM customers c
-- LEFT JOIN orders o ON c.customer_id = o.customer_id
-- LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
-- ORDER BY c.customer_id;

# Exercise：显示所有订单的发货状态
SELECT 
	o.order_date, o.order_id,
    c.first_name AS customer,  
    sh.name AS shipper,
    os.name AS status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id # 无论有没有发货/有没有登记快递商的名字/有没有shipperid，都链接orders表的数据至shippers表
LEFT JOIN order_statuses os ON o.status = os.order_status_id
ORDER BY status