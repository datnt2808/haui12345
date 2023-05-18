import { createRouter, createWebHistory } from "vue-router"
import Home from '@/views/user/Home.vue'
import About from '@/views/user/About.vue'
import News from '@/views/user/News.vue'
import Help from '@/views/user/Help.vue'
import Payment from '@/views/user/Payment.vue'
import Guarantee from '@/views/user/Guarantee.vue'
import FreeShip from '@/views/user/FreeShip.vue'
import Contact from '@/views/user/Contact.vue'
import Purchase from '@/views/user/Purchase.vue'
import SignUp from '@/views/user/SignUp.vue'
import Register from '@/views/user/Register.vue'
import ForgotPassword from '@/views/user/ForgotPassword.vue'
import Cart from '@/views/user/Cart.vue'
import Order from '@/views/user/Order.vue'
import FavoriteProduct from '@/views/user/FavoriteProduct.vue'
import DetailsProduct from '@/views/user/DetailsProduct.vue'
import DetailsNews from '@/views/user/DetailsNews.vue'
import DetailsUser from '@/views/user/DetailsUser.vue'
import ProductByCategory from '@/views/user/ProductByCategory.vue'
import VNPayPayment from '@/views/user/VNPayPayment.vue'

// Admin
import AdminHome from '@/views/admin/AdminHome.vue'
import AdminAccount from '@/views/admin/AdminAccount.vue'
import AdminBrand from '@/views/admin/AdminBrand.vue'
import AdminCategory from '@/views/admin/AdminCategory.vue'
import AdminContact from '@/views/admin/AdminContact.vue'
import AdminNews from '@/views/admin/AdminNews.vue'
import AdminOrder from '@/views/admin/AdminOrder.vue'
import AdminOrderReturn from '@/views/admin/AdminOrderReturn.vue'
import AdminProduct from '@/views/admin/AdminProduct.vue'
import AdminComment from '@/views/admin/AdminComment.vue'
import AdminDashload from '@/views/admin/AdminDashload.vue'
import AdminRevenueStatistics from '@/views/admin/AdminRevenueStatistics.vue'

// 403,403 Error
import ForBidden from '@/views/ForBidden.vue'
import NotFound from '@/views/NotFound.vue'

const routes = [
    { path: '/home', component: Home },
    { path: '', component: Home },
    { path: '/about', component: About },
    { path: '/news', component: News },
    {
        path: '/helps',
        component: Help,
        children:
            [
                { path: '/helps/pay-ment', component: Payment },
                { path: '/helps/guarantee', component: Guarantee },
                { path: '/helps/free-ship', component: FreeShip },
            ]
    },
    { path: '/helps/pay-ment', component: Payment },
    { path: '/helps/guarantee', component: Guarantee },
    { path: '/helps/free-ship', component: FreeShip },
    { path: '/contact', component: Contact },
    { path: '/account/sign-up', component: SignUp },
    { path: '/account/register', component: Register },
    { path: '/account/forgot-password', component: ForgotPassword },
    // { path: '/cart', name: 'cart', component: Cart, props: { productCart: {} } },
    // { path: '/cart', name: 'cart', component: Cart, props: true },
    { path: '/cart', component: Cart },
    { path: '/order', component: Order },
    { path: '/product/:id', name: 'product', component: DetailsProduct, props: true },
    { path: '/news/:id', name: 'news', component: DetailsNews, props: true },
    { path: '/user/:id', name: 'user', component: DetailsUser, props: true },
    { path: '/list-product-favorite', component: FavoriteProduct },
    { path: '/product/brand/:id', name: 'productBrand', component: ProductByCategory, props: true },
    { path: '/product/category/:id', name: 'productCategory', component: ProductByCategory, props: true },
    { path: '/product/search/', name: 'productFilter', component: ProductByCategory, props: (route) => ({ query: route.query.key }) },
    { path: '/purchase', component: Purchase },
    {
        path: '/haui.com/checkout/result',
        component: VNPayPayment,
        name: 'checkout-result',
    },

    //Admin
    {
        path: '/admin',
        component: AdminHome,
        children:
            [
                { path: '/admin/account', component: AdminAccount },
                { path: '/admin/brand', component: AdminBrand },
                { path: '/admin/category', component: AdminCategory },
                { path: '/admin/contact', component: AdminContact },
                {
                    path: '/admin/order',
                    component: AdminOrder,
                    children:
                        [
                            { path: 'statusOrders/:id', name: 'orderStatus', component: AdminOrder, props: true },
                        ]
                },
                { path: '/admin/order/orderStatusReturn/:id', name: 'orderStatusReturn', component: AdminOrderReturn, props: true },
                { path: '/admin/news', component: AdminNews },
                { path: '/admin/product', component: AdminProduct },
                { path: '/admin/comment', component: AdminComment },
                { path: '/admin/dashload', component: AdminDashload },
                { path: '/admin/revenue-statistics', component: AdminRevenueStatistics },
            ]
    },

    // Error 403 404
    { path: '/forbidden', component: ForBidden },
    {
        path: '/:catchAll(.*)',
        component: NotFound
    },
]
const router = createRouter({
    history: createWebHistory(),
    routes: routes,
    scrollBehavior(to, from, savedPosition) {
        // if (savedPosition) {
        //     return savedPosition
        // } else {
        //     return { top: 0 }
        // }
        // always scroll to top
        return {
            el: '#main',
            top: 140,
        }
    },
})

export default router