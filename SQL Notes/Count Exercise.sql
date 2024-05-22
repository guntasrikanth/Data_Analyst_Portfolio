-- How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000; 
    
    
-- How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise. 
SELECT 
    COUNT(*)
FROM
    dept_manager; 
    
    
-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp; 