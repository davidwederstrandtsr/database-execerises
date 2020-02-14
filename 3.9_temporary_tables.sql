
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT *
FROM employees_with_departments;

# 1
# a
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

# b
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

# c
ALTER TABLE employees_with_departments
DROP COLUMN first_name, DROP COLUMN last_name;

# d.  use subqueries when creating the table 

# 2

DROP TABLE payment;

CREATE TEMPORARY TABLE payment AS
SELECT *
FROM sakila.payment;

SELECT * FROM payment;

ALTER TABLE payment MODIFY amount FLOAT;
UPDATE payment SET amount = amount * 100;
ALTER TABLE payment MODIFY amount INT;


# 3
DROP TABLE employees_avg_salary;

CREATE TABLE employees_avg_salary AS
SELECT dept_name, AVG(salary) AS `avg_dept_salary`
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE salaries.to_date > NOW() AND dept_emp.to_date > NOW()
GROUP BY dept_name;

SELECT * FROM employees_avg_salary;

CREATE TABLE stats AS
SELECT AVG(salary) AS mean, std(salary) AS sd
FROM employees.salaries
WHERE salaries.to_date > NOW();

ALTER TABLE employees_avg_salary ADD salary_z_score FLOAT(36);

UPDATE employees_avg_salary 
SET salary_z_score = (
	(avg_dept_salary - (SELECT mean FROM stats)) / (SELECT sd FROM stats) 
);







