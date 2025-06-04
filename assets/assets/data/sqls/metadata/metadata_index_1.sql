SELECT
	i.index_id,
	i.name as index_name,
	i.type_desc,
	i.filter_definition,
	i.is_primary_key,
	i.is_unique,
	i.is_unique_constraint,
	i.object_id as table_object_id,
	o.name as table_name,
	s.name as schema_name
FROM
	sys.indexes i
	INNER JOIN sys.objects o ON o.object_id = i.object_id
	INNER JOIN sys.schemas s on s.schema_id = o.schema_id
-- Note: uncomment if you look for references of a specific view
-- WHERE
-- Note: uncomment if you look for indexes of specific table
--  o.name = @tableName