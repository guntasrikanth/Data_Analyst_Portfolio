-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%JACK%'); 
    
    
-- Once you have done that, extract another list containing the names of employees that do not contain “Jack”. 
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');  