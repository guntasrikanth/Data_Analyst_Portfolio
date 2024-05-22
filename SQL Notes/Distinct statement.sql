-- Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT
    hire_date
FROM
    employees; 
    
-- Expand this list and click on “Limit to 1000 rows”. 
-- This way you will set the limit of output rows displayed back to the default of 1000
SELECT DISTINCT
    hire_date
FROM
    employees
LIMIT 1000; 