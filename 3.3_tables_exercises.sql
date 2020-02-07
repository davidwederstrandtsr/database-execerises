SHOW DATABASES;
USE employees;
SHOW TABLES;
DESCRIBE employees;
-- #5 INT DATE, VARCHAR, enumerated
-- #6 dept_emp, employees, employees_with_departments, dept_manager, salaries, titles
-- #7 departments, dept_manager, employees, employees_with_departments, titles
-- #8 current_dept_emp, dept_emp, dept_manager, employees, salaries, titles
-- #9 there is a one to one relationship between employees and departments

SHOW CREATE TABLE dept_manager;