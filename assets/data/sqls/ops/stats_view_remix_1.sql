WITH STAT AS(
SELECT
	s.stats_id,
	t.name AS table_name,
	s.name AS stats_name,
	s.auto_created,
	p.last_updated,
	s.has_filter,
	p.modification_counter,
	p.persisted_sample_percent,
	p.rows,
	p.rows_sampled,
	p.unfiltered_rows,
	p.steps,
	100 * CAST(p.rows_sampled AS FLOAT) / CAST(p.rows AS FLOAT) AS percent_sampled
FROM
	sys.stats s
	INNER JOIN sys.tables t ON s.object_id = t.object_id
	INNER JOIN sys.schemas sc ON sc.schema_id = t.schema_id
	CROSS APPLY sys.dm_db_stats_properties(t.object_id, s.stats_id) p
)
SELECT * 
FROM
	STAT
WHERE
	table_name IN (
	SELECT 
		vtu.TABLE_NAME AS TableName
	FROM 
		sys.views v
		INNER JOIN sys.schemas s ON s.schema_id = v.schema_id
		INNER JOIN sys.sql_modules m ON m.object_id = v.object_id
		LEFT JOIN INFORMATION_SCHEMA.VIEW_TABLE_USAGE vtu ON vtu.VIEW_NAME = v.name
		LEFT JOIN INFORMATION_SCHEMA.VIEW_COLUMN_USAGE vcu ON vcu.VIEW_NAME = v.name AND vtu.TABLE_NAME = vcu.TABLE_NAME 
	WHERE
		-- Enter name of the view
		v.name = @stats
	)