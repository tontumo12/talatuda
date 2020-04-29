<template>
    <b-card title="Đăng nhập" tag="div" style="max-width: 40rem;" class="mb-2 text-left">
        <b-card-text>
            <p>Đăng nhập TalaTula để trải nghiệm</p>
            <div role="group">
                <label for="input-live">User Name:</label>
                <b-form-input id="input-live" v-model="name" :state="nameState"
                    aria-describedby="input-live-help input-live-feedback" placeholder="Enter your name" trim>
                </b-form-input>

                <!-- This will only be shown if the preceding input has an invalid state -->
                <b-form-invalid-feedback id="input-live-feedback">
                    Enter at least 3 letters
                </b-form-invalid-feedback>
            </div>
            <b-form @submit.stop.prevent>
                <label for="text-password">Password</label>
                <b-input type="password" id="text-password" aria-describedby="password-help-block">
                </b-input>
            </b-form>
        </b-card-text>
        <b-button block variant="info">Đăng nhập</b-button>
        <p class="mt-2">Bạn chưa có tài khoản? <b-link href="/resiter">Đăng ký ngay</b-link>
        </p>
    </b-card>
</template>
<script>
    export default {
        data() {
            return {
                name: ''
            }
        },
        computed: {
            nameState() {
                return this.name.length > 2 ? true : false
            }
        },
        methods: {
            test() {
                
            }
        }
    }
</script>