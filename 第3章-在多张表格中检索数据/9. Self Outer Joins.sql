USE sql_hr;

SELECT 
	e.employee_id, e.first_name,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m ON e.reports_to = m.employee_id # 不管有没有管理人员，都返回每一个员工的数据