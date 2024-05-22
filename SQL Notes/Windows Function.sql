#applying row_number ranking to salary column by not mention anything in over(), this applies ranking by ascending order of salary 
select emp_no, salary, row_number() over () as row_no 	
from salaries;

#applying row_number ranking to salary column using partition by emp_no
select emp_no, salary, row_number() over (partition by emp_no) as row_no 
from salaries;

#applying row_number ranking to salary column using order by clause
select emp_no, salary, row_number() over (order by salary desc) as row_no 
from salaries;

#applying row_number ranking to salary column using window function
select emp_no, salary, row_number() over w as row_no 
from salaries
window w as (partition by emp_no order by salary desc);