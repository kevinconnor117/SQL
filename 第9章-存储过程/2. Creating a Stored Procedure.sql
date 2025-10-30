-- DELIMITER $$
-- CREATE PROCEDURE get_clients()
-- BEGIN
-- 	SELECT * FROM clients;
-- END$$

-- DELIMITER ;

-- CALL get_clients()

# Exercise：创造一个过程叫get_invoices_with_balance，查询有结余即balance > 0的发票
DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT * FROM invoices_with_balance
    WHERE balance > 0;
END$$

DELIMITER ;