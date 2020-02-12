# 1
SELECT * FROM users;
SELECT * FROM roles;

# 2
# JOIN
SELECT *
FROM users
JOIN roles ON roles.id = users.id;

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
	roles.name, 
	count(roles.name)
FROM roles
RIGHT JOIN users;


# EMPLOYEES DB

# 2
SELECT 
	departments.dept_name AS "Department Name",
	CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY departments.dept_name;


# 3
SELECT 
	departments.dept_name AS "Department Name",
	CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND employees.gender LIKE 'F'
ORDER BY departments.dept_name;

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

# 5
SELECT 
	d.dept_name AS "Department Name",
	CONCAT(e.first_name, ' ', e.last_name) AS "Name",
	s.salary AS "Salary"
FROM employees AS e
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
JOIN salaries AS s ON s.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = "9999-01-01"
ORDER BY d.dept_name;


# 6
SELECT
	d.dept_no,
	d.dept_name,
	COUNT(d.dept_no)
FROM departments d
JOIN dept_emp de USING (dept_no)
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no;


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

# 8 
SELECT
	first_name,
	last_name
FROM employees e 
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no 
WHERE s.to_date = '9999-01-01' AND de.to_date = "9999-01-01" AND d.dept_no = 'd001'
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



# 10 bonus
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS "Employee Name",
	d.dept_name AS "Department Name",
	CONCAT(dmn.first_name, ' ', dmn.last_name) AS "Manager Name"
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
JOIN dept_manager dm ON dm.dept_no = d.dept_no
JOIN employees dmn ON dmn.emp_no = dm.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
ORDER BY d.dept_name, e.first_name, e.last_name;


# 11
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS "Employee Name",
	d.dept_name AS "Department Name",
	salary
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE s.to_date = '9999-01-01' AND de.to_date = "9999-01-01"
ORDER BY d.dept_name, salary DESC; 







