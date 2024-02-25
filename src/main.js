/**
 * main.js
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */
// Plugins
import { registerPlugins } from '@/plugins'

// Components
import App from './App.vue'

// Composables
import { createApp } from 'vue'

// Font Awsome
import { library } from '@fortawesome/fontawesome-svg-core';
import { faSkull, faSearch, faExclamation, faDatabase, faBolt, faChartBar, faUserSecret, faWarehouse, faKeyboard, faTooth, faImage } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
library.add(faSkull, faSearch, faExclamation, faDatabase, faBolt, faChartBar, faUserSecret, faWarehouse, faKeyboard, faTooth, faImage )

const app = createApp(App)
app.component('font-awesome-icon', FontAwesomeIcon) 

app.mixin({
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
        }
    },
  })

registerPlugins(app)

app.mount('#app')