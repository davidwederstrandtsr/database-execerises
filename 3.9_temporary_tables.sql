
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
SELECT emp_no, salary, dept_name
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE salaries.to_date > NOW();

SELECT * FROM employees_avg_salary;
# numerator
SELECT salary - (
	SELECT AVG(salary) 
	FROM employees_avg_salary) AS `salary minus avg`
FROM employees_avg_salary;

# table created 
CREATE TEMPORARY TABLE avg_salaries AS
SELECT salary - (
	SELECT AVG(salary) 
	FROM employees_avg_salary) AS `salary minus avg`
FROM employees_avg_salary;

SELECT * FROM avg_salaries;







