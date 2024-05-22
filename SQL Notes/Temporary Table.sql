create temporary table f_highest_salaries
select s.emp_no, max(s.salary) as max_salary_t
from salaries s 
join employees e on s.emp_no = e.emp_no
where gender = 'F'
group by s.emp_no order by s.emp_no
limit 10;

select * from f_highest_salaries;

drop temporary table if exists f_highest_salaries;

/*
temporary tables can only by joined with other table using CTE not with direct use of join, inner join and so
*/

with cte as (
select s.emp_no, max(s.salary) as max_salary
from salaries s 
join employees e on s.emp_no = e.emp_no
where gender = 'F'
group by s.emp_no order by s.emp_no
limit 10)
select * from f_highest_salaries join cte;


with cte as (
select s.emp_no, max(s.salary) as max_salary
from salaries s 
join employees e on s.emp_no = e.emp_no
where gender = 'F'
group by s.emp_no order by s.emp_no
limit 10)
select * from f_highest_salaries union all select * from cte;