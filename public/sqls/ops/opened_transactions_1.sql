SELECT 
	[sessions].[session_id] AS [session_id], 
	[transactions].[transaction_id] AS [transaction_id],
	[databases].[name] AS [database_name],
	[sessions].[nt_user_name] AS [nt_user_name],
	[sessions].[login_time] AS [session_login_time],
	[sessions].[last_request_start_time] AS [last_request_start_time],
	[sessions].[last_request_end_time] AS [last_request_end_time],
	[sessions].[status] AS [blocked_session_status],
	[sessions].[memory_usage] AS [memory_8kb_pages],
	[sessions].[row_count] AS [row_count],
	[sessions].[lock_timeout] AS [lock_timeout],
	[sessions].[open_transaction_count] AS [open_transaction_count],
	[sessions].[transaction_isolation_level] AS [session_transaction_isolation_level],
	[transactions].[dtc_isolation_level] AS [transaction_isolation_level],
	[transactions].[transaction_type] AS [transaction_type],
	[transactions].[transaction_state] AS [transaction_state],
	[transactions].[transaction_status] AS [transaction_status],
	[transactions].[transaction_status2] AS [transaction_status2],
	[transactions].[dtc_state] AS [dtc_state],
	[transactions].[dtc_status] AS [dtc_status],
	cast('' as xml).value('xs:base64Binary(sql:column("[plan].[text]"))', 'varchar(max)') AS [last_query]
FROM 
	sys.dm_exec_sessions [sessions]
	INNER JOIN sys.databases [databases] ON [sessions].[database_id] = [databases].[database_id]
	INNER JOIN sys.dm_tran_session_transactions [session_transactions] ON [sessions].[session_id] = [session_transactions].[session_id]
	INNER JOIN sys.dm_tran_active_transactions [transactions] ON [transactions].[transaction_id] = [session_transactions].[transaction_id]
	LEFT JOIN sys.dm_exec_connections [connection] ON [sessions].[session_id] = [connection].[session_id]
	OUTER APPLY (SELECT convert(varbinary(max), [text]) AS [text] FROM sys.dm_exec_sql_text ([connection].[most_recent_sql_handle])) [plan]
WHERE
    [sessions].[is_user_process] = 1;