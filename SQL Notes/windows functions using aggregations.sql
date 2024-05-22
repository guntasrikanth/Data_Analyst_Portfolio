SELECT 
    s.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
    s.to_date > SYSDATE()
        AND s.from_date = s1.from_date;

#latest working department of an employee
SELECT 
    de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
    dept_emp de
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        dept_emp
    GROUP BY emp_no) AS de1 ON de.emp_no = de1.emp_no
WHERE
    de.to_date > SYSDATE()
        AND de.from_date = de1.from_date;


select de2.emp_no, de2.dept_no, s2.salary, avg(s2.salary) over w as average_salary_per_department
from 
(SELECT 
    de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
    dept_emp de
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        dept_emp
    GROUP BY emp_no) AS de1 ON de.emp_no = de1.emp_no
WHERE
    de.to_date > SYSDATE()
        AND de.from_date = de1.from_date) as de2
		join
(SELECT 
    s.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
    s.to_date > SYSDATE()
	AND s.from_date = s1.from_date) as s2
	on s2.emp_no = de2.emp_no
	join departments d 
	on d.dept_no = de2.dept_no
group by de2.emp_no, d.dept_name
WINDOW w as (partition by de2.dept_no)
order by de2.emp_no;