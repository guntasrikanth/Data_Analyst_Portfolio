select * from employees
where hire_date >'2000-01-01';

create index i_hire_date on employees(hire_date);

drop index i_hire_date on employees;

select * from salaries where salary >89000;
create index i_salary on salaries(salary);