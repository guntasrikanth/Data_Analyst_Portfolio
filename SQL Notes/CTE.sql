#getting salary from salaries table
select avg(salary) as avg_salary from salaries;

#using CTE to store average 
with cte as (
select avg(salary) as avg_salary from salaries ) 
select * from cte;

#adding average got using CTE to salaries table
with cte as (
select avg(salary) as avg_salary from salaries ) 
select * from salaries join cte;

#combining salary and employees table with female records only, including CTE
with cte as (
select avg(salary) as avg_salary from salaries ) 
select * from salaries s 
join employees e 
on e.emp_no = s.emp_no and e.gender = 'F'
join cte;

#count of female employees whose salary is greater than company average salary
with cte as (
select avg(salary) as avg_salary from salaries ) 	
select sum(case when s.salary > c.avg_salary then 1 else 0 end) as no_of_female_employees_salaries_above_avg,
count(s.salary) as no_female_employees
from salaries s 
join employees e 
on e.emp_no = s.emp_no and e.gender = 'F'
join cte c;