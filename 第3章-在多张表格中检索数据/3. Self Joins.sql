USE sql_hr;
 
# 两个表的alias设置为不一样的
-- SELECT * 
-- FROM employees AS e
-- JOIN employees AS m ON e.reports_to = m.employee_id;

# 形成一个组织架构图
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees AS e
JOIN employees AS m ON e.reports_to = m.employee_id;