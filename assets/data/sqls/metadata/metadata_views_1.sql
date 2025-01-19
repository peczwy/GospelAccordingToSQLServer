SELECT
	s.name AS Owner,
	v.name AS ViewName,
	vtu.TABLE_NAME AS TableName,
	vcu.COLUMN_NAME AS ColumnName,
	m.definition AS Definition
FROM
	sys.views v
	INNER JOIN sys.schemas s ON s.schema_id = v.schema_id
	INNER JOIN sys.sql_modules m ON m.object_id = v.object_id
	LEFT JOIN INFORMATION_SCHEMA.VIEW_TABLE_USAGE vtu ON vtu.VIEW_NAME = v.name
	LEFT JOIN INFORMATION_SCHEMA.VIEW_COLUMN_USAGE vcu ON vcu.VIEW_NAME = v.name AND vtu.TABLE_NAME = vcu.TABLE_NAME
-- WHERE
	-- s.name = 'dbo'
	-- AND vtu.TABLE_NAME = @tableName
	-- AND v.name = '@viewName';