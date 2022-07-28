/*
Preparatory work, remove database and create a new one:
*/
USE [master];
GO

DROP DATABASE IF EXISTS [OPTIMISTIC_TEST];
GO

CREATE DATABASE [OPTIMISTIC_TEST]; 
GO

USE [OPTIMISTIC_TEST];
GO

/*
Explicitly disable the RCSI
*/
ALTER DATABASE [OPTIMISTIC_TEST]
SET READ_COMMITTED_SNAPSHOT OFF
WITH ROLLBACK IMMEDIATE;
GO

/*******
Parameters:
*****/
DECLARE @magnitude INT = 20;

/*
Create tables used for checking the behaviour:
- RC is a table that inserts data and updates using READ COMMITTED
- RC_TO_RCSI is a table that inserts data using READ COMMITTED and updates using READ COMMITTED SNAPSHOT
- RCSI is a table that inserts data and updates using READ COMMITTED SNAPSHOT
*/
EXEC ('CREATE TABLE TABLE_RC(VAL INT PRIMARY KEY, PAYLOAD CHAR(' + @magnitude +'));');
EXEC ('CREATE TABLE TABLE_RC_TO_RCSI(VAL INT PRIMARY KEY, PAYLOAD CHAR(' + @magnitude +'));');
EXEC ('CREATE TABLE TABLE_RCSI(VAL INT PRIMARY KEY, PAYLOAD CHAR(' + @magnitude +'));');

/*
Insert data into TABLE_RC/TABLE_RC_TO_RCSI using pessimistic behaviour
*/
WITH D1(X) AS (SELECT 1 UNION ALL SELECT 1),
D2(X) AS (SELECT 1 FROM D1 AS D CROSS JOIN D1 AS DD),
D3(X) AS (SELECT 1 FROM D2 AS D CROSS JOIN D2 AS DD),
D4(X) AS (SELECT 1 FROM D3 AS D CROSS JOIN D3 AS DD),
D5(X) AS (SELECT 1 FROM D4 AS D CROSS JOIN D4 AS DD),
D6(X) AS (SELECT 1 FROM D4 AS D CROSS JOIN D5 AS DD),
DATASET(X) AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM D6)
INSERT INTO TABLE_RC(VAL, PAYLOAD)
SELECT X, REPLICATE('A', @magnitude) FROM DATASET;

INSERT INTO TABLE_RC_TO_RCSI(VAL, PAYLOAD)
SELECT VAL, PAYLOAD FROM TABLE_RC;


/*
Insert data into TABLE_RCSI using optimistic behaviour
*/
ALTER DATABASE [OPTIMISTIC_TEST]
SET READ_COMMITTED_SNAPSHOT ON
WITH ROLLBACK IMMEDIATE;


WITH D1(X) AS (SELECT 1 UNION ALL SELECT 1),
D2(X) AS (SELECT 1 FROM D1 AS D CROSS JOIN D1 AS DD),
D3(X) AS (SELECT 1 FROM D2 AS D CROSS JOIN D2 AS DD),
D4(X) AS (SELECT 1 FROM D3 AS D CROSS JOIN D3 AS DD),
D5(X) AS (SELECT 1 FROM D4 AS D CROSS JOIN D4 AS DD),
D6(X) AS (SELECT 1 FROM D4 AS D CROSS JOIN D5 AS DD),
DATASET(X) AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM D6)
INSERT INTO TABLE_RCSI(VAL, PAYLOAD)
SELECT X, REPLICATE('A', @magnitude) FROM DATASET;
GO

/*
Check the fragmentation:
*/
SELECT 
	'dbo.TABLE_RC' AS [table],
	'before update' AS [when],
	alloc_unit_type_desc AS [alloc_unit],
	index_level,
	page_count,
	convert(decimal(4,2), avg_page_space_used_in_percent) as [space_used],
	convert(decimal(5,2), avg_fragmentation_in_percent) as [frag%]
FROM 
	sys.dm_db_index_physical_stats(db_id(), object_id(N'dbo.TABLE_RC'), 1, null, 'DETAILED');
GO

SELECT 
	'dbo.TABLE_RC_TO_RCSI' AS [table],
	'before update' AS [when],
	alloc_unit_type_desc AS [alloc_unit],
	index_level,
	page_count,
	convert(decimal(4,2), avg_page_space_used_in_percent) as [space_used],
	convert(decimal(5,2), avg_fragmentation_in_percent) as [frag%]
FROM 
	sys.dm_db_index_physical_stats(db_id(), object_id(N'dbo.TABLE_RC_TO_RCSI'), 1, null, 'DETAILED');
GO

SELECT 
	'dbo.TABLE_RCSI' AS [table],
	'before update' AS [when],
	alloc_unit_type_desc AS [alloc_unit],
	index_level,
	page_count,
	convert(decimal(4,2), avg_page_space_used_in_percent) as [space_used],
	convert(decimal(5,2), avg_fragmentation_in_percent) as [frag%]
FROM 
	sys.dm_db_index_physical_stats(db_id(), object_id(N'dbo.TABLE_RCSI'), 1, null, 'DETAILED');
GO

/*
Perform the actual update update:
*/
UPDATE TABLE_RCSI SET VAL = -VAL WHERE VAL % 2 = 0;
UPDATE TABLE_RC_TO_RCSI SET VAL = -VAL WHERE VAL % 2 = 0;
GO

ALTER DATABASE [OPTIMISTIC_TEST]
SET READ_COMMITTED_SNAPSHOT OFF
WITH ROLLBACK IMMEDIATE;
GO

UPDATE TABLE_RC SET VAL = -VAL WHERE VAL % 2 = 0;
GO

/*
Check the fragmentation again:
*/
SELECT 
	'dbo.TABLE_RC' AS [table],
	'after update' AS [when],
	alloc_unit_type_desc AS [alloc_unit],
	index_level,
	page_count,
	convert(decimal(4,2), avg_page_space_used_in_percent) as [space_used],
	convert(decimal(5,2), avg_fragmentation_in_percent) as [frag%]
FROM 
	sys.dm_db_index_physical_stats(db_id(), object_id(N'dbo.TABLE_RC'), 1, null, 'DETAILED');
GO

SELECT 
	'dbo.TABLE_RC_TO_RCSI' AS [table],
	'after update' AS [when],
	alloc_unit_type_desc AS [alloc_unit],
	index_level,
	page_count,
	convert(decimal(4,2), avg_page_space_used_in_percent) as [space_used],
	convert(decimal(5,2), avg_fragmentation_in_percent) as [frag%]
FROM 
	sys.dm_db_index_physical_stats(db_id(), object_id(N'dbo.TABLE_RC_TO_RCSI'), 1, null, 'DETAILED');
GO

SELECT 
	'dbo.TABLE_RCSI' AS [table],
	'after update' AS [when],
	alloc_unit_type_desc AS [alloc_unit],
	index_level,
	page_count,
	convert(decimal(4,2), avg_page_space_used_in_percent) as [space_used],
	convert(decimal(5,2), avg_fragmentation_in_percent) as [frag%]
FROM 
	sys.dm_db_index_physical_stats(db_id(), object_id(N'dbo.TABLE_RCSI'), 1, null, 'DETAILED');
GO
