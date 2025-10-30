-- DROP PROCEDURE IF EXISTS get_clients_by_state;

-- DELIMITER $$
-- CREATE PROCEDURE get_clients_by_state 
-- (
-- 	state CHAR(2) -- 两个字符的字符串
-- )
-- BEGIN
-- 	SELECT * FROM clients c
--     WHERE c.state = state;
-- END$$

-- DELIMITER ;

-- CALL get_clients_by_state('CA')

# Exercise：写一个根据客户id(INT)来获取其发票的过程
# 写在procedure里了，把数据类型换成INT就好