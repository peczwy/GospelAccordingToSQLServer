SELECT
	o1.object_id as key_object_id,
	o1.name AS key_name,
	s2.name AS source_schema_name,
	o2.object_id AS source_table_object_id,
	o2.name AS source_table_name,
	s3.name AS referenced_schema_name,
	o3.object_id AS referenced_table_object_id,
	o3.name AS referenced_table_name,
	fk.delete_referential_action AS delete_referential_action,
	fk.update_referential_action AS update_referential_action
FROM
	sys.foreign_keys fk
	INNER JOIN sys.objects o1 ON o1.object_id = fk.object_id
	INNER JOIN sys.objects o2 ON o2.object_id = fk.parent_object_id
	INNER JOIN sys.schemas s2 ON o2.schema_id = s2.schema_id
	INNER JOIN sys.objects o3 ON o3.object_id = fk.referenced_object_id
	INNER JOIN sys.schemas s3 ON o3.schema_id = s3.schema_id
-- WHERE
    -- Note: uncomment if you look for a specific table that is referenced
	-- fk.referenced_object_id = OBJECT_ID(@referencedTableName)
    -- Note: uncomment if you look for a parent table that references the other tables
	-- fk.parent_object_id = OBJECT_ID(@table)