#procedure to get 1000 employees
drop procedure if exists select_employees;
delimiter $$
create procedure select_employees()
begin
	select * from employees limit 1000;
end$$
delimiter ;
call select_employees();

#get particular employee salary
drop procedure if exists emp_salary;
delimiter $$
create procedure emp_salary(In p_emp_no integer)
begin
	select e.emp_no, e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    from employees e join salaries s
    on e.emp_no = s.emp_no
    where e.emp_no = p_emp_no;
end$$
delimiter ;	

call emp_salary(110022);

#get employee average salary
drop procedure if exists emp_avg_salary;
delimiter $$
create procedure emp_avg_salary(In p_emp_no integer)
begin
	select e.emp_no, e.first_name, e.last_name, round(avg(s.salary),0) as Average_salary
    from employees e join salaries s
    on e.emp_no = s.emp_no
    where e.emp_no = p_emp_no;
end$$
delimiter ;

call emp_avg_salary(110022);

#get average employee salary using out parameter
drop procedure if exists emp_avg_salary_out;
delimiter $$
create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,0))
begin 
select avg(s.salary) into p_avg_salary
from employees e join salaries s
on e.emp_no = s.emp_no
where e.emp_no = p_emp_no;
end$$
delimiter ;

set @v_avg_salary = 0;
call emp_avg_salary_out(11300 ,@v_avg_salary);
select @v_avg_salary;

