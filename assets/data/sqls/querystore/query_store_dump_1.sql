DECLARE 
 @results_row_count int = 100,
 @interval_start_time datetimeoffset(7) = '2025-05-28',
 @interval_end_time datetimeoffset(7) = '2025-06-29';


WITH XMLNAMESPACES(DEFAULT N'http://schemas.microsoft.com/sqlserver/2004/07/showplan'),
TopQuery AS (
SELECT TOP (@results_row_count)
    rs.plan_id,
    ROUND(CONVERT(float, SUM(rs.avg_duration*rs.count_executions))*0.001,2) AS total_duration,
    SUM(rs.count_executions) AS count_executions,
 ROUND(CONVERT(float, SUM(rs.avg_duration*rs.count_executions)/SUM(rs.count_executions))*0.001,2) AS avg_duration,
 ROUND(CONVERT(float, MAX(rs.max_duration))*0.001,2) AS max_duration
FROM sys.query_store_runtime_stats rs
WHERE rs.first_execution_time <= @interval_end_time AND rs.last_execution_time >= @interval_start_time
GROUP BY rs.plan_id
ORDER BY total_duration DESC
),
QueryParams AS 
(SELECT 
 query_id, total_duration, count_executions, avg_duration, max_duration,
    qp.value('@Column', 'NVARCHAR(MAX)') AS ParameterName,
    qp.value('@ParameterDataType', 'NVARCHAR(MAX)') AS ParameterDataType,
    TRIM('()' FROM qp.value('@ParameterCompiledValue', 'NVARCHAR(MAX)')) AS ParameterCompiledValue
FROM TopQuery tq
JOIN sys.query_store_plan p ON p.plan_id = tq.plan_id
OUTER APPLY (SELECT CAST(p.query_plan AS XML)) AS q(query_plan_xml)
OUTER APPLY q.query_plan_xml.nodes('(/ShowPlanXML/BatchSequence/Batch/Statements/StmtSimple/QueryPlan/ParameterList/ColumnReference)') AS x(qp))
,
QueryComponents AS
(SELECT 
 query_id, total_duration, count_executions, avg_duration, max_duration,
 STRING_AGG(CONCAT(qp.ParameterName, N' ', qp.ParameterDataType), N', ') AS Params,
 STRING_AGG(CONCAT(qp.ParameterName, N' = ', qp.ParameterCompiledValue), N', ') AS Vals
FROM QueryParams qp
GROUP BY query_id, total_duration, count_executions, avg_duration, max_duration)
SELECT
    qc.query_id,
    q.object_id object_id,
    ISNULL(OBJECT_NAME(q.object_id),'''') object_name,
    qt.query_sql_text query_sql_text,
 total_duration, count_executions, avg_duration, max_duration,
 CONCAT(N'EXEC sys.sp_executesql N''', 
  REPLACE(CASE WHEN qt.query_sql_text LIKE '(@%' THEN RIGHT(qt.query_sql_text, LEN(query_sql_text) - PATINDEX('%[^0-9x])%', qt.query_sql_text) - 1) ELSE qt.query_sql_text END, '''', ''''''), 
  N''',', CHAR(13), CHAR(10), 
  N'N''', qc.Params, N''',', CHAR(13), CHAR(10), 
  qc.Vals) AS q
FROM QueryComponents qc
JOIN sys.query_store_query q ON q.query_id = qc.query_id
JOIN sys.query_store_query_text qt ON q.query_text_id = qt.query_text_id
--SELECT *
--FROM QueryParams
ORDER BY total_duration DESC
;
 