-- Retrieve a list with all female employees whose first name is Kellie. 

SELECT
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';  
    
-- Retrieve a list with all employees whose first name is either Kellie or Aruna.

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';  
        
        
-- Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna'); 