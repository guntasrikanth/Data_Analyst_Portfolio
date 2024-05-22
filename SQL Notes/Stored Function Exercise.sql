-- Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee,
-- and returns the salary from the newest contract of that employee.

delimiter $$
create function emp_info (p_first_name varchar(40), p_last_name varchar(40)) returns decimal(10,0)
DETERMINISTIC NO SQL READS SQL DATA
begin
declare v_salary decimal(10,0);		 #Local Variable
declare v_max_from_date date;	     #Local Variable
    select max(from_date) into v_max_from_date 
    from employees e join salaries s
    on s.emp_no = e.emp_no
    where e.first_name = p_first_name and e.last_name = p_last_name;
    
	select s.salary into v_salary 
    from salaries s join employees e
    on s.emp_no = e.emp_no
    where e.first_name = p_first_name and e.last_name = p_last_name and s.from_date = v_max_from_date;
return v_salary;
end$$
delimiter ;

SELECT emp_info('Aruna','Journel');