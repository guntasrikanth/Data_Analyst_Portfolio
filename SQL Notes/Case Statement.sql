#using Case statement
select emp_no, first_name, last_name,
case when gender= 'M' then 'Male'
else 'Female' 
end as Gender
from employees;

#using If statement
select emp_no, first_name, last_name,
if (gender='M', 'Male','Female') as gender
from employees;

#salary increase using case
SELECT e.emp_no, e.first_name, e.last_name, max(s.salary)-min(s.salary) as Salary_diff,
case when max(salary)-min(salary) >30000 then 'Salary was raised by more than $30,000'
		when max(salary)-min(salary) between 20000 and 30000 then 'Salary was raised by more than $20,000 but less than $30,000'
        else 'Salary was raised by less than $20,000'
        end as Salary_increase
from employees e join salaries s 
on s.emp_no = e.emp_no	
group by s.emp_no;

#exercise
select e.emp_no, e.first_name, e.last_name, 
case when e.emp_no in (select dm.emp_no from dept_manager dm) then 'Manager'
	else 'Employee'
    end as 'Manager/Employee'
from employees e
where e.emp_no>109990;

#exercise 2
select e.emp_no, e.first_name, e.last_name, max(s.salary)-min(s.salary) as Salary_diff,
case when max(s.salary)-min(s.salary) >30000 then 'Salary was raised by more than $30,000'
        else 'Salary was raised by less than $30,000'
        end as Salary_raise
from employees e join salaries s 
on s.emp_no = e.emp_no	
where e.emp_no in (select dm.emp_no from dept_manager dm)
group by s.emp_no;

#exercise 2 alternative
select dm.emp_no, e.first_name, e.last_name, max(s.salary)-min(s.salary) as Salary_diff,
case when max(s.salary)-min(s.salary) >30000 then 'Salary was raised by more than $30,000'
        else 'Salary was raised by less than $30,000'
        end as Salary_raise
from employees e join dept_manager dm
on dm.emp_no = e.emp_no
join salaries s 
on s.emp_no = e.emp_no 
group by s.emp_no;

#exercise 3
select e.emp_no, e.first_name, e.last_name,
if (max(de.to_date)>sysdate(), 'Is still employeed','Not an employee anymore') as Is_employeed
from employees e join dept_emp de 
on e.emp_no = de.emp_no
group by de.emp_no
limit 100;
