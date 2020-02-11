# 2 select distinct titles
SELECT DISTINCT 
	title
FROM titles;


# 3 select last names that 
SELECT
	last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

# 4 select last names that 
SELECT
	first_name,
	last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

# 5 last name contains q but not qu
SELECT DISTINCT
	last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

# 6 last name contains q but not qu, count each
SELECT DISTINCT
	last_name,
	count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;

# 7 count how many Irena, Vidya, Maya
SELECT
	count(*),
	gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;


# 8 duplicates
SELECT
	lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2))) AS username,
	COUNT(*)
FROM employees
GROUP BY username
HAVING count(username) > 1;

# BONUS 13251







