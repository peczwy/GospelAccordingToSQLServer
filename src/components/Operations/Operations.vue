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
					<v-btn class="ma-2" outlined color="secondary" @click.stop.prevent="onCopy(i)">Copy</v-btn>
				</v-expansion-panel-content>
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
import {getContent} from '../../main.js'

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
				title: 'Clean buffers', 
				text: 'SQL to clean buffers', 
				sql: ['DBCC DROPCLEANBUFFERS','GO','DBCC FREEPROCCACHE','GO'].join('\n'),
			},
			{
				title: 'Opened transaction', 
				text: 'SQL to find out which transactions are opened', 
				sql: getContent('./sqls/ops/opened_transactions_1.sql'),
			},
			{
				title: 'Waits', 
				text: 'SQL to find out waits', 
				sql: getContent('./sqls/ops/waits_1.sql'),
				source: 'https://db-berater.blogspot.com/2015/04/guid-vs-intidentity-als-clustered-key.html'
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
</script>
