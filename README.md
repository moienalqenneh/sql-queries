# SQL Queries Repository

This repository contains SQL queries for handling various tasks on large datasets.

## SQL Query to Delete Duplicate Records

The `delete_duplicates.sql` file contains an SQL query designed to remove duplicate records from a large table. Below is an explanation of each step in the query:

### Steps in the Query:

1. **Create a Temporary Table**:
   ```sql
   CREATE TEMPORARY TABLE temp_table AS
   SELECT MIN(id) AS id, data
   FROM huge_table
   GROUP BY data;
This step creates a temporary table temp_table that stores unique records. The MIN(id) function ensures that only one unique record is selected for each group of duplicate records based on the data column.

Delete Duplicates from the Original Table:

sql
Copy code
DELETE FROM huge_table
WHERE id NOT IN (SELECT id FROM temp_table);
This step deletes all records from the original huge_table where the id is not present in the temp_table, effectively removing duplicates.

Drop the Temporary Table:

sql
Copy code
DROP TABLE temp_table;
This step drops the temporary table temp_table as it is no longer needed after the duplicate records have been removed.

Usage
To use this query, simply copy the contents of the delete_duplicates.sql file and execute it in your SQL environment. Ensure that you have a backup of your data before running delete operations.
