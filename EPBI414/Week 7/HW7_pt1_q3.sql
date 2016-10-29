-- +--------------------------------+
-- |                                |
-- | EPBI414 HW7 pt1 qry3           |
-- | sql_e414_f2016_A7_P1.sql       |
-- |                                |
-- | Author:    Stephen Morvant II  |
-- |            swm38@case.edu      |
-- |                                |
-- +--------------------------------+

-- This query grabs current employee data for each gender and finds the min, avg, and max
-- starting salary. It also lists total N of male and female

-- ################# NOTES ################# --
-- Current employees have 9999-01-01 in to_date of salaries
-- I do not need to know about gaps in tenure
-- gender, N, min_start, avg_start, max_start

-- Establishing which data is being used
USE epbi414_employee_data;

SELECT  title,
		gender,
		MIN(salaries.salary) AS min_salaries FROM
		(SELECT 
		
		
		MAX(salaries.salary)
		(
		SELECT  e.emp_no,
				e.gender,
				t.title
				FROM employees AS e
				INNER JOIN
				(
				SELECT  emp_no,
						title
						FROM titles
						WHERE to_date = '9999-01-01'
				)AS t
				ON e.emp_no = t.emp_no
		) AS subq
