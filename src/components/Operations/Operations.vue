<template>
  <v-container>
	<v-expansion-panels>
		<v-expansion-panel v-for="(sql, i) in sqls" :key="i" @click="onExpansionPanelClick">
			<v-expansion-panel-header>
				<div>{{sql.title}}<br/><b>{{sql.text}}</b></div>
			</v-expansion-panel-header>
			<v-expansion-panel-content>
				<pre><code class="language-sql">{{sql.sql}}</code></pre><br/>
				<div v-if="sql.source">
					Source: <a :href="sql.source">{{sql.source}}</a>
				</div>
				<span class="btn btn-info text-white copy-btn ml-auto" @click.stop.prevent="copySql(i)">Copy</span>
			</v-expansion-panel-content>
		</v-expansion-panel>
	</v-expansion-panels>
  </v-container>
</template>
<script>
import Prism from 'prismjs'
import 'prismjs/themes/prism-coy.css'
import 'prismjs/components/prism-sql'

export default {
	name: 'Operations',
	data: () => ({
		sqls:[
			{
				title: 'Clean buffers', 
				text: 'SQL to clean buffers', 
				sql: ['DBCC DROPCLEANBUFFERS','GO','DBCC FREEPROCCACHE','GO'].join('\n'),
			},
			{
				title: 'Opened transaction', 
				text: 'SQL to find out which transactions are opened', 
				sql: ['SELECT','\t[sessions].[session_id] AS [session_id],','\t[transactions].[transaction_id] AS [transaction_id],','\t[databases].[name] AS [database_name],','\t[sessions].[nt_user_name] AS [nt_user_name],','\t[sessions].[login_time] AS [session_login_time],','\t[sessions].[last_request_start_time] AS [last_request_start_time],','\t[sessions].[last_request_end_time] AS [last_request_end_time],','\t[sessions].[status] AS [blocked_session_status],','\t[sessions].[memory_usage] AS [memory_8kb_pages],','\t[sessions].[row_count] AS [row_count],','\t[sessions].[lock_timeout] AS [lock_timeout],','\t[sessions].[open_transaction_count] AS [open_transaction_count],','\t[sessions].[transaction_isolation_level] AS [session_transaction_isolation_level],','\t[transactions].[dtc_isolation_level] AS [transaction_isolation_level],','\t[transactions].[transaction_type] AS [transaction_type],','\t[transactions].[transaction_state] AS [transaction_state],','\t[transactions].[transaction_status] AS [transaction_status],','\t[transactions].[transaction_status2] AS [transaction_status2],','\t[transactions].[dtc_state] AS [dtc_state],','\t[transactions].[dtc_status] AS [dtc_status],','\tcast(\'\' as xml).value(\'xs:base64Binary(sql:column("[plan].[text]"))\', \'varchar(max)\') AS [last_query]','FROM ','\tsys.dm_exec_sessions [sessions]','\tINNER JOIN sys.databases [databases] ON [sessions].[database_id] = [databases].[database_id]','\tINNER JOIN sys.dm_tran_session_transactions [session_transactions] ON [sessions].[session_id] = [session_transactions].[session_id]','\tINNER JOIN sys.dm_tran_active_transactions [transactions] ON [transactions].[transaction_id] = [session_transactions].[transaction_id]','\tLEFT JOIN sys.dm_exec_connections [connection] ON [sessions].[session_id] = [connection].[session_id]','\tOUTER APPLY (SELECT convert(varbinary(max), [text]) AS [text] FROM sys.dm_exec_sql_text ([connection].[most_recent_sql_handle])) [plan]','WHERE','\t[sessions].[is_user_process] = 1;'].join('\n'),
			},
			{
				title: 'Waits', 
				text: 'SQL to find out waits', 
				sql: ['SELECT','\tDOWT.session_id,','\tDOWT.wait_duration_ms,','\tDOWT.wait_type,','\tDOWT.resource_description,','\tDOWT.blocking_session_id','FROM','\tsys.dm_exec_sessions AS DES','\tINNER JOIN sys.dm_os_waiting_tasks AS DOWT ON (DES.session_id = DOWT.session_id)','WHERE','\tDES.is_user_process = 1;'].join('\n'),
				source: 'https://db-berater.blogspot.com/2015/04/guid-vs-intidentity-als-clustered-key.html'
			}
			
			
		],
		copySql (i) {
			var textArea = document.createElement("textarea");
			textArea.value = this.sqls[i].sql;

			textArea.style.top = "0";
			textArea.style.left = "0";
			textArea.style.position = "fixed";

			document.body.appendChild(textArea);
			textArea.focus();
			textArea.select();

			try {
				var successful = document.execCommand('copy');
				var msg = successful ? 'successful' : 'unsuccessful';
				console.log('Fallback: Copying text command was ' + msg);
			} catch (err) {
				console.error('Fallback: Oops, unable to copy', err);
			}
			document.body.removeChild(textArea);
        }
	}),
	methods: {
		onExpansionPanelClick() {
			setTimeout(function(){ Prism.highlightAll(); }, 50);
		}
	}
}
</script>
