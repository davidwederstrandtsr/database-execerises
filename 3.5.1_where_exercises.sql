USE employees;

# all employees with first name Irena, Vidya, Maya  using IN 
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# all employees with first name begins with E
SELECT *
FROM employees
WHERE first_name LIKE 'E%';

# all employees hired in the 90'
SELECT *
FROM employees
WHERE hire_date LIKE '199%';

# all employees born on Christmas
SELECT *
FROM employees 
WHERE birth_date LIKE '%-12-25';

# all employees with at q in their last name
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# all employees with first name Irena OR Vidya OR Maya   
SELECT *
FROM employees
WHERE first_name LIKE 'Irena' OR first_name LIKE 'Vidya' OR first_name LIKE 'Maya';


# all employees with first name Irena OR Vidya OR Maya and gender is male   
SELECT *
FROM employees
WHERE (first_name LIKE 'Irena' OR first_name LIKE 'Vidya' OR first_name LIKE 'Maya') AND gender LIKE 'M';


# all employees who's last name begins or ends with E
SELECT *
FROM employees 
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';









