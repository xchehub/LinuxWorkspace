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

# concate two column
select concat(id, '_',xxxxx_id) from xxxxx_data.xxxxx_map

# substring
select substr(xxxxx_id, 100), id from xxxxx_data.xxxxx_map

# concate group by result
SELECT xxxxx_id, GROUP_CONCAT(xxxxx_map_id SEPARATOR ',') FROM xxxxx_data.xxxxx_rate GROUP BY xxxxx_id

# process list
SHOW PROCESSLIST;

# clone a table ref.https://blog.longwin.com.tw/2013/08/mysql-copy-table-command-2013/
create tabel xxxxx like yyyyy;
insert into xxxxx select * from yyyyy;

# 
SHOW SESSION VARIABLES LIKE 'wait_timeout';

-- Making sense of INNODB buffer pool stats
-- https://dba.stackexchange.com/questions/56494/making-sense-of-innodb-buffer-pool-stats
-- Buffer pool size is in pages not bytes.
-- Buffer Pool size in GB
mysql> SELECT FORMAT(BufferPoolPages*PageSize/POWER(1024,3),2) BufferPoolDataGB FROM
    -> (SELECT variable_value BufferPoolPages FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_buffer_pool_pages_total') A,
    -> (SELECT variable_value PageSize FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_page_size') B;
-- the amount of data in the Buffer Pool size in GB
mysql> SELECT FORMAT(BufferPoolPages*PageSize/POWER(1024,3),2) BufferPoolDataGB FROM
    -> (SELECT variable_value BufferPoolPages FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_buffer_pool_pages_data') A,
    -> (SELECT variable_value PageSize FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_page_size') B;
-- the percentage of the Buffer Pool in use
mysql> SELECT CONCAT(FORMAT(DataPages*100.0/TotalPages,2),' %') BufferPoolDataPercentage FROM
    -> (SELECT variable_value DataPages FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_buffer_pool_pages_data') A,
    -> (SELECT variable_value TotalPages FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_buffer_pool_pages_total') B;
-- Modified db pages is the number of pages in the Buffer Pool that have to be written back to the database. 
-- They are also referred to as dirty pages.
-- the Space Taken Up by Dirty Pages
mysql> SELECT FORMAT(DirtyPages*PageSize/POWER(1024,3),2) BufferPoolDirtyGB FROM
    -> (SELECT variable_value DirtyPages FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_buffer_pool_pages_dirty') A,
    -> (SELECT variable_value PageSize FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_page_size') B;
-- the Percentage of Dirty Pages
mysql> SELECT CONCAT(FORMAT(DirtyPages*100.0/TotalPages,2),' %') BufferPoolDirtyPercentage FROM
    -> (SELECT variable_value DirtyPages FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_buffer_pool_pages_dirty') A,
    -> (SELECT variable_value TotalPages FROM information_schema.global_status
    -> WHERE variable_name = 'Innodb_buffer_pool_pages_total') B;
-- Other information
mysql> SHOW GLOBAL STATUS LIKE 'Innodb_buffer_pool%';




