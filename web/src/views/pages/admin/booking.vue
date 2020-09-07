<template>
    <b-container fluid>
        <b-row class="mt-3">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên Khách hàng</th>
                        <th>Số điện thoại</th>
                        <th>Khách sạn</th>
                        <th>Phòng</th>
                        <th>Ghi chú</th>
                        <th>Ngày đặt</th>
                        <th>Thời gian đặt</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in data" :key="item.id">
                        <td>{{data.indexOf(item) + 1}}</td>
                        <td>{{item.firstName}} {{item.lastName}}</td>
                        <td>{{item.phone}}</td>
                        <td>{{item.hotelName}}</td>
                        <td>{{item.name}}</td>
                        <td>{{item.comment}}</td>
                        <td>
                            {{coverTimeDetail(item.date)}}
                        </td>
                        <td>
                            {{coverDate(item.date_in)}} đến {{coverDate(item.date_out)}}
                        </td>
                        <td>{{returnState(item.state)}}
                            <b-link class="ml-2" variant="primary" @click="item.show = !item.show,selected = item" size="sm">
                                <b-icon icon="pencil"></b-icon>
                            </b-link>
                            <b-collapse class="mt-2" v-model="item.show">
                                <b-card>
                                    <b-card-text>
                                        <b-form-select v-model="selected.state" :options="state" size="sm" class="mt-3"></b-form-select>
                                    </b-card-text>
                                    <b-button variant="outline-primary" size="sm" @click="updateState()">Xác nhận</b-button>
                                </b-card>
                            </b-collapse>
                        </td>
                        <td>
                            <b-button variant="outline-danger" class="ml-2" size="sm" @click="deleteBooking(item.id)">
                                <b-icon icon="trash-fill"></b-icon>
                            </b-button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </b-row>
    </b-container>
</template>
<script>
    import {
        booking
    } from '@/services/booking'
    import moment from 'moment'
    import config from '@/config'
    export default {
        data() {
            return {
                data: [],
                selected: {}
            }
        },
        computed: {
            state() {
                return config.state
            }
        },
        methods: {
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
            getBooking() {
                this.data = []
                let a = JSON.parse(localStorage.getItem('host'))
                booking.getAllBookingHotel(a.id).then(result => {
                    for (let index = 0; index < result.response.length; index++) {
                        result.response[index].show = false
                        this.data.push(result.response[index])
                    }
                })
            },
            coverTimeDetail(time) {
                if (!time) return '';
                return moment(time).format('DD/MM/YYYY, HH:mm:ss')
            },
            coverDate(time) {
                if (!time) return '';
                return moment(time).format('DD/MM/YYYY')
            },
            returnState(data) {
                if (data === "" || data === null) {
                    return ""
                } else {
                    let a = config.state.filter(el => el.value == data)
                    return a[0].text
                }
            },
            updateState() {
                let a = {
                    state: parseInt(this.selected.state)
                }
                let user = JSON.parse(localStorage.getItem('host'))
                booking.updateState(a,user.id,this.selected.id).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.alertSuccess('update thành công')
                    } else {
                        this.alertError('update thất bại')
                    }
                })
                let selectCover = this.data.filter(el => el.id == this.selected.id)
                selectCover[0].show = false
            },
            deleteBooking(id) {
                let a = JSON.parse(localStorage.getItem('host'))
                booking.deleteBooking(a.id,id).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.alertSuccess('Xóa thành công')
                    } else {
                        this.alertError('Xóa thất bại')
                    }
                })
            }
        },
        created() {
            this.getBooking()
        }
    }
</script>