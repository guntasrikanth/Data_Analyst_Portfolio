#using Case statement
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS Gender
FROM
    employees;

#using If statement
SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees;

#salary increase using case
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS Salary_diff,
    CASE
        WHEN MAX(salary) - MIN(salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(salary) - MIN(salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
    END AS Salary_increase
FROM
    employees e
        JOIN
    salaries s ON s.emp_no = e.emp_no
GROUP BY s.emp_no;




