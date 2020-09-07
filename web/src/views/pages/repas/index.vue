<template>
    <b-container fluid>
        <b-row>
            <b-col cols="4">
                <b-form-input class="mr-sm-2" placeholder="Tìm kiếm theo tên"></b-form-input>
            </b-col>
            <b-col cols="4" class="text-left">
                <b-button variant="info" class="my-2 my-sm-0">
                    <b-icon icon="search"></b-icon>
                </b-button>
            </b-col>
            <b-col cols="4" class="text-right">
                <b-button v-b-modal.modal-add-repas variant="primary" class="my-2 my-sm-0">
                    <b-icon icon="plus"></b-icon>
                </b-button>
            </b-col>
        </b-row>
        <b-row class="mt-3">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên</th>
                        <th>Loại</th>
                        <th>Giá</th>
                        <th>Mô tả</th>
                        <th>Ảnh</th>
                        <th>Calories</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in data" :key="item.id">
                        <td>{{data.indexOf(item) + 1}}</td>
                        <td>{{item.name}}</td>
                        <td>{{returnRepas(item.type)}}</td>
                        <td>{{item.pices}}</td>
                        <td>{{item.detail}}</td>
                        <td>
                            <b-img v-bind="mainProps" alt="Circle image" :src="item.img"></b-img>
                        </td>
                        <td>{{item.energi}}</td>
                        <td>
                            <b-button variant="outline-danger" class="ml-2" @click="deleteRepas(item.id)">
                                <b-icon icon="trash-fill"></b-icon>
                            </b-button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </b-row>
        <b-modal id="modal-add-repas" centered title="Thêm món ăn của bạn" hide-footer>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Tên:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-input v-model="newRepa.name" id="input-none" placeholder="Tên Món ăn"></b-form-input>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Giá:</label>
                </b-col>
                <b-col sm="10">
                    <money v-model="newRepa.pices" v-bind="money"></money>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Năng lượng:</label>
                </b-col>
                <b-col sm="10">
                    <money v-model="newRepa.energi" v-bind="number"></money>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Loại:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-select v-model="newRepa.type" :options="repaType"></b-form-select>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Ảnh:</label>
                </b-col>
                <b-col sm="10">
                    <input type="file" value="Click để chọn file để tải lên" id="file" ref="file"
                        v-on:change="handleFileUpload()" />
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Mô tả:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-textarea id="textarea" v-model="newRepa.detail" placeholder="Nhập mô tả....." rows="3"
                        max-rows="6"></b-form-textarea>
                </b-col>
            </b-row>
            <b-row class="mt-3">
                <b-col class="text-right">
                    <b-button variant="primary" class="my-2 my-sm-0" @click="createRepas()">
                        Xác nhận
                    </b-button>
                </b-col>
            </b-row>
        </b-modal>
    </b-container>
</template>
<style>
    .v-money {
        width: 100%;
        height: calc(1.5em + 0.75rem + 2px);
        color: #495057;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        padding: 0.375rem 0.75rem;
    }
</style>
<script>
    import axios from 'axios'
    import {
        Money
    } from 'v-money'
    import {
        repas
    } from '@/services/repas'
    import config from '@/config'
    export default {
        data() {
            return {
                data: [],
                newRepa: {
                    name: '',
                    pices: '',
                    type: '',
                    energi: '',
                    detail: '',
                    img: null
                },
                money: {
                    thousands: '.',
                    suffix: ' VNĐ',
                    masked: false,
                    precision: 0
                },
                number: {
                    thousands: '.',
                    suffix: '  Calo',
                    masked: false,
                    precision: 0
                },
                mainProps: {
                    width: 65,
                    height: 65
                },
            }
        },
        computed: {
            repaType() {
                return config.repasType
            }
        },
        created() {
            this.getlist()
        },
        methods: {
            returnRepas(data) {
                if (data === "" || data === null) {
                    return ""
                } else {
                    let a = config.repasType.filter(el => el.value == data)
                    return a[0].text
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
            handleFileUpload() {
                this.newRepa.img = this.$refs.file.files[0];
                console.log(this.$refs.file.files)
            },
            createRepas() {
                let formData = new FormData();
                formData.append('file', this.newRepa.img);
                formData.append('name', this.newRepa.name);
                formData.append('type', this.newRepa.type);
                formData.append('energi', this.newRepa.energi);
                formData.append('detail', this.newRepa.detail);
                formData.append('pices', this.newRepa.pices);
                axios.post(`${config.apiUrl}repas`,
                        formData
                    ).then(result => {
                        if (result.data.status == 'SUCCESS') {
                            this.alertSuccess("thành công")
                            this.newRepa = {
                                name: '',
                                pices: '',
                                type: '',
                                detail: '',
                                energi: '',
                                img: null
                            }
                            this.$refs['modal-add-repas'].hide()
                        } else {
                            this.alertError('thất bại')
                        }
                    })
                    .catch(error => {
                        console.log(error);
                    }).finally(() => {
                        this.getlist()
                    });
            },
            getlist() {
                repas.listRepas().then(result => {
                    this.data = result.response
                })
            },
            deleteRepas(repasId) {
                repas.deleteRepas(repasId).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.alertSuccess(`Đã xoá món ăn ${repasId}`)
                        this.getlist()
                    } else {
                        this.alertError(`xoá món ăn ${repasId} thất bại`)
                    }
                })
            }
        },
        components: {
            Money
        },
    }
</script>