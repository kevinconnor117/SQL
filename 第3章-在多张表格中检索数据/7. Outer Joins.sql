-- SELECT 
-- 	c.customer_id, c.first_name, 
--     o.order_id
-- FROM customers c
-- LEFT JOIN orders o ON c.customer_id = o.customer_id
-- ORDER BY c.customer_id;

-- SELECT 
-- 	c.customer_id, c.first_name, 
--     o.order_id
-- FROM customers c
-- RIGHT JOIN orders o ON c.customer_id = o.customer_id
-- ORDER BY c.customer_id;

# Exercise：观察产品表中的每个产品被订了几次
SELECT 
	p.product_id, p.name, 
    oi.quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
ORDER BY p.product_id