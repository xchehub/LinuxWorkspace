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
