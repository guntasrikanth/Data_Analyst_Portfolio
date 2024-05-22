-- Use a CTE (a Common Table Expression) and a COUNT() function in the SELECT statement in a query to find out how many male employees 
-- have never signed a contract with a salary value higher than or equal to the all-time company salary average.

with cte as(
SELECT 
    AVG(Salary) AS avg_salary
FROM
    salaries)
SELECT 
    COUNT(CASE
        WHEN s.salary >= c.avg_salary THEN s.salary
        ELSE NULL
    END) AS no_of_male_salaries_above_avg,
count(s.salary) as no_of_male_employees 
from salaries s 
join employees e 
on e.emp_no = s.emp_no and e.gender = 'M'
join cte c;


-- Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how many male employees have never signed 
-- a contract with a salary value higher than or equal to the all-time company salary average 
-- (i.e. to obtain the same result as in the previous exercise).

SELECT 
    COUNT(CASE
        WHEN s.salary >= a.avg_salary THEN s.salary
        ELSE NULL
    END) AS no_of_male_salaries_above_avg,
    COUNT(s.salary) AS no_of_male_employees
FROM
    (SELECT 
        AVG(Salary) AS avg_salary
    FROM
        salaries) a
        JOIN
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'M';


