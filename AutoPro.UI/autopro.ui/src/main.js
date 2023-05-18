import { createApp } from 'vue'
import App from './App.vue'
import Toast from "vue-toastification";
import ToastPlugin from 'vue-toast-notification';
import 'vue-toast-notification/dist/theme-default.css';
// import 'vue-toast-notification/dist/theme-bootstrap.css';
// Import the CSS or use your own!
import Vue from 'vue';
import store from './js/store';
import router from './router'
/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import { faUserSecret } from '@fortawesome/free-solid-svg-icons'
import '@fortawesome/fontawesome-free/css/all.css'
import "vue-toastification/dist/index.css";
import AwesomeVueStarRating from 'awesome-vue-star-rating'
import StarRating from 'vue-star-rating'
/* add icons to the library */
// const EventBus = new Vue();
// Vue.prototype.$eventBus = EventBus;

// Vue.config.productionTip = false
library.add(faUserSecret)
const app = createApp(App)
const options = {
    // You can set your default options here
    position: 'top-right',

    // place newest toast on the top
    newestOnTop: true,

    // the max number of toasts
    maxToasts: 20,

    // name of the Vue Transition or object with classes to use
    // only enter-active, leave-active and move are applied.
    transition: 'Vue-Toastification__bounce',

    // duration in ms
    // or an object: {enter: Number, leave: Number}
    transitionDuration: 750,

    // allows to dismiss by drag & swipe events
    draggable: true,
    draggablePercent: 0.6,

    // auto pause when out of focus
    pauseOnFocusLoss: true,

    // auto pause on hover
    pauseOnHover: true,

    // close on click
    closeOnClick: true,

    // auto dismiss after this timeout
    timeout: 5000,

    // container element
    container: document.body,

    // custom classes
    toastClassName: [],

    // body classes
    bodyClassName: [],

    // show/hide the progress bar
    hideProgressBar: false,

    // show/hide the close button
    hideCloseButton: false,

    // custom icons here
    icon: true
};
app.use(store)
app.use(Toast, options)
app.config.globalProperties.$toast
app.use(ToastPlugin);
app.use(router)
app.component('font-awesome-icon', FontAwesomeIcon)
app.component('star-rating', AwesomeVueStarRating)
app.component('awesome-vue-star-rating', AwesomeVueStarRating)
app.mount('#app')

