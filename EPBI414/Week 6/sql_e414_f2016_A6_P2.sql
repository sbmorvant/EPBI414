-- +--------------------------------+
-- |                                |
-- | EPBI414 HW6 pt2                |
-- | sql_e414_f2016_A6_P2.sql       |
-- |                                |
-- | Author:    Stephen Morvant II  |
-- |            swm38@case.edu      |
-- |                                |
-- +--------------------------------+

-- This query has 3 parts. Each of the parts has its own explanation
 
-- This is the first part of the query. In it, I want to list all of the observed 
-- entries with either SBP, DBP, HR, TEMP (C), WT, OR HT as the c.short_name.
-- It joins the short_name from concept with the real data from obs. based on the concept_id.
-- This query is then sorted by person_id, encounter_id, and short_name.

SELECT	o.person_id,
		o.encounter_id,
		o.value_numeric,
		c.short_name
		FROM obs AS o
		INNER JOIN
		(
		SELECT concept_id,
				short_name
				FROM concept
		) AS c
		ON o.concept_id = c.concept_id	
			WHERE c.short_name IN ('SBP', 'DBP', 'HR', 'TEMP (C)', 'WT', 'HT')
		ORDER BY o.person_id , o.encounter_id , c.short_name;
				
				
				
-- This is part 2 of the query where I want the highest temp ever recorded
-- This only grabs all of the rows with short_name = 'TEMP (C)' and matches them
-- with the person_id, encounter_id, value_numeric, and obs_datetime.
-- It then sorts based on the highest recorded TEMP (C) and limits the list to 1;
-- thus the table will only return the highest temp.
-- The rows are joined using the concept_id.				
				
SELECT	o.person_id,
		o.encounter_id,
		o.value_numeric,
		o.obs_datetime,
		c.short_name
		FROM obs AS o
		INNER JOIN
		(
		SELECT concept_id,
				short_name
				FROM concept
		) AS c
		ON o.concept_id = c.concept_id	
			WHERE c.short_name = 'TEMP (C)'
		ORDER BY o.value_numeric DESC
		LIMIT 1;
		
		
		
-- This is part 3 of the query where I need to find temperatures over 39.5 C.
-- First it grabs all of the rows with short_name = 'TEMP (C)' and value_numeric >39.5.
-- It then matches them with the person_id, encounter_id, value_numeric, and obs_datetime.
-- It joins them based on concept_id.
-- Lastly they are sorted from lowest to highest using ORDER BY ASC.
-- It should be able to join location name as well, but I cannot get the 2nd JOIN to work syntaxically.
-- It would be joined using the o.location_id and l.location_id and 
-- SELECT name FROM location AS l.
-- I commented out the problem parts of the location 

SELECT	o.person_id,
		o.encounter_id,
		o.value_numeric,
		o.obs_datetime,
		c.short_name--, 
		--l.name
		FROM obs AS o  
		INNER JOIN
		(
		SELECT concept_id,
				short_name
				FROM concept
		) AS c
		ON o.concept_id = c.concept_id	
			WHERE c.short_name = 'TEMP (C)' AND o.value_numeric > 39.5
		ORDER BY o.value_numeric ASC;
		
		
		
		
--		INNER JOIN 
--		(SELECT name
--				FROM location
--		) AS l
--		ON o.location_id = l.location_id
	