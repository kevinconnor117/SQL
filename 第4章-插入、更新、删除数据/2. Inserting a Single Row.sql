-- INSERT INTO customers
-- VALUE (
-- 	DEFAULT, 
--     'John', 
--     'Smith', 
--     '1990-01-01',
--     NULL, # 或者写default也可以
--     'address',
--     'city',
--     'CA',
--     DEFAULT);

# 避免写NULL和DEFAULT，还可以给列重新排序
INSERT INTO customers (
	first_name,
    last_name, 
    birth_date,
    address,
    city,
    state)
VALUE (
    'John', 
    'Smith', 
    '1990-01-01',
    'address',
    'city',
    'CA')