<template>
  <div class="home">
    <navbar/>
    <router-view></router-view>
    <footerbar class="mt-5"/>
  </div>
</template>

<script>
// @ is an alias to /src
import navbar from '@/components/navbar.vue'
import footerbar from '@/components/footer.vue'
export default {
  name: 'Home',
  components: {
    navbar,
    footerbar
  }
}
</script>
