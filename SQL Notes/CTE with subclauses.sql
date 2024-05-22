select s.emp_no, max(s.salary) as max_salary
from salaries s 
join employees e
on s.emp_no = e.emp_no
where gender = 'F'
group by s.emp_no;

with cte_avg_salary as (
select avg(salary) as avg_salary from salaries),
cte_max_salary as (
select s.emp_no, max(s.salary) as max_salary
from salaries s 
join employees e on e.emp_no = s.emp_no and e.gender = 'F'
group by s.emp_no
)
select
	sum(case when c2.max_salary > c1.avg_salary then 1 else 0 end) as no_of_female_max_salaries_abv_avg,
	count(e.emp_no) as no_of_female_employees,
    concat(round(sum(case when c2.max_salary > c1.avg_salary then 1 else 0 end)/count(e.emp_no)*100,2),'%') as 'Percentage %'
    from employees e 
    join cte_max_salary c2 on c2.emp_no = e.emp_no
    join cte_avg_salary c1;
