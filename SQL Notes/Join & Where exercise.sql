-- Select the first and last name, the hire date, and the job title of all employees 
-- whose first name is “Margareta” and have the last name “Markovitch”.
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND last_name = 'Markovitch';