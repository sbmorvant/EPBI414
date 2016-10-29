-- +------------------------------------------+
-- |                                          |
-- | EPBI414 Assignment 7 Part 2 Data Table   |
-- | sql_EPBI414_A7_Part2_Data_Table.sql      |
-- |                                          |
-- | Author:    Thomas A. Rehman              |
-- |            tar9@case.edu                 |
-- |                                          |
-- | Function:  Edit this script to use your  |
-- |            local epbi414_<username> DB.  |
-- |            Then, run it to craete a      |
-- |            small data table for Part 2   |
-- |            of Assignment 7. If you mess  |
-- |            up anything in your DB, you   |
-- |            can just drop the tables you  |
-- |            broke and reload from this    |
-- |            script.                       |
-- |                                          |
-- +------------------------------------------+

-- Start by using your database
-- Be sure to edit this before you run the program!
USE epbi414_<username>;

-- Drop the table if its there already
-- Then, create the new table, and set the primary key
-- PK setting supports deletion in safe mode
DROP TABLE IF EXISTS patient_tracker;

CREATE TABLE patient_tracker AS
          SELECT 101 AS patient_id, 'M' AS gender, 'Black or African American'                 AS race, 1 AS contacted, 1 AS enrolled, 0 AS withdrawn, 0 AS deceased
    UNION SELECT 102 AS patient_id, 'M' AS gender, 'White or Caucasian'                        AS race, 1 AS contacted, 1 AS enrolled, 0 AS withdrawn, 0 AS deceased
    UNION SELECT 103 AS patient_id, 'F' AS gender, 'White or Caucasian'                        AS race, 1 AS contacted, 0 AS enrolled, 1 AS withdrawn, 0 AS deceased
    UNION SELECT 104 AS patient_id, 'F' AS gender, 'Asian'                                     AS race, 0 AS contacted, 0 AS enrolled, 0 AS withdrawn, 0 AS deceased
    UNION SELECT 105 AS patient_id, 'M' AS gender, 'White or Caucaisan'                        AS race, 1 AS contacted, 0 AS enrolled, 0 AS withdrawn, 1 AS deceased
    UNION SELECT 106 AS patient_id, 'M' AS gender, 'White or Caucaisan'                        AS race, 1 AS contacted, 1 AS enrolled, 0 AS withdrawn, 1 AS deceased
    UNION SELECT 107 AS patient_id, 'M' AS gender, 'Black or African American'                 AS race, 1 AS contacted, 0 AS enrolled, 1 AS withdrawn, 0 AS deceased
    UNION SELECT 108 AS patient_id, 'F' AS gender, 'White or Caucaisan'                        AS race, 1 AS contacted, 1 AS enrolled, 0 AS withdrawn, 0 AS deceased
    UNION SELECT 109 AS patient_id, 'F' AS gender, 'Asian'                                     AS race, 1 AS contacted, 1 AS enrolled, 0 AS withdrawn, 0 AS deceased
    UNION SELECT 110 AS patient_id, 'M' AS gender, 'Native Hawaiian or Other Pacific Islander' AS race, 1 AS contacted, 0 AS enrolled, 0 AS withdrawn, 0 AS deceased;

ALTER TABLE patient_tracker
    ADD PRIMARY KEY(patient_id);