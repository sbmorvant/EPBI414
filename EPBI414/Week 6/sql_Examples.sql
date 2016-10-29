-- +--------------------------------+
-- |                                |
-- | EPBI414 Unit 6 SQL Examples    |
-- | sql_EPBI414_Unit6_Examples.sql |
-- |                                |
-- | Author:    Thomas A. Rehman    |
-- |            tar9@case.edu       |
-- |                                |
-- +--------------------------------+

-- Basic SELECT Example
SELECT dept_name FROM epbi414_employee_data.departments;

-- USE and LIMIT Examples
USE epbi414_employee_data;
SELECT first_name,last_name FROM employees LIMIT 10;

-- Using WHERE and ORDER BY
-- Note how this will work, but the next will not
SELECT  *
        FROM employees
        WHERE gender = 'F'
        ORDER BY birth_date
        LIMIT 10;

SELECT  *
        FROM employees
        ORDER BY birth_date
        WHERE gender = 'F'
        LIMIT 10;

-- Here is an example of using DESC
SELECT  *
        FROM employees
        ORDER BY hire_date DESC
        LIMIT 10;

-- More Complicated Logics
-- Here is a query which selects all the employees who were either
--  a) born between 1950 and 1953 and have employee numbers
--     less than 10050 or greater than 11000, or
--  b) Have a name that starts with Chir
SELECT  *
        FROM employees
        WHERE (birth_date BETWEEN '1950-01-01'
                             AND '1953-12-31'
            AND (emp_no < 10050 OR emp_no > 11000))
            OR first_name LIKE 'Chir%';

-- Here is a query that finds all the current Engineers and Senior Engineers
SELECT  * 
        FROM titles
        WHERE title IN ('Engineer','Senior Engineer')
            AND to_date = '9999-01-01';

-- Wildcards
-- Here are some query examples illustrating wildcards
-- First, using the % sign
SELECT  first_name,
        last_name
        FROM employees
        WHERE first_name LIKE 'Geoff%y'
        LIMIT 3;

-- Now, using the _
SELECT  first_name,
        last_name
        FROM employees
        WHERE last_name like "___sen"
        LIMIT 3;

-- Simple Inner Join
-- See how we create a subquery that filters the salaries to
-- only include those with the to_date being 9999-01-01?
-- This prevents us from getting the salaries of past or discharged employees
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
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
            ) AS s
        ON e.emp_no = s.emp_no
        LIMIT 10;