<template>
    <b-container>
        <b-breadcrumb :items="items"></b-breadcrumb>
        <!-- <b-carousel id="carousel-no-animation" style="text-shadow: 0px 0px 2px #000" no-animation indicators
            img-width="900" img-height="250">
            <b-carousel-slide caption="First slide" img-src="http://localhost:8080/hotel1.jpg">
            </b-carousel-slide>
            <b-carousel-slide caption="Second Slide" img-src="http://localhost:8080/hotel2.jpg">
            </b-carousel-slide>
            <b-carousel-slide caption="Third Slide" img-src="http://localhost:8080/hotel4.jpg">
            </b-carousel-slide>
        </b-carousel> -->
        <h2>{{data.name}}</h2>
        <b-row class="mt-3">
            <b-col cols="6">
                <b-row class="text-left">
                    <p>
                        <b-icon-geo-alt></b-icon-geo-alt> {{data.address}} - {{returnCity(data.location)}}
                    </p>
                </b-row>
                <b-row class="text-left">
                    <p>Số sao: <b-icon-star v-for="i in returnInt(data.level)" :key="i"></b-icon-star>
                    </p>
                </b-row>
                <b-row>
                    <p>Danh sách các phòng đang có:</p>
                </b-row>
                <b-list-group class="mt-2">
                    <b-list-group-item v-for="r in listRoom" :key="r.id"
                        class="flex-column align-items-start text-left">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">{{r.name}}</h5>
                            <b-badge variant="primary" pill>{{r.number}}</b-badge>
                        </div>
                        <p class="mb-1">
                            {{r.detail}}
                        </p>
                        <small>Giá:{{r.prices.toLocaleString(undefined, {minimumFractionDigits: 0,maximumFractionDigits: 0})}} VNĐ</small>
                        <b-button variant="outline-info" class="ml-5" @click="bookingRoom(r.id)">Đặt phòng</b-button>
                    </b-list-group-item>
                </b-list-group>
            </b-col>
            <b-col cols="6">
                <b-img thumbnail fluid :src="data.img" alt="Image 1"></b-img>
                <b-row class="mt-4"><h5>Đánh giá:</h5></b-row>
                <b-list-group-item v-for="com in lisComment" :key='com.id' class="flex-column align-items-start text-left">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">{{com.firstName}} {{com.lastName}}</h5>
                        <small class="text-muted">
                            <b-icon-star v-for="i in returnInt(com.point)" :key="i"></b-icon-star>
                        </small>
                    </div>

                    <p class="mb-1">
                        {{com.detail}}
                    </p>
                </b-list-group-item>
                <b-row class="mt-2">
                    Viết đánh giá:
                </b-row>
                <b-row class="px-5 mt-3">
                    <b-form-rating v-model="comment.point" variant="warning" class="mb-2"></b-form-rating>
                </b-row>
                <b-row>
                    <b-col cols="10">
                        <b-form-textarea id="textarea-small" size="sm" placeholder="Small textarea" v-model="comment.text"></b-form-textarea>
                    </b-col>
                    <b-col cols="2">
                        <b-button block variant="outline-info" class="mt-3 mb-2" @click="createComment">Gửi</b-button>
                    </b-col>
                </b-row>
            </b-col>
        </b-row>
        <b-modal v-model="modalShow" hide-footer centered :title="returnName">
            <h4>Ngày đến</h4>
            <b-form-datepicker id="example-datepicker" placeholder="Chọn ngày đến" v-model="roomBooking.dateIn"
                class="mb-2"></b-form-datepicker>
            <h4>Ngày rời</h4>
            <b-form-datepicker id="example-datepicker" placeholder="Chọn ngày rời" v-model="roomBooking.dateOut"
                class="mb-2"></b-form-datepicker>
            <h4>Ghi chú</h4>
            <b-form-textarea id="textarea" v-model="roomBooking.detail" placeholder="Ghi chú ..." rows="3" max-rows="6">
            </b-form-textarea>
            <b-button block variant="outline-info" class="mt-3" @click="sendApiBooking()">Đặt phòng</b-button>
        </b-modal>
    </b-container>
</template>
<script>
    import {
        hotel
    } from '@/services/hotel'
    import {
        booking
    } from '@/services/booking'
    import {
        comment
    } from '@/services/comment'
    import config from '@/config'
    export default {
        props: {
            idHotel: {
                type: String,
                default: null
            }
        },
        data() {
            return {
                data: {},
                listRoom: [],
                modalShow: false,
                roomBooking: {
                    dateIn: '',
                    dateOut: '',
                    detail: ''
                },
                roomChoied: {},
                lisComment: [],
                comment: {
                    point: 0,
                    text: ''
                }
            }
        },
        computed: {
            items() {
                let a = [{
                        text: 'Talatula',
                        href: '/'
                    },
                    {
                        text: 'Hotel',
                        href: '/hotel'
                    },
                    {
                        text: this.data.name,
                        active: true
                    }
                ]
                return a
            },
            returnName() {
                let a = `Đặt phòng ${this.roomChoied.name}`
                return a
            },
        },
        mounted() {
            const {
                    dispatch
                } = this.$store;
                dispatch('link/saveUrl', window.location.href)
        },
        methods: {
            getlist() {
                hotel.detailHotel(this.idHotel).then(result => {
                    this.data = result.response.hotel
                    this.listRoom = result.response.room
                })
            },
            returnCity(data) {
                if (data === "" || data === null) {
                    return ""
                } else {
                    let a = config.location.filter(el => el.value == data)
                    return a[0].text
                }
            },
            returnInt(data) {
                if (data == "1") {
                    return 1
                } else if (data == "2") {
                    return 2
                } else if (data == "3") {
                    return 3
                } else if (data == "4") {
                    return 4
                } else if (data == "5") {
                    return 5
                }
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
            bookingRoom(data) {
                this.modalShow = true
                let a = this.listRoom.filter(el => el.id == data)
                this.roomChoied = a[0]
            },
            sendApiBooking() {
                let a = JSON.parse(localStorage.getItem('user'));
                let body = {
                    comment: this.roomBooking.detail,
                    dateIn: this.roomBooking.dateIn,
                    dateOut: this.roomBooking.dateOut
                }
                booking.bookingRoom(a.id, this.roomChoied.id, body).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.alertSuccess('Đặt phòng thành công')
                    } else {
                        this.alertError('Đặt phòng thất bại')
                    }
                })
            },
            getAllComment() {
                comment.getCommentRoom(this.idHotel).then(result => {
                    this.lisComment = result.response
                })
            },
            createComment() {
                let a = JSON.parse(localStorage.getItem('user'));
                let body = {
                    detail: this.comment.text,
                    point: this.comment.point
                }
                comment.postCommentRoom(a.id, this.idHotel, body).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.getAllComment()
                    }else{
                        this.alertError("thất bại")
                    }
                })
            }
        },
        created() {
            this.getlist()
            this.getAllComment()
        },
    }
</script>