<template>
  <div class="home">
    <navbar/>
    <slidebar/>
    <router-view></router-view>
    <footerbar class="mt-5"/>
    <alert />
  </div>
</template>

<script>
// @ is an alias to /src
import navbar from '@/components/admin/navbar.vue'
import slidebar from '@/components/admin/nav.vue'
import footerbar from '@/components/footer.vue'
import alert from '@/components/alert.vue'
export default {
  name: 'Home',
  components: {
    navbar,
    footerbar,
    alert,
    slidebar
  }
}
</script>
