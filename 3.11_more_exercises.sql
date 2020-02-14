# 1 How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
DROP TABLE manager_pay;

CREATE TEMPORARY TABLE manager_pay AS 
SELECT
	CONCAT(first_name, ' ', last_name) AS `Manager`,
	dept_name,
	salary
FROM employees.employees
JOIN employees.dept_manager USING(emp_no)
JOIN employees.departments ON departments.dept_no = dept_manager.dept_no
JOIN employees.salaries USING(emp_no)
WHERE emp_no IN (
	SELECT emp_no
	FROM employees.dept_manager
	WHERE to_date > CURDATE())
AND salaries.to_date > NOW();

SELECT * FROM manager_pay;

SELECT 
	dept_name,
	AVG(salary) AS `dept_avg_salary`
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments ON 
GROUP BY dept_name
;


