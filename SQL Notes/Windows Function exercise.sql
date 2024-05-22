-- Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).
-- Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1. 
-- Assign that value to the manager with the lowest employee number.

select 
	e.emp_no, 
    e.first_name, 
    e.last_name, 
    dm.dept_no, 
    row_number() over(order by dm.emp_no) as row_num
from employees e 
	join 
dept_manager dm 
on e.emp_no = dm.emp_no;


-- Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. 
-- Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).

select 
	emp_no, 
    first_name, 
    last_name, 
    row_number() over(partition by first_name order by last_name) as row_num 
from employees;

/*
Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.
Use window functions to add the following two columns to the final output:
- a column containing the row number of each row from the obtained dataset, starting from 1.
- a column containing the sequential row numbers associated to the rows for each manager, 
where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
Finally, while presenting the output, make sure that the data has been ordered by the values in the first of the row number columns, 
and then by the salary values for each partition in ascending order. */

select 
	dm.emp_no, 
    s.salary, 
	row_number() over() as row_num1,
    row_number() over(partition by emp_no order by salary desc) as row_num2
from salaries s 
	join 
    dept_manager dm
on dm.emp_no = s.emp_no
order by row_num1, emp_no, salary;

/*
Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.
Use window functions to add the following two columns to the final output:
- a column containing the row numbers associated to each manager, where their highest salary has been given a number 
equal to the number of rows in the given partition, and their lowest - the number 1.
- a column containing the row numbers associated to each manager, where their highest salary has been given the number of 1, 
and the lowest - a value equal to the number of rows in the given partition.
Let your output be ordered by the salary values associated to each manager in descending order. */

select 
	dm.emp_no, 
    s.salary, 
	row_number() over(partition by emp_no order by salary asc) as row_num1,
    row_number() over(partition by emp_no order by salary desc) as row_num2
from salaries s 
	join 
    dept_manager dm
on dm.emp_no = s.emp_no;

-- Write a query that provides row numbers for all workers from the "employees" table, 
-- partitioning the data by their first names and ordering each partition by their employee number in ascending order using window keyword.
select 
	emp_no, 
    first_name, 
    last_name, 
    row_number() over w as row_num 
from employees
window w as (partition by first_name order by emp_no);



    
