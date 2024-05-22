#inner joint exercise
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, m.dept_no
FROM
    employees e
        INNER JOIN
    dept_manager m ON e.emp_no = m.emp_no
ORDER BY emp_no;


#using where clause
-- Extract a list containing information about all managers’ employee number, first and last name, department number, 
-- and hire date. Use the old type of join syntax to obtain the result.
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, m.dept_no
FROM
    employees e,
    dept_manager m
WHERE
    e.emp_no = m.emp_no;


-- How many male and how many female managers do we have in the ‘employees’ database?
SELECT 
    e.gender, COUNT(e.gender) AS Count
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
GROUP BY gender;