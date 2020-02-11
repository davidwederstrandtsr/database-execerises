USE employees;

# 5
# all employees with an e in their name, ORDER BY employee number
SELECT
	CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'; 

# all employees that last name start and end with e, to uppercase
SELECT
	UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';


# all employees hired in the 90's AND born ON Christmas, ODER BY oldest age AND LAST hired and days_employed
SELECT 
	*,
	DATEDIFF(NOW(), hire_date) AS days_employed
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;


# find min and max salaries
SELECT 
	MIN(salary),
	MAX(salary)
FROM salaries;

SELECT
	lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2)))
FROM employees;