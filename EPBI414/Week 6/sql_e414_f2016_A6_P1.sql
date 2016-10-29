-- +--------------------------------+
-- |                                |
-- | EPBI414 HW6 pt1 SQL            |
-- | sql_e414_f2016_A6_P1.sql       |
-- |                                |
-- | Author:    Stephen Morvant II  |
-- |            swm38@case.edu      |
-- |                                |
-- +--------------------------------+

-- This query grabs the 30 highest paid male and 30 highest paid female employees 
-- who are currently still working at the company and started in1985 or 1986

-- ################# NOTES ################# --
-- Current employees have 9999-01-01 in to_date of salaries
-- I want current employees with hire date between 1985-01-01 and 1986-12-31
-- Only top 30 slaries of such are needed
-- --At what level do I need to order these and limit them???? 
-- -- -- I assume that there are at least two correct answers but one is more resource intensive
-- -- -- Since it does not say to be in order, I guess just grabbing top 30 at deepest is best


-- Establishing which data is being used
USE epbi414_employee_data;

-- Selecting employees with all of...
-- a) gender is male (gender = 'M')
-- b) hire_date in 1985 or 1986 (BETWEEN 1985-01-01 AND 1986-12-31)
-- c) currently employed (s.to_date = '9999-01-01')
-- d) in the top 30 of such employees (ORDER BY s.salary DESC) and (LIMIT 30)
-- Need to use INNER JOIN to put all relevant info together based on emp_no
SELECT  e.emp_no,
        e.hire_date,
        e.gender,
        s.salary
        FROM employees AS e
        INNER JOIN
            (
            SELECT  emp_no,
                    salary
                    FROM salaries
                    WHERE to_date = '9999-01-01'
					ORDER BY salary DESC
            ) AS s
        ON e.emp_no = s.emp_no
            WHERE gender = 'F' 
                    AND hire_date BETWEEN '1985-01-01' AND '1986-12-31'
		LIMIT 30;

		
		
-- Selecting employees with all of...
-- a) hire_date in 1985 or 1986 (BETWEEN 1985-01-01 AND 1986-12-31)
-- b) gender is male (gender = 'M')
-- c) currently employed (s.to_date = '9999-01-01')
-- d) in the top 30 of such employees (ORDER BY s.salary DESC) and LIMIT 30
-- Need to use INNER JOIN to put all relevant info together based on emp_no
SELECT  e.emp_no,
        e.hire_date,
        e.gender,
        s.salary
        FROM employees AS e
        INNER JOIN
            (
            SELECT  emp_no,
                    salary
                    FROM salaries
                    WHERE to_date = '9999-01-01'
					ORDER BY salary DESC
            ) AS s
        ON e.emp_no = s.emp_no
            WHERE gender = 'M' 
                    AND hire_date BETWEEN '1985-01-01' AND '1986-12-31'
		LIMIT 30;
		
		