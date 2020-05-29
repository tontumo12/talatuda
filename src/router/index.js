import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Main from '../views/pages/Main.vue'
import Login from '../views/pages/login'
import signin from '../views/pages/login/signin.vue'
import signup from '../views/pages/login/signup.vue'
import Hotel from '../views/pages/hotel/listHotel.vue'
import HotelDetail from '../views/pages/hotel/detailHotel.vue'
import adminHome from '../views/pages/admin'
import adminlogin from '../views/pages/admin/login.vue'
import adminMain from '../views/pages/admin/main.vue'
import review from '../views/pages/admin/review.vue'
import booking from '../views/pages/admin/booking.vue'
import repas from '../views/pages/repas'
Vue.use(VueRouter)


const router = new VueRouter({
  mode: 'history',
  routes: [{
      path: '/',
      name: 'Home',
      component: Home,
      children: [{
          path: '/',
          name: 'Main',
          component: Main,
          props: true,
        },
        {
          path: '/login',
          name: 'Login',
          component: Login,
          children: [{
            path: '',
            name: 'signin',
            component: signin
          }]
        },
        {
          path: '/regiter',
          name: 'Login',
          component: Login,
          children: [{
            path: '',
            name: 'signup',
            component: signup
          }]
        },
        {
          path: '/repas',
          name: 'repas',
          component: repas
        }
      ]
    },
    {
      path: '/hotel',
      component: Home,
      children: [
        {
          path: '/',
          name: 'Hotel',
          component: Hotel,
          props(route) {
            const props = {
                ...route.params
            }
            props.c = route.query.c
            return props
          },
        },
        {
          path: '/hotel/:idHotel',
          name: 'HotelDetail',
          component: HotelDetail,
          props(route) {
            const props = {
              ...route.params
            }
            props.idHotel
            return props
          }
        }
      ]
    },
    {
      path: '/admin',
      name: 'loginAdmin',
      component: adminlogin
    },
    {
      path: '/host',
      name: 'HomeAdmin',
      component: adminHome,
      children: [{
          path: '/',
          name: 'mainAdmin',
          component: adminMain
        },
        {
          path: '/booking',
          name: 'booking',
          component: booking
        },
        {
          path: '/review',
          name: 'review',
          component: review
        }
      ],
      beforeEnter(to, from, next) {
        let user = JSON.parse(localStorage.getItem('host'));
        if (user) {
          next();
        } else {
          localStorage.removeItem('host');
          next('/admin');
        }
      }
    },
    {
      path: '*',
      redirect: '/'
    },
  ]
})

export default router