DECLARE 
	@table_name NVARCHAR(128),
	@schema_name NVARCHAR(128),
	@index_name NVARCHAR(128),
	@is_unique_constraint INT,
	@is_primary_key INT,
	@sql NVARCHAR(max);
DECLARE index_cursor CURSOR FOR 
SELECT 
	s.name, 
	o.name, 
	i.name,
	i.is_unique_constraint,
	i.is_primary_key
FROM
	sys.indexes i 
	INNER JOIN sys.objects o ON i.object_id = o.object_id
	INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE
	-- Note: Specify the name of the tables which should be cleared up from all indexes 
	o.name IN (@table);


OPEN index_cursor  
  
FETCH NEXT FROM index_cursor INTO @schema_name, @table_name, @index_name, @is_unique_constraint, @is_primary_key
  
WHILE @@FETCH_STATUS = 0  
BEGIN  
	IF(@is_unique_constraint = 1 OR @is_primary_key = 1)
	BEGIN
		SET @sql = CONCAT('ALTER TABLE [',@schema_name,'].[', @table_name, '] DROP CONSTRAINT [', @index_name,'];');
	END
	ELSE
	BEGIN
		SET @sql = CONCAT('DROP INDEX [', @index_name,'] ON [',@schema_name,'].[', @table_name, '];');
	END
	EXEC(@sql);
	--PRINT @sql
	FETCH NEXT FROM index_cursor INTO @schema_name, @table_name, @index_name 
END   
CLOSE index_cursor;  
DEALLOCATE index_cursor;
