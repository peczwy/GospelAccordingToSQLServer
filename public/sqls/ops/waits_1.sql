SELECT  
	DOWT.session_id,
	DOWT.wait_duration_ms,
	DOWT.wait_type,
	DOWT.resource_description,
	DOWT.blocking_session_id
FROM    
	sys.dm_exec_sessions AS DES 
	INNER JOIN sys.dm_os_waiting_tasks AS DOWT ON (DES.session_id = DOWT.session_id)
WHERE   
	DES.is_user_process = 1;