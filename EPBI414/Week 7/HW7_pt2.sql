-- +--------------------------------+
-- |                                |
-- | EPBI414 HW7 pt2 qry            |
-- | sql_e414_f2016_A7_P2.sql       |
-- |                                |
-- | Author:    Stephen Morvant II  |
-- |            swm38@case.edu      |
-- |                                |
-- +--------------------------------+

-- This script does 4 different database administration commands
-- Before it does those commands it must create an example table,
-- and if that table already exists (or its clone), it is removed.
-- The initial table creation is copied from an example by Thomas Rehman.

-- #############NOTES#############
-- This is all contained in a directory that cannot affect everything else 
-- PK setting supports deletion in safe mode

-- Sets the directory to be used as mine
	USE epbi414_swm38;

	-- Drop both or either of the tables if there already
	DROP TABLE IF EXISTS patient_tracker;
	DROP TABLE IF EXISTS patient_tracker_bak;

-- This will create the first table, and set the primary key
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
	
-- This clones the patient_tracker table and names the clone patient_tracker_bak.
	CREATE TABLE patient_tracker_bak AS	
		SELECT *
		FROM patient_tracker;

-- This edits the original table to set patient 105's gender to F 		
	UPDATE patient_tracker
		SET gender='F'
		WHERE patient_id = 105;

-- This adds a new row for patient 111 with desired attributes
--    This is the better set up, but to be very careful the syntax could be
--    INSERT INTO patient_tracker(id, gender, race, ...)		
	INSERT INTO patient_tracker 
		VALUES (111, 'F', 'American Indian or Alaska Native', 1,0,0,0);

-- This deletes all rows with id of 104 (there is only one)
	DELETE FROM patient_tracker
		WHERE patient_id = 104;

-- This shows the two tables after everything else is done
-- The first table should have gender F for 105, 104 should be deleted, and 111 added
-- The second table should have 104, no 111, and 105 is M 	
	SELECT * FROM patient_tracker;
	SELECT * FROM patient_tracker_bak;