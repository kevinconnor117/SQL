-- DROP PROCEDURE IF EXISTS get_clients_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_clients_by_state 
-- (
-- 	state CHAR(2)
-- )
-- BEGIN
-- 	IF state IS NULL THEN
-- 		SET state = 'CA';
-- 	END IF;
--     
-- 	SELECT * FROM clients c
--     WHERE c.state = state;
-- END$$
-- DELIMITER ;
-- CALL get_clients_by_state(NULL);

-- DROP PROCEDURE IF EXISTS get_clients_by_state;
-- DELIMITER $$
-- CREATE PROCEDURE get_clients_by_state 
-- (
-- 	state CHAR(2)
-- )
-- BEGIN
-- 	IF state IS NULL THEN
-- 		SELECT * FROM clients;
-- 	ELSE
-- 		SELECT * FROM clients c
-- 		WHERE c.state = state;
-- 	END IF;
-- END$$
-- DELIMITER ;
-- CALL get_clients_by_state(NULL);

DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state 
(
	state CHAR(2)
)
BEGIN
		SELECT * FROM clients c
		WHERE c.state = IFNULL(state, c.state); #TRICK：如果state是null，则c.state=c.state，返回了所有值
END$$
DELIMITER ;
CALL get_clients_by_state(NULL);

# Exercise：创建一个过程get_payments，包括两个参数client_id和payment_method_id，如果两个值都是空值就返回所有值
# 写在存储过程里了