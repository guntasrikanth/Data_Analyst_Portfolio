-- Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the 
-- number of male employees whose highest salaries have been below the all-time average.

with cte_avg_salary as (
SELECT 
    AVG(salary) AS avg_salary
FROM
    salaries),
cte_highest_salary as (
SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
GROUP BY s.emp_no)
SELECT 
    SUM(CASE
        WHEN c2.highest_salary < c1.avg_salary THEN 1
        ELSE 0
    END) AS no_of_male_highest_salary_below_avg,
    COUNT(e.emp_no) AS no_of_male_salaries,
    CONCAT(ROUND(SUM(CASE
                        WHEN c2.highest_salary < c1.avg_salary THEN 1
                        ELSE 0
                    END) / COUNT(e.emp_no) * 100,
                    2),
            '%') AS 'Percentage %'
FROM
    employees e
        JOIN
    cte_highest_salary c2 ON c2.emp_no = e.emp_no
        JOIN
    cte_avg_salary c1;


-- Use two common table expressions and a COUNT() function in the SELECT statement of a query to obtain the 
-- number of male employees whose highest salaries have been below the all-time average.

with cte_avg_salary as (
SELECT 
    AVG(salary) AS avg_salary
FROM
    salaries),
cte_highest_salary as (
SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
GROUP BY s.emp_no)
SELECT 
    COUNT(CASE
        WHEN c2.highest_salary < c1.avg_salary THEN c2.highest_salary
        ELSE NULL
    END) AS no_of_male_highest_salary_below_avg,
    COUNT(e.emp_no) AS no_of_male_salaries,
    CONCAT(ROUND(SUM(CASE
                        WHEN c2.highest_salary < c1.avg_salary THEN 1
                        ELSE 0
                    END) / COUNT(e.emp_no) * 100,
                    2),
            '%') AS 'Percentage %'
FROM
    employees e
        JOIN
    cte_highest_salary c2 ON c2.emp_no = e.emp_no
        JOIN
    cte_avg_salary c1;


-- Does the result from the previous exercise change if you used the Common Table Expression (CTE) for the 
-- male employees highest salaries in a FROM clause, as opposed to in a join?

with cte_avg_salary as (
SELECT 
    AVG(salary) AS avg_salary
FROM
    salaries),
cte_highest_salary as (
SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
GROUP BY s.emp_no)
SELECT 
    COUNT(CASE
        WHEN c2.highest_salary < c1.avg_salary THEN c2.highest_salary
        ELSE NULL
    END) AS no_of_male_highest_salary_below_avg,
    COUNT(c2.emp_no) AS no_of_male_salaries,
    CONCAT(ROUND(SUM(CASE
                        WHEN c2.highest_salary < c1.avg_salary THEN 1
                        ELSE 0
                    END) / COUNT(c2.emp_no) * 100,
                    2),
            '%') AS 'Percentage %'
FROM
    cte_highest_salary c2
        JOIN
    cte_avg_salary c1;
