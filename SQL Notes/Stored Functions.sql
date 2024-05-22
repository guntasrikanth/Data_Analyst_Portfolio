#func procedure emp avg salary
drop function if exists f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal(10,0)
DETERMINISTIC
begin
declare v_avg_salary decimal(10,2);
	select avg(s.salary) into v_avg_salary
    from salaries s 
    where s.emp_no = p_emp_no;
return v_avg_salary;
end$$
delimiter ;

select  f_emp_avg_salary(11300);


