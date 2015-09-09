//find all tables containing column with specified name

SELECT COLUMN_NAME, TABLE_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME LIKE '%MyName%'
