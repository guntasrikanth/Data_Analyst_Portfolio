-- Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed a contract for.
-- Order and display the obtained salary values from highest to lowest.

select 
	emp_no, 
    salary, 
    row_number() over (order by salary desc) as row_no 
from salaries 
where emp_no=10560;


-- Write a query that upon execution, displays the number of salary contracts that each manager has ever signed while working in the company.
SELECT 
    dm.emp_no, COUNT(s.salary) AS no_of_salary_contracts
FROM
    salaries s
        JOIN
    dept_manager dm ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;


-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed 
-- a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values 
-- bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.
select 
	emp_no, 
    salary, 
    rank() over (order by salary desc) as rank_no 
from salaries 
where emp_no=10560;


-- Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed 
-- a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values 
-- bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.
select 
	emp_no, 
    salary, 
    dense_rank() over (order by salary desc) as rank_no 
from salaries 
where emp_no=10560;