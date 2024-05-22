-- Write a query that ranks the salary values in descending order of all contracts signed by employees numbered between 10500 and 10600 
-- inclusive. Let equal salary values for one and the same employee bear the same rank. 
-- Also, allow gaps in the ranks obtained for their subsequent rows.
-- Use a join on the “employees” and “salaries” tables to obtain the desired result.
select 
	e.emp_no, 
    s.salary, 
    rank() over (partition by s.emp_no order by s.salary desc) as salary_ranking 	
from 
	salaries s 
		join 
    employees e 
on e.emp_no = s.emp_no
where s.emp_no between 10500 and 10600;


/*
Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:
- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.
In addition, let equal salary values of a certain employee bear the same rank. 
Do not allow gaps in the ranks obtained for their subsequent rows.
Use a join on the “employees” and “salaries” tables to obtain the desired result. */

select e.emp_no, 
	s.salary, 
	dense_rank() over (partition by s.emp_no order by s.salary desc) as salary_ranking,
    e.hire_date,
    s.from_date,
	( year(s.from_date) - year(e.hire_date) ) as years_from_start
from salaries s 
	join 
    employees e 
on e.emp_no = s.emp_no and 
year(s.from_date) - year(e.hire_date) > 4
where s.emp_no between 10500 and 10600;