import { createApp } from 'vue'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faMagnifyingGlass, faBars } from '@fortawesome/free-solid-svg-icons'
library.add(faMagnifyingGlass, faBars)
import App from './App.vue'
createApp(App)
.component('font-awesome-icon', FontAwesomeIcon)
.mount('#app')
