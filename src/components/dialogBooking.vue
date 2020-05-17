<template>
    <b-modal v-model="show" centered title="Danh sách phòng đã đặt" size="xl">
        <table>
            <thead>
                <tr>
                    <th>Tên khách sạn</th>
                    <th>Loại phòng</th>
                    <th>Ngày đến</th>
                    <th>Ngày rời</th>
                    <th>Ngày đặt</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in data" :key="item.id">
                    <td>{{item.hotelName}}</td>
                    <td>{{item.name}}</td>
                    <td>{{coverDate(item.date_in)}}</td>
                    <td>{{coverDate(item.date_out)}}</td>
                    <td>{{coverTimeDetail(item.date)}}</td>
                    <td>{{returnState(item.state)}}</td>
                    <td>
                        <b-button variant="outline-danger" class="ml-2" size="sm" @click="deleteBooking(item.id)">
                            Hủy
                        </b-button>
                    </td>
                </tr>
            </tbody>
        </table>
    </b-modal>
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
                show: false,
                data: null
            }
        },
        watch: {
            '$store.state.alert.booking': function () {
                this.show = this.$store.state.alert.booking
                this.getBookingUser()
            },
            show() {
                if (this.show === false) {
                    this.hideDialog()
                }
            }
        },
        methods: {
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
            },
            getBookingUser() {
                let a = JSON.parse(localStorage.getItem('user'))
                booking.bookingUser(a.id).then(result => {
                    this.data = result.response
                })
            },
            deleteBooking(id) {
                let a = JSON.parse(localStorage.getItem('user'))
                booking.deleteBooking(a.id,id).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.alertSuccess('Xóa thành công')
                    } else {
                        this.alertError('Xóa thất bại')
                    }
                })
            }
        },
    }
</script>