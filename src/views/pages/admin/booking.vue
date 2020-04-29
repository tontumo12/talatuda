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
                        <td>{{item.state}}</td>
                        <td>
                            <b-button variant="outline-warning" class="">
                                <b-icon icon="brush"></b-icon>
                            </b-button>
                            <b-button variant="outline-danger" class="ml-2">
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
export default {
    data() {
        return {
            data:[]
        }
    },
    methods: {
        getBooking(){
            let a = JSON.parse(localStorage.getItem('host'))
            booking.getAllBookingHotel(a.id).then( result =>{
                this.data = result.response
                console.log(this.data)
            })
        },
        coverTimeDetail(time){
            if (!time) return '';
            return moment(time).format('DD/MM/YYYY, HH:mm:ss')
        },
        coverDate(time){
            if (!time) return '';
            return moment(time).format('DD/MM/YYYY')
        }
    },
    created(){
        this.getBooking()
    }
}
</script>