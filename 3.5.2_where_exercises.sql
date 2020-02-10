USE employees;

# all employees with first name Irena, Vidya, Maya  using IN, ORDER BY first name
# 2
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

# 3
# all employees with first name Irena, Vidya, Maya  using IN, ORDER BY first then last name
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

# 4
# all employees with first name Irena, Vidya, Maya  using IN, ORDER BY last then first name
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

# 5
# all employees with an e in their name, ORDER BY employee number
SELECT *
FROM employees 
WHERE last_name LIKE '%E%'
ORDER BY emp_no; 

# 6
# all employees with first name Irena, Vidya, Maya  using IN, ORDER BY last DESC then first name
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name;

# 7
# all employees with an e in their name, ORDER BY employee number DESC
SELECT *
FROM employees 
WHERE last_name LIKE '%E%'
ORDER BY emp_no DESC; 

# 8
# all employees hired in the 90's and born on Christmas, ODER BY oldest age and last hired
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
