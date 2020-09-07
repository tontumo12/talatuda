<template>
    <b-container fluid>
        <b-table :items="data" :fields="fields" striped responsive="sm">
            <template v-slot:cell(show_details)="row">
                <b-button size="sm" @click="row.toggleDetails" class="mr-2">
                    {{ row.detailsShowing ? 'Ẩn' : 'Xem'}} chi tiết
                </b-button>
            </template>
            <template v-slot:cell(img)="test">
                <b-img v-bind="mainProps" alt="Circle image" :src="test.value"></b-img>
            </template>
            <template v-slot:cell(level)="data">
                <b-icon-star v-for="i in data.value" :key="i"></b-icon-star>
            </template>
            <template v-slot:cell(score)="item">
                <b-form-rating id="rating-inline rating-sm-no-border" readonly no-border inline v-model="item.value" variant="warning"></b-form-rating>
            </template>
            <template v-slot:row-details="row">
                <b-card>
                    <b-list-group-item v-for="com in row.item.comment" :key='com.id'
                        class="flex-column align-items-start text-left">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">{{com.firstName}} {{com.lastName}}</h5>
                            <small class="text-muted">
                                <b-icon-star v-for="i in com.point" :key="i"></b-icon-star>
                            </small>
                        </div>
                        <p class="mb-1">
                            {{com.detail}}
                        </p>
                    </b-list-group-item>
                </b-card>
            </template>
        </b-table>
    </b-container>
</template>
<script>
    import {
        hotel
    } from '@/services/hotel'
    import {
        comment
    } from '@/services/comment'
    export default {
        data() {
            return {
                fields: [{
                        key: 'name',
                        label: 'Tên',
                        sortable: true
                    },
                    {
                        key: 'level',
                        label: 'Số sao',
                        sortable: true
                    },
                    {
                        key: 'img',
                        label: 'Ảnh',
                        sortable: true
                    },
                    {
                        key: 'score',
                        label: 'Được đánh giá',
                        sortable: true
                    },
                    {
                        key: 'show_details',
                        label: 'Chi tiết',
                        sortable: false
                    }
                ],
                data: [],
                mainProps: {
                    width: 65,
                    height: 65
                },
            }
        },
        methods: {
            sum(data){
                if (data.length === 0) {
                    return 0
                }else if(data.length === 1){
                    return data[0].point
                }else {
                    let a = []
                    for (let i = 0; i < data.length; i++) {
                        a.push(data[i].point)
                    }
                    const reducer = (accumulator, currentValue) => accumulator + currentValue;
                    let sum = a.reduce(reducer)
                    let point = sum / data.length
                    return point
                }
            },
            getlist(){
                hotel.listHotel().then(result => {
                    this.data = result.response
                    this.getAllComment()
                })
                setTimeout(() => {
                    this.data = [...this.data]
                }, 2000);
            },
            
            getAllComment() {
                for (let i = 0; i < this.data.length; i++) {
                    comment.getCommentRoom(this.data[i].id).then(result => {
                        this.data[i].comment = result.response
                        this.data[i].score = this.sum(this.data[i].comment)
                    })
                }
            },
        },
        created() {
            this.getlist()
        }
    }
</script>