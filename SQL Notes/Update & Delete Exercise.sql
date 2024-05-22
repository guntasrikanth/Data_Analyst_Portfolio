-- Change the “Business Analysis” department name to “Data Analysis”.
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010'; 
    

-- Remove the department number 10 record from the “departments” table.
DELETE FROM departments 
WHERE
    dept_no = 'd010'; 