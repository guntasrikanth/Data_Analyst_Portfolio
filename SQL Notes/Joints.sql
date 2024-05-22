#inner joint
SELECT 
    m.emp_no, m.dept_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

#join by where clause 
SELECT 
    m.emp_no, m.dept_no, d.dept_name
FROM
    dept_manager_dup m, departments_dup d 
where m.dept_no = d.dept_no
ORDER BY m.dept_no;

#left join
SELECT 
    m.emp_no, m.dept_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
    #where d.dept_name is null
ORDER BY m.dept_no;

#left join by inter changing tables 
SELECT 
    m.emp_no, d.dept_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

#join and where
select e.emp_no, e.first_name, e.last_name, s.salary
from employees e join salaries s 
on e.emp_no =s.emp_no
where s.salary <145000;

#join with aggregations
select e.gender as Gender, round(avg(s.salary),0) as 'Average Salary'
from employees e join salaries s
on e.emp_no = s.emp_no
group by gender;

#join 3 tables
select e.emp_no, e.first_name, e.last_name, m.from_date, d.dept_name
from employees e join dept_manager m
on e.emp_no = m.emp_no
join departments d on m.dept_no = d.dept_no
order by emp_no;

#joins btw table with no relation
select d.dept_name, round(avg(s.salary),0) as Average_Salary
from departments d join dept_manager m
on d.dept_no = m.dept_no
join salaries s 
on m.emp_no = s.emp_no
group by dept_name having Average_salary>60000
order by Average_salary desc;