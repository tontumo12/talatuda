<template>
  <div>
    <b-navbar toggleable="lg" type="light">
      <b-navbar-brand href="/">
        <b-img v-bind="mainProps" rounded="circle" alt="Circle image" src="/logo.png"></b-img>
      </b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-form>
            <b-form-input size="sm" class="mr-sm-2" placeholder="Tìm kiếm"></b-form-input>
            <b-form-datepicker id="example-datepicker" placeholder="Ngày" v-model="value" class="mb-2">
            </b-form-datepicker>
            <b-form-input v-model="text" placeholder="Số người" class="mb-2 ml-2"></b-form-input>
            <b-button size="sm" class="mx-2 my-sm-0">
              <b-icon icon="search"></b-icon>
            </b-button>
          </b-nav-form>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-link href="/host" class="mr-3">Host</b-link>
          <b-link href="/regiter" class="mr-3">Đăng ký</b-link>
          <b-nav-item-dropdown :text="name" right v-if="userInfo">
            <b-dropdown-item @click="show = !show">Profile</b-dropdown-item>
            <b-dropdown-item @click="logOut()">Sign Out</b-dropdown-item>
          </b-nav-item-dropdown>
          <b-link href="/login" class="mr-3" v-else>Đăng nhập</b-link>
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
        value: '',
        text: '',
        userInfo: null,
        show: false
      }
    },
    computed: {
      name() {
        let a = this.userInfo.lastName
        return a
      },
    },
    watch: {
      show() {
        console.log(this.show)
        if(this.show === true){
          this.showDialog()
        }
      },
      '$store.state.alert.booking': function () {
        this.show = this.$store.state.alert.booking
      },
    },
    methods: {
      logOut() {
        localStorage.removeItem('user')
      },
      fullName() {
        return `${this.userInfo.firstName} ${this.userInfo.lastName}`
      },
      takeUserInfo() {
        let a = JSON.parse(localStorage.getItem('user'))
        this.userInfo = a
      },
      showDialog() {
        const {
          dispatch
        } = this.$store;
        dispatch('alert/showBooking')
      },
      hideDialog() {
        const {
          dispatch
        } = this.$store;
        dispatch('alert/hideBooking')
      }
    },
    created() {
      this.takeUserInfo()
    }
  }
</script>
<style>
  .nav-link {
    padding: 0 !important
  }
</style>