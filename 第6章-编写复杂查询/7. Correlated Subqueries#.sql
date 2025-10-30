# 查询工资大于其部门office平均的职员
-- USE sql_hr;

-- SELECT *
-- FROM employees e
-- WHERE salary > (
-- 	SELECT AVG(salary)
--     FROM employees
--     WHERE office_id = e.office_id 
-- );
# 读取第一行的数据e1.office_id，计算满足e1.office_id = office_id的所有员工的平均薪资（子查询）
# 再比较e1.office_id的salary是否大于这个平均值（外查询）

# DEEPSEEK的替代方案，使用join，只需要计算一次平均值
-- SELECT e.*
-- FROM employees e
-- JOIN (
--     SELECT office_id, AVG(salary) as avg_salary
--     FROM employees
--     GROUP BY office_id
-- ) office_avg ON e.office_id = office_avg.office_id
-- WHERE e.salary > office_avg.avg_salary

# Exercise：获取每个客户高于其客户发票平均值的发票
USE sql_invoicing;
SELECT *
FROM invoices i
WHERE invoice_total > (
	SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
)