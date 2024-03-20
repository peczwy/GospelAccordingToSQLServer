<template>
	<v-container>
		<v-expansion-panels>
			<v-expansion-panel v-for="(sql, i) in sqls" :key="i" @click="onExpansionPanelClick">
				<v-expansion-panel-title>
					<div>{{sql.title}}<br/><b>{{sql.text}}</b></div>
				</v-expansion-panel-title>
				<v-expansion-panel-text>
					<pre><code class="language-sql">{{sql.sql}}</code></pre><br/>
					<div v-if="sql.source">
						Source: <a :href="sql.source">{{sql.source}}</a>
					</div>
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
	name: 'Tests',
	data: () => ({
		copySnackbar:{
			snackbar: false,
			text: 'Copied',
			timeout: 2000,
		},
		sqls:[
			{
				title: 'Experiment: fragmentation issue in RCSI', 
				text: 'Experiment that assesses what is the actual magnitude of the fragmentation when using RCSI level - we check the change after performing massive update (half records of the table) under 3 scenarios', 
				sql: getContent('./GospelAccordingToSQLServer/sqls/tests/rcsi_frag.sql'),
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
