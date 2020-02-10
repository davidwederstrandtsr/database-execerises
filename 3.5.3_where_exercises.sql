USE employees;



# order distinct last name but limit to the first ten
# 2
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

# 3
# all employees hired in the 90's and born on Christmas, ODER BY oldest age and last
# hired, limit 5
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5;

# 4
# all employees hired in the 90's and born on Christmas, ODER BY oldest age and last
# hired, limit 5
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5 OFFSET 45;

# 5
# LIMIT = n  OFFSET = n * target_start_index - n



