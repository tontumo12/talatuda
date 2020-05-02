<template>
  <div class="home">
    <navbar :userInfo="userInfo"/>
    <router-view></router-view>
    <footerbar class="mt-5"/>
    <alert />
  </div>
</template>

<script>
// @ is an alias to /src
import navbar from '@/components/navbar.vue'
import footerbar from '@/components/footer.vue'
import alert from '@/components/alert.vue'
export default {
  name: 'Home',
  components: {
    navbar,
    footerbar,
    alert
  },
  data() {
    return {
      userInfo: null
    }
  },
  methods: {
    takeUserInfo(){
      let a = JSON.parse(localStorage.getItem('user'))
      if(a == null){
        this.userInfo = a
      }else{
        this.userInfo = {}
      }
    },
  },
  created(){
    this.takeUserInfo()
  }
}
</script>
