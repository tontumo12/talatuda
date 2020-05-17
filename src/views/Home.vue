<template>
  <div class="home">
    <navbar />
    <router-view></router-view>
    <footerbar class="mt-5"/>
    <alert />
    <profile />
  </div>
</template>

<script>
// @ is an alias to /src
import navbar from '@/components/navbar.vue'
import footerbar from '@/components/footer.vue'
import alert from '@/components/alert.vue'
import profile from '@/components/dialogBooking.vue'
export default {
  name: 'Home',
  components: {
    navbar,
    footerbar,
    alert,
    profile
  },
  data() {
    return {
    }
  },
  methods: {
    
  }
}
</script>
