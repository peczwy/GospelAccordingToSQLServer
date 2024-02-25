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

registerPlugins(app)

app.mount('#app')