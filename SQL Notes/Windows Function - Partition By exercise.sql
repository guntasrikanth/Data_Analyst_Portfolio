/*
Find out the lowest salary value each employee has ever signed a contract for. 
To obtain the desired output, use a subquery containing a window function, 
as well as a window specification introduced with the help of the WINDOW keyword.
Also, to obtain the desired result set, refer only to data from the “salaries” table. */

SELECT 
	a.emp_no,
	MIN(salary) AS min_salary 
    FROM (
			SELECT 
				emp_no, 
                salary, 
                ROW_NUMBER() OVER w AS row_num
			FROM salaries
			WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
			) a
GROUP BY emp_no;

/*
Again, find out the lowest salary value each employee has ever signed a contract for. 
Once again, to obtain the desired output, use a subquery containing a window function. 
This time, however, introduce the window specification in the field list of the given subquery.
To obtain the desired result set, refer only to data from the “salaries” table. */

SELECT 
	a.emp_no,
	MIN(salary) AS min_salary
    FROM 
    (
		SELECT 
			emp_no, 
            salary, 
            ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num
		FROM salaries
	) a
GROUP BY emp_no;

/*
Once again, find out the lowest salary value each employee has ever signed a contract for. 
This time, to obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.
To obtain the desired result set, refer only to data from the “salaries” table. */

SELECT 
    a.emp_no, MIN(salary) AS min_salary
FROM
    (SELECT 
        emp_no, salary
    FROM
        salaries) a
GROUP BY emp_no;

/*
Once more, find out the lowest salary value each employee has ever signed a contract for. 
To obtain the desired output, use a subquery containing a window function, 
as well as a window specification introduced with the help of the WINDOW keyword. 
Moreover, obtain the output without using a GROUP BY clause in the outer query.
To obtain the desired result set, refer only to data from the “salaries” table. */

SELECT 
	a.emp_no,
    a.salary AS min_salary 
FROM 
    (SELECT
		emp_no, 
        salary, 
        ROW_NUMBER() OVER w AS row_num
    FROM 
		salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
where a.row_num =1;
