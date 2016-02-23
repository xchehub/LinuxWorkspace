//find all tables containing column with specified name

SELECT COLUMN_NAME, TABLE_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME LIKE '%MyName%'

//change the data type for a column in MySQL
ALTER TABLE tablename MODIFY columnname INTEGER
