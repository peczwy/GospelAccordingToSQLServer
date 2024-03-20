SELECT
	s.stats_id,
	CONCAT(sc.name, '.', t.name) AS table_name,
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