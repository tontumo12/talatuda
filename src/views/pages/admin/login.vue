<template>
    <b-container class="bv-example-row bv-example-row-flex-cols">
        <b-row class="mt-5 pt-5 text-left">
            <b-col align-self="start"></b-col>
            <b-col cols="8" align-self="center">
                <b-row class="text-center">
                    <b-col cols="4"></b-col>
                    <b-col cols="4">
                        <b-img thumbnail fluid src="/logoname.png" alt="Image 1"></b-img>
                    </b-col>
                    <b-col cols="4"></b-col>
                </b-row>
                <b-form @submit="onSubmit" @reset="onReset">
                    <b-form-group id="input-group-1" label="Tài khoản" label-for="input-1">
                        <b-form-input id="input-1" v-model="form.username" required placeholder="Nhập tài khoản">
                        </b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-2" label="Mật khẩu" label-for="input-2">
                        <b-form-input type="password" id="text-password" aria-describedby="password-help-block"
                            v-model="form.password" required placeholder="Nhập mật khẩu"></b-form-input>
                    </b-form-group>

                    <b-button type="submit" variant="primary">Submit</b-button>
                    <b-button type="reset" variant="danger">Reset</b-button>
                </b-form>
            </b-col>
            <b-col align-self="start"></b-col>
        </b-row>
        <alert />
    </b-container>
</template>
<script>
    import alert from '@/components/alert.vue'
    import {
        user
    } from '@/services/user'
    import jwt from 'jsonwebtoken'
    import router from '@/router'
    export default {
        data() {
            return {
                form: {
                    username: '',
                    password: '',
                },
            }
        },
        methods: {
            onSubmit(evt) {
                evt.preventDefault()
                let a = {
                    username: this.form.username,
                    password: this.form.password
                }
                user.loginHost(a).then(result => {
                    if (result.status == 'SUCCESS') {
                        let a = jwt.decode(result.response.accessToken)
                        a.accessToken = result.response.accessToken
                        a.refreshToken = result.response.refreshToken
                        localStorage.setItem('host', JSON.stringify(a))
                        router.push(`host`)
                    } else {
                        this.alertError(result.message)
                    }
                })
            },
            onReset(evt) {
                evt.preventDefault()
                // Reset our form values
                this.form.username = ''
                this.form.password = ''
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
        components: {
            alert
        },
    }
</script>