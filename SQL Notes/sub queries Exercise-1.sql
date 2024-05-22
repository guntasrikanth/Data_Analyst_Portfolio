-- Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            
-- Select the entire information for all employees whose job title is “Assistant Engineer”. 
SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer')
ORDER BY emp_no;


