<template>
  <v-container>
	<v-expansion-panels>
		<v-expansion-panel v-for="(sql, i) in sqls" :key="i" @click="onExpansionPanelClick">
			<v-expansion-panel-title>
				<div>{{sql.title}}<br/><b>{{sql.text}}</b></div>
			</v-expansion-panel-title>
			<v-expansion-panel-text>
				<pre><code class="language-sql">{{sql.sql}}</code></pre><br/>
				<v-btn class="ma-2" outlined color="secondary" @click.stop.prevent="onCopy(i)">Copy</v-btn>
			</v-expansion-panel-text>
		</v-expansion-panel>
	</v-expansion-panels>
	<v-snackbar v-model="copySnackbar.snackbar" :timeout="copySnackbar.timeout">
		{{ copySnackbar.text }}
		<template v-slot:action="{ attrs }">
		<v-btn color="blue" text v-bind="attrs" @click="copySnackbar.snackbar = false">Close</v-btn>
		</template>
	</v-snackbar>
  </v-container>
</template>
<script>
import Prism from 'prismjs'
import 'prismjs/themes/prism-coy.css'
import 'prismjs/components/prism-sql'

export default {
	name: 'Operations',
	data: () => ({
		copySnackbar:{
			snackbar: false,
			text: 'Copied',
			timeout: 2000,
		},
		sqls:[
			{
				title: 'Create index', 
				text: 'SQL to create index', 
				sql: ['CREATE INDEX @name ON @schema.@table(@columns)'].join('\n'),
			},
			{
				title: 'Template: Recreate clustered index (1)', 
				text: 'Template for the recreation of the clustered index', 
				sql: getContent('./sqls/dev/template_recreate_clustered_index_1.sql'),
			},
			{
				title: 'Log-safe delete', 
				text: 'Loop for the DELETE that counters log-growth', 
				sql: getContent('./sqls/dev/delete_1.sql'),
			}
		],
	}),
	methods: {
		onExpansionPanelClick() {
			setTimeout(function(){ Prism.highlightAll(); }, 50);
		},
		onCopy(index){
			this.copySql(index)
			this.copySnackbar.snackbar = true
		}
	}
}

export function getContent(theUrl)
{
    let xmlhttp = new XMLHttpRequest();
    
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            return xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", theUrl, false);
	
    xmlhttp.send();
    
    return xmlhttp.response;
}
</script>
