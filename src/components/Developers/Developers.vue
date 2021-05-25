<template>
  <v-container>
	<v-expansion-panels>
		<v-expansion-panel v-for="(sql, i) in sqls" :key="i" @click="onExpansionPanelClick">
			<v-expansion-panel-header>
				<div>{{sql.title}}<br/><b>{{sql.text}}</b></div>
			</v-expansion-panel-header>
			<v-expansion-panel-content>
				<pre><code class="language-sql">{{sql.sql}}</code></pre><br/>
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
				title: 'Create index', 
				text: 'SQL to create index', 
				sql: ['CREATE INDEX @name ON @schema.@table(@columns)'].join('\n'),
			},
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
