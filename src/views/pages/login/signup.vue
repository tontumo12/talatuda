<template>
        <b-card title="Đăng ký" tag="div" style="max-width: 40rem;" class="mb-2 text-left">
            <b-card-text>
                <p>Đăng ký thành viên</p>
                <b-form @submit.stop.prevent>
                    <label for="input-live">User Name:</label>
                    <b-form-input id="input-live" v-model="userInfo.username" :state="nameState"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <!-- This will only be shown if the preceding input has an invalid state -->
                    <b-form-invalid-feedback id="input-live-feedback">
                        Enter at least 3 letters
                    </b-form-invalid-feedback>
                    <label for="text-password">Password</label>
                    <b-input type="password" v-model="userInfo.password" id="text-password" aria-describedby="password-help-block">
                    </b-input>
                    <label for="input-live">First Name:</label>
                    <b-form-input id="input-live" v-model="userInfo.firstname"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Họ" trim>
                    </b-form-input>
                    <label for="input-live">Last Name:</label>
                    <b-form-input id="input-live" v-model="userInfo.lastname"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Tên" trim>
                    </b-form-input>
                    <label for="input-live">Phone</label>
                    <b-form-input id="input-live" v-model="userInfo.phone"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">Email</label>
                    <b-form-input id="input-live" v-model="userInfo.email"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">Địa chỉ</label>
                    <b-form-input id="input-live" v-model="userInfo.address"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">Thành phố</label>
                    <b-form-select v-model="userInfo.city" :options="options"></b-form-select>
                </b-form>
                <p>{{text}}</p>
            </b-card-text>
            <b-button block variant="info" @click="signUp()">Đăng ký</b-button>
            <p class="mt-2">Bạn chưa đã tài khoản? <b-link href="/login">Đăng nhập</b-link>
            </p>
        </b-card>
</template>
<script>
    import {
        user
    } from '@/services/user'
    import config from '@/config'
    export default {
        data() {
            return {
                userInfo:{
                    username:'',
                    password:'',
                    firstname:'',
                    lastname:'',
                    phone:'',
                    email:'',
                    address:'',
                    city: 'HN'
                },
                text: {}
            }
        },
        computed: {
            nameState() {
                return this.userInfo.username.length > 2 ? true : false
            },
            options(){
                return config.location
            }
        },
        methods: {
            signUp(){
                let a = {
                    username:this.userInfo.username,
                    password:this.userInfo.password,
                    firstName:this.userInfo.firstname,
                    lastName:this.userInfo.lastname,
                    phone:this.userInfo.phone,
                    email:this.userInfo.email,
                    location:this.userInfo.address,
                    city:this.userInfo.city
                }
                user.regiter(a).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.alertSuccess('Đăng ký thành công')
                    } else {
                        this.alertError('Đăng ký thất bại')
                    }
                })
            },
            alertSuccess(data) {
                const {
                    dispatch
                } = this.$store;
                dispatch('alert/success', `${data}`)
            },
            alertError(data) {
                const {
                    dispatch
                } = this.$store;
                dispatch('alert/error', `${data}`)
            },
        },
    }
</script>