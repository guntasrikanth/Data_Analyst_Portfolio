select emp_no,
	salary,
    lag(salary) over w as previous_salary,
    lead(salary) over w as next_salary,
    salary - lag(salary) over w as salary_diff_current_previous,
    lead(salary) over w - salary as salary_diff_next_current
from salaries 
where emp_no = 10001
window w as (order by salary);