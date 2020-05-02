<template>
    <b-container>
        <b-row>
            <b-card-group deck>
                <template v-for="c in city">
                    <b-card overlay :key="c.value" :img-src="c.img" :img-alt="c.text" text-variant="white"
                        :title="c.text" img-height="200">
                    </b-card>
                </template>
            </b-card-group>
        </b-row>
        <b-breadcrumb class="mt-3">
            <b-breadcrumb-item>
                <h5>Danh sách khách sạn <b-badge>{{data.length}}</b-badge>
                </h5>
            </b-breadcrumb-item>
        </b-breadcrumb>
        <b-row cols="4">
            <b-col v-for="d in data" :key='d.id' class="mt-3">
                <b-card :title="d.name" :img-src="d.img" :img-alt="d.name" img-height="200" img-top tag="article"
                    style="max-width: 20rem;" class="mb-2">
                    <b-card-text>
                        <p>{{d.address}}, {{returnCity(d.location)}}</p>
                        <b-form-rating id="rating-inline rating-sm-no-border" readonly no-border inline
                            v-model="d.score" variant="warning"></b-form-rating>
                    </b-card-text>
                    <b-button block pill @click="gotoDetail(d.id)" variant="info">Xem chi tiết</b-button>
                </b-card>
            </b-col>
        </b-row>
    </b-container>
</template>
<script>
    import {
        hotel
    } from '@/services/hotel'
    import config from '@/config'
    import router from '@/router'
    import {
        comment
    } from '@/services/comment'
    export default {
        props: {
            c: {
                type: String,
                default: null
            }
        },
        data() {
            return {
                data: [],
                mainProps: {
                    width: 200,
                    height: 220
                },
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
            sum(data) {
                if (data.length === 0) {
                    return 0
                } else if (data.length === 1) {
                    return data[0].point
                } else {
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
            getlist() {
                if (this.c != null && this.c != '') {
                    hotel.listHotelCity(this.c).then(result => {
                        this.data = result.response
                        this.getAllComment()
                    })
                    setTimeout(() => {
                        this.data = [...this.data]
                    }, 2000);
                } else {
                    hotel.listHotel().then(result => {
                        this.data = result.response
                        this.getAllComment()
                    })
                    setTimeout(() => {
                        this.data = [...this.data]
                    }, 2000);
                }
            },
            getAllComment() {
                for (let i = 0; i < this.data.length; i++) {
                    comment.getCommentRoom(this.data[i].id).then(result => {
                        this.data[i].comment = result.response
                        this.data[i].score = this.sum(this.data[i].comment)
                    })
                }
            },
            returnCity(data) {
                if (data === "" || data === null) {
                    return ""
                } else {
                    let a = config.city.filter(el => el.value == data)
                    return a[0].text
                }
            },
            gotoDetail(data) {
                router.push(`hotel/${data}`)
            }
        },
        created() {
            this.getlist()
        },
    }
</script>