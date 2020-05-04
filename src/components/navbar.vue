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
            <b-button size="sm" class="my-2 my-sm-0" type="submit">
              <b-icon icon="search"></b-icon>
            </b-button>
          </b-nav-form>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-link href="/host" class="mr-3">Host</b-link>
          <b-link href="/regiter" class="mr-3">Đăng ký</b-link>
          <b-link href="/login" class="mr-3">Đăng nhập</b-link>
          <b-nav-item-dropdown right v-if="userInfo">
            <!-- Using 'button-content' slot -->
            <template v-slot:button-content>
              <span>{{name()}}</span>
            </template>
            <b-dropdown-item href="#">Profile</b-dropdown-item>
            <b-dropdown-item @click="logOut()">Sign Out</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>
<script>
  export default {
    props: {
      userInfo: null,
    },
    data() {
      return {
        mainProps: {
          width: 45,
          height: 45
        },
        value: '',
        text: '',
      }
    },
    methods: {
      logOut(){
        localStorage.removeItem('user')
      },
      name(){
        return this.userInfo.lastName
      },
      fullName(){
        return `${this.userInfo.firstName} ${this.userInfo.lastName}`
      }
    }
  }
</script>