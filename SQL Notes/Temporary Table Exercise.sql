
-- Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.

create temporary table m_highest_salary
SELECT 
    s.emp_no, MAX(s.salary) AS Highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
GROUP BY s.emp_no;
select * from m_highest_salary;


/*
Create a temporary table called dates containing the following three columns:
- one displaying the current date and time,
- another one displaying two months earlier than the current date and time, and a
- third column displaying two years later than the current date and time.
*/
create temporary table dates
select
	now() as current_date_time,
    date_sub(now(), interval 2 month) as 2_months_earlier,
    date_sub(now(), interval -2 year) as 2_years_later;
select * from dates;


-- Create a query joining the result sets from the dates temporary table you created during the previous lecture with 
-- a new Common Table Expression (CTE) containing the same columns. Let all columns in the result set appear on the same row.

with cte as (
select
	now() as current_date_time,
    date_sub(now(), interval 2 month) as 2_months_earlier,
    date_sub(now(), interval -2 year) as 2_years_later
)
select * from dates join cte;


-- Again, create a query joining the result sets from the dates temporary table you created during the previous lecture with a 
-- new Common Table Expression (CTE) containing the same columns. This time, combine the two sets vertically.

with cte as (
select
	now() as current_date_time,
    date_sub(now(), interval 2 month) as 2_months_earlier,
    date_sub(now(), interval -2 year) as 2_years_later
)
select * from dates union select * from cte;
    
	