-- +--------------------------------+
-- |                                |
-- | EPBI414 HW7 pt1 qry1           |
-- | sql_e414_f2016_A7_P1.sql       |
-- |                                |
-- | Author:    Stephen Morvant II  |
-- |            swm38@case.edu      |
-- |                                |
-- +--------------------------------+

-- This query grabs current employee data for each combination of gender and title.
-- It finds the total number in each group, average tenure, average age and average salary
-- Ages/tenure are as of 2016-01-01, not current date

-- ################# NOTES ################# --
-- Current employees have 9999-01-01 in to_date of salaries
-- I do not need to know about gaps in tenure
-- I do not need to know about gaps in tenure
-- Need 2 joins at emp_no combining salary, employee, title
-- Title, gender, n, Average Tenure, Average age, average salary
-- Use TIMESTAMPDIFF () with AVG() for tunure and age
--     Need to use (year, e.hire_date, 2016-01-01) for tenure
--     Need (year, e.birth_date, 2016-01-01) for age
-- USE AVG(salaries.salary)
-- The very bottom is sections of code that may be useful but are not quite ready
-- The first part works but only does the inital set up and none of the useful bits
-- The middle part is an attempt to use unions instead of joins with the full code

-- Establishing which data is being used
USE epbi414_employee_data;

-- This portion grabs counts of each position with male/female divide
-- It works very well and does as expected
SELECT  title,
		gender,
		COUNT(*) AS n FROM
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
-----------------------------------------------------------------
-----------------------------------------------------------------		
--Everything above here works		

-- This is an attempt to get the entire query in one go using unions
-- The first SELECT sets the N, gender and title
USE epbi414_employee_data;

SELECT  title,
		gender,
		COUNT(*) AS n FROM
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
		) AS subq UNION
SELECT  AVG(TIMESTAMPDIFF(year, employees.hire_date, 2016-01-01)) AS avg_tenure 
        FROM
        (SELECT  e.emp_no,
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
		) AS subq2 UNION
SELECT AVG(TIMESTAMPDIFF(year, employees.birth_date, 2016-01-01)) AS avg_age 
        FROM
        (SELECT  e.emp_no,
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
		) AS subq3 UNION
SELECT AVG(salaries.salary) AS avg_salary
        FROM
        (SELECT e.emp_no,
				e.gender,
				t.title, 
		ON e.emp_no = s.emp_no		
ORDER BY title, gender;


--------------------------------------------------------------------------------
-- Average tenure of each gender and title group
-- I am not sure if I need a join or not
-- data is from employees table		
		AVG(TIMESTAMPDIFF(year, e.hire_date, 2016-01-01)) AS avg_tenure FROM
		(
		SELECT  e.emp_no,
				e.hire_date,
				e.gender,
				t.title
				FROM employees AS e, titles AS t
				INNER JOIN
				(
				SELECT  emp_no,
						title
						FROM titles
						WHERE to_date = '9999-01-01'
				)AS t
				ON e.emp_no = t.emp_no
		) AS e,
---------------------------------------------------------------------		
--average age of each gender and title group 	
-- join question again
-- data is from employees table	
		AVG(TIMESTAMPDIFF(year, e.birth_date, 2016-01-01)) AS avg_age FROM
		(
		SELECT  e.emp_no,
				e.birth_date
				FROM employees
		) AS e,
----------------------------------------------------
		--this is trying to get the average salary from salaries table and join it to
		--the gender and title info above
		AVG(s.salary) AS salary FROM
		(
		SELECT  emp_no
				salary
				FROM salaries
				INNER JOIN 
				ON s.emp_no = e.emp_no
		) AS subq2

------------------------------------------------------------		
		-- This groups by title then gender
		GROUP BY title, gender; --this works
 
		
------------------------------------------------------------------
--############Query2#################
-- This query grabs current employee data for each gender and finds whether the start record exists.
-- It finds the total number in each group. (4)

-- ################# NOTES ################# --
-- Current employees have 9999-01-01 in to_date of salaries
-- Use LEFT JOIN
-- s.from_date is same as e.hire_date
-- UNION with calculated field
-- startrecord_status, gender, N

-- Establishing which data is being used
USE epbi414_employee_data;

SELECT  gender FROM employees,
		COUNT(DISTINCT emp_no) AS n
		FROM salaries
		INNER JOIN 
		WHERE from_date = NULL
		
-- This groups by title then gender
		GROUP BY title, gender; --this works
------------------------------------------

-- ##################Query 3#################
-- This query grabs current employee data for each gender and finds the min, avg, and max
-- starting salary. It also lists total N of male and female

-- ################# NOTES ################# --
-- Current employees have 9999-01-01 in to_date of salaries
-- I do not need to know about gaps in tenure
-- gender, N, min_start, avg_start, max_start
-- INNER JOINs needed because no nulls needed

-- Establishing which data is being used
USE epbi414_employee_data;

SELECT  title,
		gender,
		MIN(salaries.salary) AS min_start FROM
		(SELECT 
		
		) AS mn
		AVG (salaries.salary) AS avg_start FROM
		(SELECT
		
		)as av
		MAX(salaries.salary) AS max_start FROM
		(SELECT
		
		)as mx
		-- This groups by title then gender
		GROUP BY title, gender; --this works	