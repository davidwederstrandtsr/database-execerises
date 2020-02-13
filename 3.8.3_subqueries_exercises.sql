# 1
-- Find all the employees with the same hire date as employee 101010 using a sub-query.
SELECT 
	CONCAT(first_name, ' ', last_name) AS `Employees with hire_date similar to emp_no 101010`
FROM employees
WHERE hire_date = (
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
);


# 2
-- Find all the titles held by all employees with the first name Aamod
SELECT DISTINCT 
	title AS `Titles held by Aamod`
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
);


# 3
-- How many people in the employees table are no longer working for the company?
SELECT
	COUNT(emp_no)
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date < CURDATE()
);


# 3 done in class
 SELECT (
 	SELECT COUNT(*)
 	FROM employees
 	) - (
 	SELECT COUNT(*)
 	FROM salaries
 	WHERE to_date > NOW()
 );
 
 

# 4
-- Find all the current department managers that are female.
SELECT
	first_name,
	last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > CURDATE()
)
AND gender = 'F';



# 5 
-- Find all the employees that currently have a higher than average salary. 154543 rows in total. 

SELECT 
	first_name,
	last_name,
	salary
FROM employees
JOIN salaries USING (emp_no)
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary > (
		SELECT
			AVG(salary)
		FROM salaries
	)
	AND salaries.to_date > CURDATE()
)
AND to_date > CURDATE();

# alternate way
SELECT 
	first_name, 
	last_name, 
	salary
FROM employees
JOIN salaries USING(emp_no)
WHERE to_date > CURDATE()
AND salary > (
	SELECT AVG(salary)
	FROM salaries
);



# 6
-- How many current salaries are within 1 standard deviation of the highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT
	(SELECT COUNT(*)
	FROM salaries 
	WHERE salary >= (
		(SELECT MAX(salary) - STD(salary)
		FROM salaries)) 
	AND to_date > NOW())
	/ (SELECT COUNT(*) FROM salaries WHERE to_date > NOW());


# BONUSES

# 1 Find all the department names that currently have female managers.

SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_manager
	WHERE emp_no IN (
		SELECT emp_no 
		FROM employees
		WHERE gender = 'F'
	)
	AND to_date > NOW()
);


# 2 Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary = (
		SELECT MAX(salary)
		FROM salaries 
		ORDER BY salary DESC
	)
);

# 3 Find the department name that the employee with the highest salary works in.
SELECT dept_name
FROM departments
WHERE dept_no = (
	SELECT dept_no
	FROM dept_emp
	WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE emp_no = (
			SELECT emp_no
			FROM salaries
			WHERE salary = (
				SELECT MAX(salary)
				FROM salaries
			)
		)
	)
);



