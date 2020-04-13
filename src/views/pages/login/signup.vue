<template>
        <b-card title="Đăng ký" tag="div" style="max-width: 40rem;" class="mb-2 text-left">
            <b-card-text>
                <p>Đăng ký thành viên</p>
                <b-form @submit.stop.prevent>
                    <label for="input-live">User Name:</label>
                    <b-form-input id="input-live" v-model="name" :state="nameState"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <!-- This will only be shown if the preceding input has an invalid state -->
                    <b-form-invalid-feedback id="input-live-feedback">
                        Enter at least 3 letters
                    </b-form-invalid-feedback>
                    <label for="text-password">Password</label>
                    <b-input type="password" id="text-password" aria-describedby="password-help-block">
                    </b-input>
                    <label for="input-live">Last Name:</label>
                    <b-form-input id="input-live" v-model="lastname"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">First Name:</label>
                    <b-form-input id="input-live" v-model="firstname"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">Phone</label>
                    <b-form-input id="input-live" v-model="firstname"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">Email</label>
                    <b-form-input id="input-live" v-model="firstname"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">Địa chỉ</label>
                    <b-form-input id="input-live" v-model="firstname"
                        aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                    </b-form-input>
                    <label for="input-live">Thành phố</label>
                    <b-form-select v-model="selected" :options="options"></b-form-select>
                </b-form>
            </b-card-text>
            <b-button block variant="info">Đăng ký</b-button>
            <p class="mt-2">Bạn chưa đã tài khoản? <b-link href="/login">Đăng nhập</b-link>
            </p>
        </b-card>
</template>
<script>
    export default {
        data() {
            return {
                name: '',
                lastname: '',
                firstname: '',
                selected: null,
                options: [
                { value: null, text: 'Please select an option' },
                { value: 'a', text: 'This is First option' },
                { value: 'b', text: 'Selected Option', disabled: true }
                ]
            }
        },
        computed: {
            nameState() {
                return this.name.length > 2 ? true : false
            }
        },
    }
</script>