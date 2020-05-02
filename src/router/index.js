import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Main from '../views/pages/Main.vue'
import Login from '../views/pages/login'
import signin from '../views/pages/login/signin.vue'
import signup from '../views/pages/login/signup.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    children:[
      {
        path: '/',
        name: 'Main',
        component: Main,
      },
      {
        path: '/login',
        name: 'Login',
        component: Login,
        children:[
          {
            path: '/',
            name: 'signin',
            component: signin
          }
        ]
      },
      {
        path: '/resiter',
        name: 'Login',
        component: Login,
        children:[
          {
            path: '/',
            name: 'signup',
            component: signup
          }
        ]
      }
    ]
  },
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
