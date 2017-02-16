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
    
# List database status
# output 
# +--------+----------+----------+----------+------------+
# | ENGINE | Data MB  | Index MB | Total MB | Num Tables |
# +--------+----------+----------+----------+------------+
# | NULL   |     NULL |     NULL |     NULL |         18 |
# | CSV    |      0.0 |      0.0 |      0.0 |          4 |
# | InnoDB | 114932.8 | 112355.5 | 227288.2 |        103 |
# | MyISAM |      2.5 |      2.3 |      4.8 |          5 |
# +--------+----------+----------+----------+------------+
# 4 rows in set (0.66 sec)
SELECT  ENGINE,
    ROUND(SUM(data_length) /1024/1024, 1) AS "Data MB",
    ROUND(SUM(index_length)/1024/1024, 1) AS "Index MB",
    ROUND(SUM(data_length + index_length)/1024/1024, 1) AS "Total MB",
    COUNT(*) "Num Tables"
FROM  INFORMATION_SCHEMA.TABLES
WHERE  table_schema not in ("information_schema", "PERFORMANCE_SCHEMA", "SYS_SCHEMA", "ndbinfo")
GROUP BY  ENGINE;
