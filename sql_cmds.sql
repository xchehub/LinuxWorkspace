//find all tables containing column with specified name

SELECT COLUMN_NAME, TABLE_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME LIKE '%MyName%'

//change the data type for a column in MySQL
ALTER TABLE tablename MODIFY columnname INTEGER

// group data by hour
SELECT HOUR( db_update_time ) AS h, COUNT( * ) 
FROM  `some_table` 
WHERE  `db_update_time` >  '2016-03-03'
GROUP BY h

// dump mysql table structure without data with a SQL query?
SHOW CREATE TABLE MyTablename

// remove new line characters from data rows in mysql
update app_category SET category = TRIM(TRAILING '\n' FROM category);
UPDATE app_category SET category = REPLACE(REPLACE(category, '\r', ''), '\n', '');

# MySql
# determine the file size of a table
SELECT TABLE_SCHEMA, TABLE_NAME, 
    round(((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024), 2) As "Approximate size (MB)", DATA_FREE 
    FROM information_schema.TABLES
    WHERE TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema'); 
