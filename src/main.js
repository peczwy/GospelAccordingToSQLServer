import Vue from 'vue';
import App from './App.vue';
import vuetify from './plugins/vuetify';
import VueCodeHighlight from 'vue-code-highlight';

import { library } from '@fortawesome/fontawesome-svg-core';
import { faSkull, faSearch, faExclamation, faDatabase, faBolt, faChartBar, faUserSecret, faWarehouse, faKeyboard, faTooth } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

library.add(faSkull, faSearch, faExclamation, faDatabase, faBolt, faChartBar, faUserSecret, faWarehouse, faKeyboard, faTooth )

Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.use(VueCodeHighlight)

Vue.config.productionTip = false

Vue.mixin({
  methods: {
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
	},
  },
})

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

new Vue({
  vuetify,
  render: h => h(App)
}).$mount('#app')
