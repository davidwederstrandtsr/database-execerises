USE join_examples;
# 1
SELECT * FROM users;
SELECT * FROM roles;

# 2
# JOIN
SELECT *
FROM users
JOIN roles ON users.id = roles.id;

# LEFT JOIN 
SELECT *
FROM users
LEFT JOIN roles ON roles.id = users.id;

# RIGHT JOIN
SELECT *
FROM users
RIGHT JOIN roles ON roles.id = users.id;

# 3 COUNT
SELECT 
	r.name, 
	COUNT(*) AS count_all,
	COUNT(u.id) AS count_user # will only count if not null 
FROM roles r
LEFT JOIN users u ON u.role_id = r.id
GROUP BY r.name;


# EMPLOYEES DB

USE employees;



# 2
SELECT 
	departments.dept_name AS "Department Name",
	CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY departments.dept_name;

# 2 revisited
SELECT 
	dept_name AS "Department Name",
	CONCAT(first_name, ' ', last_name) AS "Department Manager"
FROM departments d
JOIN dept_manager dm ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date > NOW();



# 3
SELECT 
	departments.dept_name AS "Department NAME",
	CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND employees.gender LIKE 'F'
ORDER BY departments.dept_name;

# 3 revisited
SELECT 
	d.dept_name AS `Department Name`,
	CONCAT(first_name, ' ', last_name) AS `Manager Name`
FROM employees e
JOIN dept_manager dm ON dm.emp_no = e.emp_no
JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date > curdate()
AND gender = 'F'
ORDER BY `Department Name`;



# 4
SELECT
	t.title AS "Title",
	COUNT(*) AS "COUNT"
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN titles AS t ON t.emp_no = e.emp_no
WHERE de.dept_no = "d009" AND de.to_date = '9999-01-01' AND t.to_date = "9999-01-01"
GROUP BY Title
ORDER BY Title;

# 4 revisited
SELECT 
	title AS "Title",
	COUNT(*) AS "Count"
FROM departments d
JOIN dept_emp de ON  de.dept_no = d.dept_no
JOIN titles t ON t.emp_no = de.emp_no
WHERE t.to_date > curdate()
	AND de.to_date > CURDATE() 
	AND dept_name = "Customer Service"
GROUP BY title;



# 5
SELECT 
	d.dept_name AS "Department NAME",
	CONCAT(e.first_name, ' ', e.last_name) AS "NAME",
	s.salary AS "Salary"
FROM employees AS e
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
JOIN salaries AS s ON s.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = "9999-01-01"
ORDER BY d.dept_name;

# 5 revisited
SELECT 
	dept_name AS `Department Name`,
	CONCAT(first_name, ' ', last_name) AS `Manager Name`,
	salary AS `Salary`
FROM salaries s
JOIN dept_manager dm ON dm.emp_no = s.emp_no
JOIN employees e ON e.emp_no = dm.emp_no
JOIN departments d ON d.dept_no = dm.dept_no
WHERE s.to_date > CURDATE()
	AND dm.to_date > CURDATE()
	ORDER BY `Department Name`;


# 6
SELECT
	d.dept_no,
	d.dept_name,
	COUNT(d.dept_no) AS `Number of employees`
FROM departments d
JOIN dept_emp de USING (dept_no)
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no;

# 6 revisited
SELECT 
	dept_no,
	dept_name,
	COUNT(*) AS `num_employees`
FROM departments d
JOIN dept_emp de USING (dept_no)
WHERE to_date > NOW()
GROUP BY dept_no;



# 7 
SELECT
	d.dept_name,
	AVG(s.salary) AS "average_salary"
FROM departments d
JOIN dept_emp de ON de.dept_no = d.dept_no
JOIN salaries s ON s.emp_no = de.emp_no
WHERE s.to_date = '9999-01-01' AND de.to_date = "9999-01-01"
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

# 7 revisited
SELECT 
    dept_name,
    AVG(salary) AS `Highest Average Salary`
FROM salaries s
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE de.to_date > NOW()
	AND s.to_date > NOW()
GROUP BY dept_name
ORDER BY `Highest Average Salary` DESC
LIMIT 1;



# 8 
SELECT
	first_name,
	last_name
FROM employees e 
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no 
WHERE s.to_date = '9999-01-01' 
	AND de.to_date = "9999-01-01" 
	AND d.dept_no = 'd001'
ORDER BY salary DESC
LIMIT 1;

# 8 revisited
SELECT 
	first_name,
	last_name,
	salary
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE s.to_date > CURDATE()
	AND de.to_date > CURDATE()
	AND dept_name = "Marketing"
ORDER BY salary DESC
LIMIT 1;



# 9
SELECT
	first_name,
	last_name,
	s.salary,
	d.dept_name
FROM employees e
JOIN dept_manager dm ON dm.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = dm.emp_no
JOIN departments d ON d.dept_no = dm.dept_no
WHERE s.to_date = '9999-01-01' AND dm.to_date = "9999-01-01"
ORDER BY salary DESC
LIMIT 1; 

# 9 revisited
SELECT
	first_name,
	last_name,
	salary,
	dept_name
FROM dept_manager
JOIN employees USING(emp_no)
JOIN salaries USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > CURDATE()
	AND dept_manager.to_date > CURDATE()
ORDER BY salary DESC
LIMIT 1;


# 10 bonus
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS "Employee NAME",
	d.dept_name AS "Department NAME",
	CONCAT(dmn.first_name, ' ', dmn.last_name) AS "Manager NAME"
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
JOIN dept_manager dm ON dm.dept_no = d.dept_no
JOIN employees dmn ON dmn.emp_no = dm.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
ORDER BY d.dept_name, e.first_name, e.last_name;


# Bonus Find the highest paid employee in each department. will be on slack
# 11
SELECT MAX(A.salary) as max_salary, A.dept_no

SELECT 
	de.emp_no,
	de.dept_no,
	s.salary
FROM dept_emp de
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date > NOW() s.to_date > NOW()
) A
GROUP BY A.dept_no
;







