<template>
  <div>
    <b-navbar toggleable="lg" type="light">
      <b-navbar-brand v-b-toggle.sidebar-1 href="#" target="_blank">
        <b-img v-bind="mainProps" rounded="circle" alt="Circle image" src="/logo.png"></b-img>
      </b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-nav-item-dropdown :text="name" right>
            <b-dropdown-item href="#">Profile</b-dropdown-item>
            <b-dropdown-item @click="logOut()">Logout</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        mainProps: {
          width: 45,
          height: 45
        },
        userInfo: null
      }
    },
    computed: {
      name() {
        let a = this.userInfo.email
        return a
      },
    },
    methods: {
      logOut() {
        localStorage.removeItem('host')
      },
      fullName() {
        return `${this.userInfo.firstName} ${this.userInfo.lastName}`
      },
      takeUserInfo() {
        let a = JSON.parse(localStorage.getItem('host'))
        this.userInfo = a
      },
    },
    created() {
      this.takeUserInfo()
    }
  }
</script>