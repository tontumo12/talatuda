<template>
    <div>
        <b-jumbotron bg-variant="info" text-variant="white" border-variant="dark">
            <b-container>
                <b-row class="text-left">
                    <h3>Đăng ký thành viên TalaTuda - Tích điểm thưởng và nhận ưu đãi</h3>
                    <p>Nhanh chóng, tiện lợi và an toàn. Đăng ký liền tay, rinh ngay quyền lợi.</p>
                </b-row>
            </b-container>
        </b-jumbotron>
        <b-container>
            <b-row>
                <b-col>
                    <b-row>
                        <b-img v-bind="mainProps" rounded alt="Rounded image" src="test.png"></b-img>
                    </b-row>
                    <b-row class="text-left">
                        <h3>Tích điểm nhanh chóng</h3>
                        <p>Tích điểm đối với mỗi lượt đặt chỗ thành công. Quy đổi thành Lux Credit để du lịch nhiều hơn
                            nữa.</p>
                    </b-row>
                    <b-row class="mt-5">
                        <b-img v-bind="mainProps" rounded alt="Rounded image" src="test2.png"></b-img>
                    </b-row>
                    <b-row class="text-left">
                        <h3>Tích điểm nhanh chóng</h3>
                        <p>Tích điểm đối với mỗi lượt đặt chỗ thành công. Quy đổi thành Lux Credit để du lịch nhiều hơn
                            nữa.</p>
                    </b-row>
                </b-col>
                <b-col>
                    <b-row>
                        <b-img v-bind="mainProps" rounded alt="Rounded image" src="test.png"></b-img>
                    </b-row>
                    <b-row class="text-left">
                        <h3>Tích điểm nhanh chóng</h3>
                        <p>Tích điểm đối với mỗi lượt đặt chỗ thành công. Quy đổi thành Lux Credit để du lịch nhiều hơn
                            nữa.</p>
                    </b-row>
                    <b-row class="mt-5">
                        <b-img v-bind="mainProps" rounded alt="Rounded image" src="test2.png"></b-img>
                    </b-row>
                    <b-row class="text-left">
                        <h3>Tích điểm nhanh chóng</h3>
                        <p>Tích điểm đối với mỗi lượt đặt chỗ thành công. Quy đổi thành Lux Credit để du lịch nhiều hơn
                            nữa.</p>
                    </b-row>
                </b-col>
                <b-col>
                    <router-view></router-view>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                mainProps: {
                    width: 75,
                    height: 75
                },
                name: ''
            }
        },
        computed: {
            nameState() {
                return this.name.length > 2 ? true : false
            }
        },
    }
</script>