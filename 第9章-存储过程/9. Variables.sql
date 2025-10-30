USE `sql_invoicing`;
DROP procedure IF EXISTS `get_risk_factor`;

USE `sql_invoicing`;
DROP procedure IF EXISTS `sql_invoicing`.`get_risk_factor`;
;

DELIMITER $$
USE `sql_invoicing`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_risk_factor`()
BEGIN
	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9, 2);
    DECLARE invoices_count INT;
    
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices;
-- 此处的两个local variable只参与了中间的计算过程，一旦程序结束就被抹去

    SET risk_factor = invoices_total / invoices_count * 5;

	SELECT risk_factor;
-- risk_factor = invoices_total / invoices_count * 5
END$$

DELIMITER ;
;

