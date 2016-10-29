-- +--------------------------------+
-- |                                |
-- | EPBI414 HW7 pt1 qry2           |
-- | sql_e414_f2016_A7_P1.sql       |
-- |                                |
-- | Author:    Stephen Morvant II  |
-- |            swm38@case.edu      |
-- |                                |
-- +--------------------------------+

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


