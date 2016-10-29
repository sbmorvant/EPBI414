-- +--------------------------------+
-- |                                |
-- | EPBI414 Unit 7 SQL Examples    |
-- | sql_EPBI414_Unit7_Examples.sql |
-- |                                |
-- | Author:    Thomas A. Rehman    |
-- |            tar9@case.edu       |
-- |                                |
-- +--------------------------------+

-- For examples, mostly using the employee data
USE epbi414_employee_data;

-- Showcase how EXPLAIN works
EXPLAIN
SELECT * FROM departments;

-- Showcasing a many-to-many join
-- See how the count for each table gives you an idea of the total
SELECT  (SELECT COUNT(*) FROM salaries WHERE emp_no = 10004) AS n_salaries,
        (SELECT COUNT(*) FROM titles WHERE emp_no = 10004) AS n_titles;

SELECT  s.*,
        t.*
        FROM
        (
        SELECT  *
                FROM salaries
                WHERE emp_no = 10004
        ) AS s
        INNER JOIN
        (
        SELECT  *
                FROM titles
                WHERE emp_no = 10004
        ) AS t
        ON s.emp_no = t.emp_no;

-- Showcasing a very small table in code
-- Note how we create names for the variables using AS
SELECT 'A' AS usr_group,21 AS score UNION
SELECT 'B' AS usr_group,11 AS score UNION
SELECT 'C' AS usr_group,13 AS score UNION
SELECT 'D' AS usr_group,41 AS score;

-- Concatenate Example
-- Showcases how the CONCAT function works
-- Also shows how we can rename calculated fields, like above
SELECT CONCAT(`first_name`,' ',`last_name`) AS full_name,
       hire_date
       FROM employees
       WHERE last_name LIKE 'Terw%'
       LIMIT 3;

-- Another example of a function
-- Remember what we discussed about dates before
-- Use the system tools!
SELECT emp_no,
       first_name,
       last_name,
       TIMESTAMPDIFF(year,birth_date,hire_date) AS age_at_hire
       FROM employees LIMIT 10;

-- Showing how to use assigned field names by wrapping in a subquery
-- We can refer to subq_emp_no_plus because it is defined in a subquery
SELECT subq.emp_no,
       subq.emp_no_plus,
       subq.emp_no_plus * subq.emp_no_plus AS emp_no_plus_squared
       FROM
       (
       SELECT emp_no,
              emp_no + 10 AS emp_no_plus
              FROM employees
       ) AS subq
       LIMIT 10;

-- Distinct vs. Non-Distinct Records
SELECT  emp_no
        FROM salaries
        ORDER BY emp_no
        LIMIT 10;
SELECT  DISTINCT emp_no
        FROM salaries
        ORDER BY emp_no
        LIMIT 10;

-- Very Simple Aggregation
SELECT AVG(salary) AS average_salary
       FROM salaries;

-- Basic Frequency Table
SELECT  title,
        gender,
        COUNT(*) AS n_employees FROM
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
                ) AS t
                ON e.emp_no = t.emp_no
        ) AS subq
        GROUP BY title,gender;

-- Repeat Frequency Query Using HAVING and WHERE
-- HAVING version
SELECT  title,
        gender,
        COUNT(*) AS n_employees FROM
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
                ) AS t
                ON e.emp_no = t.emp_no
        ) AS subq
        GROUP BY title,gender
        HAVING gender = 'M';

-- WHERE version
SELECT  title,
        gender,
        COUNT(*) AS n_employees FROM
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
                ) AS t
                ON e.emp_no = t.emp_no
        ) AS subq
        WHERE gender = 'M'
        GROUP BY title,gender;

-- Counting current employees using DISTINCT and the salaries table
SELECT COUNT(DISTINCT emp_no) AS n_employees
       FROM salaries
       WHERE to_date = '9999-01-01';

-- Showcasing the creation of temporary tables
-- Note that you won't have access to create temp tables on the main employees database
-- So, instead, you can specify epbi414_<yourusername>.empno_10004_salaries
-- You will have the right permissions to create temporary tables in that database
CREATE TEMPORARY TABLE empno_10004_salaries
    AS
    (
    SELECT *
           FROM salaries
           WHERE emp_no = 10004
    );
SELECT * FROM empno_10004_salaries;

-- And, finally, obtaining a DDL specification via command
SHOW CREATE TABLE salaries;