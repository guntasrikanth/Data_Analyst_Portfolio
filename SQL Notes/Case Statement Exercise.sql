-- Obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
-- Create a fourth column in the query, indicating whether this employee is also a manager, 
-- according to the data provided in the dept_manager table, or a regular employee. 

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN
            e.emp_no IN (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm)
        THEN
            'Manager'
        ELSE 'Employee'
    END AS 'Manager/Employee'
FROM
    employees e
WHERE
    e.emp_no > 109990;
    
    
-- Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
-- Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
-- and another one saying whether this salary raise was higher than $30,000 or NOT.

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS Salary_diff,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        ELSE 'Salary was raised by less than $30,000'
    END AS Salary_raise
FROM
    employees e
        JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
        JOIN
    salaries s ON s.emp_no = e.emp_no
GROUP BY s.emp_no;

-- ALTERNATIVE
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS Salary_diff,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        ELSE 'Salary was raised by less than $30,000'
    END AS Salary_raise
FROM
    employees e
        JOIN
    salaries s ON s.emp_no = e.emp_no
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
GROUP BY s.emp_no;


-- Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” 
-- saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    IF(MAX(de.to_date) > SYSDATE(),
        'Is still employeed',
        'Not an employee anymore') AS Is_employeed
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 100;