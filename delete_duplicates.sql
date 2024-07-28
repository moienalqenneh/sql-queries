CREATE TEMPORARY TABLE temp_table AS
SELECT MIN(id) AS id, data
FROM huge_table
GROUP BY data;

-- Step 2: Delete duplicates from the original table
DELETE FROM huge_table
WHERE id NOT IN (SELECT id FROM temp_table);

-- Step 3: Drop the temporary table as it's no longer needed
DROP TABLE temp_table;
