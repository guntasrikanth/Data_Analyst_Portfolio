-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;


-- Return a list with the first 10 employees with all the departments they can be assigned to.
SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    employees e
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_no;