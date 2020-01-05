import Vue from 'vue'

import App from './App.vue'
import ProductDetails from './components/ProductDetails.vue'
import Landing from './components/Landing.vue'
import Cart from './components/Cart.vue'
import Checkout from './components/Checkout.vue'
import GuestCheckout from './components/GuestCheckout.vue'
import Thanks from './components/Thanks.vue'

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
        },
        {
            path: '/checkout',
            name: 'Checkout',
            component: Checkout
        },
        {
            path: '/guestCheckout',
            name: 'GuestCheckout',
            component: GuestCheckout

        },
        {
            path: '/thankYou',
            name: 'Thanks',
            component: Thanks

        }
    ],
})

Vue.config.productionTip = false


new Vue({
  render: h => h(App),
  router
}).$mount('#app')
