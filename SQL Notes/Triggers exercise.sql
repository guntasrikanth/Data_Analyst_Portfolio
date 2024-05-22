commit;

drop trigger if exists trig_hire_date_emp;

delimiter $$
create trigger trig_hire_date_emp
before insert on employees
for each row
begin
	if new.hire_date > date_format(sysdate(), '%y-%m-%d') then 
    set new.hire_date = date_format(sysdate(), '%y-%m-%d');
    end if;	
end$$
delimiter ;

insert into employees values('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');   

	