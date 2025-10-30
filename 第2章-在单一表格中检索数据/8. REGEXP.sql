USE sql_store;

-- WHERE last_name REGEXP 'field'
-- WHERE last_name REGEXP '^field'
-- WHERE last_name REGEXP 'field$'
-- WHERE last_name REGEXP 'field$|mac|rose'

-- WHERE last_name REGEXP '[gim]e'
-- ge, ie, me
-- WHERE last_name REGEXP 'e[fmq]'
-- ef, em, eq
-- WHERE last_name REGEXP '[a-h]e'
-- ae, be, ce, de, fe, ge, he

# Exercise：
# 1获取名字叫elka或ambur的客户；
SELECT *
FROM customers
-- WHERE first_name = 'elka' OR first_name = 'ambur'
WHERE first_name REGEXP 'elka|ambur'; # 翻译问题

# 2获取姓氏的结尾是EY或ON的客户;
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

#3获取姓氏以MY或包括SE的；
SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';

# 4姓氏包括B且跟随R或U的；
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';