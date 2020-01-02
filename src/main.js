import Vue from 'vue'

import App from './App.vue'
import ProductDetails from './components/ProductDetails.vue'
import Landing from './components/Landing.vue'
import Cart from './components/Cart.vue'

import VueRouter from 'vue-router'
Vue.use(VueRouter)

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'Landing',
            component: Landing
        },
        {
            path: '/productDetails/:tempid',
            name: 'ProductDetails',
            component: ProductDetails
        },
        {
            path: '/cart',
            name: 'Cart',
            component: Cart
        }
    ],
})

Vue.config.productionTip = false


new Vue({
  render: h => h(App),
  router
}).$mount('#app')
