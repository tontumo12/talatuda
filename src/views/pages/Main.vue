<template>
    <b-container>
        <b-row>
            <b-col class="text-left">
                <h3>Chào mừng đến với TalaTuda!</h3>
                <p>Đặt chỗ ở, homestay, nhà nghỉ, trải nghiệm và nhiều hơn nữa trên TalaTuda</p>
                <p>
                    <b-link href="/login">Đăng nhập</b-link> hoặc <span>
                        <b-link href="/regiter">đăng ký</b-link>
                    </span> trải nghiệm !
                </p>
            </b-col>
        </b-row>
        <b-row>
            <b-card-group deck>
                <b-card img-src="tite1.png" img-alt="Card image" img-top>
                    <b-card-text>
                        Đa dạng
                    </b-card-text>
                </b-card>
                <b-card img-src="tite1.png" img-alt="Card image" img-top>
                    <b-card-text>
                        Trải nhiệm
                    </b-card-text>
                </b-card>
                <b-card img-src="tite1.png" img-alt="Card image" img-top>
                    <b-card-text>
                        Giá cả
                    </b-card-text>
                </b-card>
                <b-card img-src="tite1.png" img-alt="Card image" img-top>
                    <b-card-text>
                        An toàn
                    </b-card-text>
                </b-card>
            </b-card-group>
        </b-row>
        <b-row class="pt-5">
            <b-col class="text-left">
                <h3>Ưu đãi độc quyền</h3>
                <p>Chỉ có tại TalaTuda, <b-link href="/hotel">Book ngay!</b-link></p>
            </b-col>
        </b-row>
        <b-row>
            <b-card-group deck>
                <b-card img-src="tite2.jpg" img-alt="Card image" img-top>
                </b-card>
                <b-card img-src="tite2.jpg" img-alt="Card image" img-top>
                </b-card>
                <b-card img-src="tite2.jpg" img-alt="Card image" img-top>
                </b-card>
            </b-card-group>
        </b-row>
        <b-row class="pt-5">
            <b-col class="text-left">
                <h3>Điểm đến</h3>
                <p>Chọn điểm đến và khám phá cùng TalaTuda</p>
            </b-col>
        </b-row>
        <b-row>
            <b-card-group deck>
                <template v-for="c in city">
                    <b-card @click="gotoDetail(c.value)" overlay :key="c.value" :img-src="c.img" :img-alt="c.text" text-variant="white"
                        :title="c.text" img-height="200">
                    </b-card>
                </template>
            </b-card-group>
        </b-row>
    </b-container>
</template>
<script>
    import config from '@/config'
    import router from '@/router'
    export default {
        data() {
            return {
                
            }
        },
        computed: {
            city() {
                return config.city
            }
        },
        mounted() {
            const {
                    dispatch
                } = this.$store;
                dispatch('link/saveUrl', window.location.href)
        },
        methods: {
            gotoDetail(data) {
                router.push(`/hotel?c=${data}`)
            }
        },
    }
</script>