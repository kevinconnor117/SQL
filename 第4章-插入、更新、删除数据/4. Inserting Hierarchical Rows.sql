INSERT INTO orders (customer_id, order_date, status)
VALUE  (1, '2019-01-02', 1); # 此处插入在对应表中为主键的数据，必须选择存在的数据，即ID。如customer中必须有id为1的客户，填100就会报错

-- SELECT LAST_INSERT_ID()

INSERT INTO order_items () # 每一列都要插入，就不用指定了
VALUE 
	(LAST_INSERT_ID(), 1, 1, 2.95),
	(LAST_INSERT_ID(), 2, 1, 3.95)