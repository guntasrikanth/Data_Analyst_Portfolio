-- What is the lowest salary in the database?
SELECT 
    MIN(salary) AS min_salary
FROM
    salaries;


-- What is the highest salary in the database?
SELECT 
    MAX(salary) AS max_salary
FROM
    salaries;
    
    
-- Which is the lowest employee number in the database?
SELECT 
    MIN(emp_no)
FROM
    employees; 
    
    
-- Which is the highest employee number in the database?
SELECT 
    MAX(emp_no)
FROM
    employees;