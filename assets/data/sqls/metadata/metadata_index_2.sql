SELECT
    c.name as column_name,
	ic.key_ordinal - 1 as column_order,
	ic.is_included_column as is_included,
	ic.is_descending_key as is_descending
FROM
    sys.indexes i
    INNER JOIN sys.index_columns ic ON ic.object_id = i.object_id AND ic.index_id = i.index_id
    INNER JOIN sys.columns c ON c.object_id = ic.object_id AND c.column_id = ic.column_id
WHERE
    i.name = @index