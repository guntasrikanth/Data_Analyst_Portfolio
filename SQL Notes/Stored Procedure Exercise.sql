-- Create a procedure that will provide the average salary of all employees.
-- Then, call the procedure. 

delimiter $$
create procedure average_salary()
begin
	select round(avg(salary),2) as Average_Salary from salaries;
end$$
delimiter ;
call average_salary();


-- Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
delimiter $$
create procedure emp_info(in p_first_name varchar(20), p_last_name varchar(20), out p_emp_no integer)
begin
select e.emp_no into p_emp_no
from employees e
where e.first_name = p_first_name and e.last_name = p_last_name;
end$$
delimiter ;

set @v_emp_no = 0;
call emp_info('Aruna','Journel', @v_emp_no);
select @v_emp_no;