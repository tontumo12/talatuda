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
                <b-button v-b-modal.modal-add-hotel variant="primary" class="my-2 my-sm-0">
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
                        <th>Địa chỉ</th>
                        <th>Thành phố</th>
                        <th>Số sao</th>
                        <th>Mô tả</th>
                        <th>Ảnh</th>
                        <th>Phòng</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in data" :key="item.id">
                        <td>{{data.indexOf(item) + 1}}</td>
                        <td>{{item.name}}</td>
                        <td>{{item.address}}</td>
                        <td>{{returnCity(item.location)}}</td>
                        <td>{{item.level}}</td>
                        <td>{{item.detail}}</td>
                        <td>
                            <b-img v-bind="mainProps" alt="Circle image" :src="item.img"></b-img>
                        </td>
                        <td>
                            <b-button variant="outline-info" v-b-modal.modal-view-room @click="getListRoom(item.id)">
                                <b-icon icon="clipboard"></b-icon>
                            </b-button>
                        </td>
                        <td>
                            <b-button v-b-modal.modal-edit-hotel variant="outline-warning" @click="getInfoHotel(item)" class="">
                                <b-icon icon="brush"></b-icon>
                            </b-button>
                            <b-button variant="outline-danger" class="ml-2" @click="modalShow = true,hotelInfo = item">
                                <b-icon icon="trash-fill"></b-icon>
                            </b-button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </b-row>
        <b-modal id="modal-add-hotel" centered title="Thêm khách sạn của bạn" hide-footer>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Tên:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-input v-model="newHotel.name" id="input-none" placeholder="Tên khách sạn"></b-form-input>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Địa chỉ:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-input v-model="newHotel.address" id="input-none" placeholder="Số, đường, khu vực">
                    </b-form-input>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Thành phố:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-select v-model="newHotel.location" :options="city"></b-form-select>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Số sao:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-rating v-model="newHotel.level" variant="warning" class="mb-2"></b-form-rating>
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
                    <b-form-textarea id="textarea" v-model="newHotel.detail" placeholder="Nhập mô tả....." rows="3"
                        max-rows="6"></b-form-textarea>
                </b-col>
            </b-row>
            <b-row class="mt-3">
                <b-col class="text-right">
                    <b-button variant="primary" class="my-2 my-sm-0" @click="createHotel()">
                        Xác nhận
                    </b-button>
                </b-col>
            </b-row>
        </b-modal>
        <b-modal id="modal-view-room" size="xl" centered title="Danh sách phòng">
            <b-row class="mt-3">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tên</th>
                            <th>Loại phòng</th>
                            <th>Giá</th>
                            <th>Mô tả</th>
                            <th>Số lượng</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in dataRoom" :key="item.id">
                            <td>{{dataRoom.indexOf(item) + 1}}</td>
                            <td>{{item.name}}</td>
                            <td>{{returnTypeRoom(item.type)}}</td>
                            <td>{{item.prices}} VNĐ</td>
                            <td>{{item.detail}}</td>
                            <td>{{item.number}} phòng</td>
                            <td>
                                <b-button variant="outline-warning" class="">
                                    <b-icon icon="brush"></b-icon>
                                </b-button>
                                <b-button variant="outline-danger" class="ml-2">
                                    <b-icon icon="trash-fill"></b-icon>
                                </b-button>
                            </td>
                        </tr>
                        <tr>
                            <td>New</td>
                            <td>
                                <b-form-input v-model="newRoom.name" id="input-none" placeholder="Tên phòng">
                                </b-form-input>
                            </td>
                            <td>
                                <b-form-select v-model="newRoom.type" :options="typeRoom"></b-form-select>
                            </td>
                            <td>
                                <money v-model="newRoom.prices" v-bind="money"></money>
                            </td>
                            <td>
                                <b-form-textarea id="textarea" v-model="newRoom.detail" placeholder="Nhập mô tả....."
                                    rows="3" max-rows="6">
                                    å</b-form-textarea>
                            </td>
                            <td>
                                <money v-model="newRoom.number" v-bind="number"></money>
                            </td>
                            <td>
                                <b-button variant="outline-info" class="" @click="createRoom()">
                                    <b-icon icon="plus"></b-icon>
                                </b-button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </b-row>
        </b-modal>
        <b-modal ref="modal-edit-hotel" centered title="Sửa thông tin khách sạn" hide-footer>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Tên:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-input v-model="hotelInfo.name" id="input-none" placeholder="Tên khách sạn"></b-form-input>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Địa chỉ:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-input v-model="hotelInfo.address" id="input-none" placeholder="Số, đường, khu vực">
                    </b-form-input>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Thành phố:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-select v-model="hotelInfo.location" :options="city"></b-form-select>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Số sao:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-rating v-model="hotelInfo.level" variant="warning" class="mb-2"></b-form-rating>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Ảnh:</label>
                </b-col>
                <b-col sm="10">
                    <b-img v-bind="mainProps" alt="Circle image" :src="hotelInfo.img"></b-img>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Mô tả:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-textarea id="textarea" v-model="hotelInfo.detail" placeholder="Nhập mô tả....." rows="3"
                        max-rows="6"></b-form-textarea>
                </b-col>
            </b-row>
            <b-row class="mt-3">
                <b-col class="text-right">
                    <b-button variant="primary" class="my-2 my-sm-0" @click="updateInfoHotel">
                        Xác nhận
                    </b-button>
                </b-col>
            </b-row>
        </b-modal>
        <b-modal v-model="modalShow" :title="title(hotelInfo.name)" hide-footer>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Địa chỉ:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-input disabled v-model="hotelInfo.address" id="input-none" placeholder="Số, đường, khu vực">
                    </b-form-input>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Thành phố:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-select disabled v-model="hotelInfo.location" :options="city"></b-form-select>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Số sao:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-rating disabled v-model="hotelInfo.level" variant="warning" class="mb-2"></b-form-rating>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Ảnh:</label>
                </b-col>
                <b-col sm="10">
                    <b-img v-bind="mainProps" alt="Circle image" :src="hotelInfo.img"></b-img>
                </b-col>
            </b-row>
            <b-row class="my-1">
                <b-col sm="2">
                    <label for="input-none">Mô tả:</label>
                </b-col>
                <b-col sm="10">
                    <b-form-textarea disabled id="textarea" v-model="hotelInfo.detail" placeholder="Nhập mô tả....." rows="3"
                        max-rows="6"></b-form-textarea>
                </b-col>
            </b-row>
            <b-row class="mt-3">
                <b-col class="text-left">
                    <b-button class="my-2 my-sm-0" @click="modalShow = false">
                        Huỷ bỏ
                    </b-button>
                </b-col>
                <b-col class="text-right">
                    <b-button variant="danger" class="my-2 my-sm-0" @click="deleteHotell">
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
    import {
        hotel
    } from '@/services/hotel'
    import config from '@/config'
    import {
        authHost
    } from '@/helpers'
    import axios from 'axios'
    import {
        Money
    } from 'v-money'
    export default {
        data() {
            return {
                mainProps: {
                    width: 65,
                    height: 65
                },
                money: {
                    thousands: '.',
                    suffix: ' VNĐ',
                    masked: false,
                    precision: 0
                },
                number: {
                    thousands: '.',
                    suffix: '  phòng',
                    masked: false,
                    precision: 0
                },
                data: [],
                newHotel: {
                    name: '',
                    address: '',
                    location: 'HN',
                    level: 1,
                    img: null,
                    detail: ''
                },
                idHotel: null,
                dataRoom: [],
                newRoom: {
                    name: '',
                    type: 3,
                    prices: 0,
                    detail: '',
                    number: 0
                },
                hotelInfo:{},
                modalShow: false
            }
        },
        computed: {
            city() {
                return config.location
            },
            typeRoom() {
                return config.typeRoom
            }
        },
        methods: {
            title() {
                return `Bạn có muốn xoá khách sạn ${this.hotelInfo.name}`
            },
            handleFileUpload() {
                this.newHotel.img = this.$refs.file.files[0];
                console.log(this.$refs.file.files)
            },
            handleFileUploadFix() {
                this.hotelInfo.img = this.$refs.file.files[0];
                this.hotelInfo = {...this.hotelInfo}
                this.hotelInfo.newImg = true
            },
            getlist() {
                hotel.listHotel().then(result => {
                    this.data = result.response
                })
            },
            getListRoom(id) {
                this.idHotel = id
                hotel.getListRoom(id).then(result => {
                    this.dataRoom = result.response
                })
            },
            returnCity(data) {
                if (data === "" || data === null) {
                    return ""
                } else {
                    let a = config.city.filter(el => el.value == data)
                    return a[0].text
                }
            },
            returnTypeRoom(data) {
                if (data === "" || data === null) {
                    return ""
                } else {
                    let a = config.typeRoom.filter(el => el.value == data)
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
            getInfoHotel(data) {
                this.hotelInfo = data
                this.$refs['modal-edit-hotel'].show()
            },
            updateInfoHotel() {
                let a = JSON.parse(localStorage.getItem('host'));
                let formData = new FormData();
                if (this.hotelInfo.newImg == true) {
                    formData.append('file', this.hotelInfo.img);
                }else{
                    formData.append('img', this.hotelInfo.img);
                }
                formData.append('newImg', this.hotelInfo.newImg);
                formData.append('name', this.hotelInfo.name);
                formData.append('address', this.hotelInfo.address);
                formData.append('level', this.hotelInfo.level);
                formData.append('location', this.hotelInfo.location);
                formData.append('detail', this.hotelInfo.detail);
                formData.append('type', 1);
                axios.put(`${config.apiUrl}user/${a.id}/hotel/${this.hotelInfo.id}`,
                        formData, {
                            headers: authHost()
                        }
                    ).then(result => {
                        if (result.data.status == 'SUCCESS') {
                            this.alertSuccess("update thành công")
                            this.$refs['modal-edit-hotel'].hide()
                        } else {
                            this.alertError('update thất bại')
                        }
                    })
                    .catch(error => {
                        console.log(error);
                    }).finally(() => {
                        this.getlist()
                    });
            },
            createHotel() {
                let a = JSON.parse(localStorage.getItem('host'));
                let formData = new FormData();
                formData.append('file', this.newHotel.img);
                formData.append('name', this.newHotel.name);
                formData.append('address', this.newHotel.address);
                formData.append('level', this.newHotel.level);
                formData.append('location', this.newHotel.location);
                formData.append('detail', this.newHotel.detail);
                formData.append('type', 1);
                axios.post(`${config.apiUrl}user/${a.id}/hotel`,
                        formData, {
                            headers: authHost()
                        }
                    ).then(result => {
                        if (result.data.status == 'SUCCESS') {
                            this.alertSuccess("thành công")
                            this.newHotel= {
                                name: '',
                                address: '',
                                location: 'HN',
                                level: 1,
                                img: null,
                                detail: ''
                            }
                            this.$refs['modal-add-hotel'].hide()
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
            createRoom() {
                let a = JSON.parse(localStorage.getItem('host'));
                hotel.createRoom(this.newRoom, this.idHotel, a.id).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.alertSuccess('Thành công')
                        this.getListRoom(this.idHotel)
                        this.newRoom = {
                            name: '',
                            type: 3,
                            prices: 0,
                            detail: '',
                            number: 0
                        }
                    } else {
                        this.alertError('Thất bại')
                    }
                })
            },
            deleteHotell() {
                let a = JSON.parse(localStorage.getItem('host'));
                hotel.deleteHotel(a.id,this.hotelInfo.id).then(result => {
                    if (result.status == 'SUCCESS') {
                        this.modalShow = false
                        this.alertSuccess(`Đã xoá khách sạn ${this.hotelInfo.name}`)
                        this.getlist()
                    } else {
                        this.modalShow = false
                        this.alertError(`xoá khách sạn ${this.hotelInfo.name} thất bại`)
                    }
                })
            }
        },
        created() {
            this.getlist()
        },
        components: {
            Money
        },
    }
</script>