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

new Vue({
  vuetify,
  render: h => h(App)
}).$mount('#app')
