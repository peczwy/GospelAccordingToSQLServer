<template>
  <v-container>
	<v-expansion-panels>
		<v-expansion-panel v-for="(sql, i) in sqls" :key="i">
			<v-expansion-panel-header>
				<div>{{sql.title}}<br/><b>{{sql.text}}</b></div>
			</v-expansion-panel-header>
			<v-expansion-panel-content>
				<pre>{{sql.sql}}</pre><br/><br/>
				<span class="btn btn-info text-white copy-btn ml-auto" @click.stop.prevent="copySql(i)">Copy</span>
			</v-expansion-panel-content>
		</v-expansion-panel>
	</v-expansion-panels>
  </v-container>
</template>

<script>
export default {
	name: 'Operations',
	data: () => ({
		sqls:[
			{
				title: 'Clean buffers', 
				text: 'SQL to clean buffers', 
				sql: ['DBCC DROPCLEANBUFFERS','GO','DBCC FREEPROCCACHE','GO'].join('\n'),
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
	})
}
</script>
