-- What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)?  
SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dept_no,
            from_date
    FROM
        dept_manager) AS a
ORDER BY - a.emp_no DESC;