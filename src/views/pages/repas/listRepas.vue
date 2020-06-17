<template>
   <b-container fluid>
       <b-row>
           <b-col cols="3">
               <p>Chọn loại món ăn bạn thích</p>
               <b-form-select v-model="selected" :options="repaType" placeholder="Chọn loại món ăn"></b-form-select>
           </b-col>
           <b-col cols="2">
               <p>Nhập độ tuổi của bạn</p>
               <b-form-input v-model="age" type="number"></b-form-input>
           </b-col>
           <b-col cols="2">
               <p>Nhập cân nặng của bạn</p>
               <b-form-input v-model="width" type="number"></b-form-input>
           </b-col>
           <b-col cols="2">
                <p>Nhập chiều cao của bạn</p>
                <b-form-input v-model="height" type="number"></b-form-input>
           </b-col>
           <b-col cols="2">
                <p>Giới tính</p>
                <b-form-select v-model="sexe" :options="sex" placeholder="Chọn giới tính"></b-form-select>
           </b-col>
           <b-col cols="1">
               <b-button variant="outline-success" pill class="ml-2 mt-4" @click="getRepasFlInfo()">
                    <b-icon icon="search"></b-icon>
                </b-button>
           </b-col>
       </b-row>
       <b-row class="mt-3 pl-3" v-if="repaRecomment !=== null">
           <h2>
               Món ăn đề suất
           </h2>
       </b-row>
       <b-row v-if="repaRecomment !=== null">
         <b-col cols="3">
            <b-card
                    :title="repaRecomment.name"
                    :img-src="repaRecomment.img"
                    :img-alt="repaRecomment.name"
                    img-top
                    tag="article"
                    style="max-width: 20rem;"
                    class="mb-2"
                >
                    <b-card-text>
                        <p>{{repaRecomment.detail}}</p>
                        <p>Giá: {{repaRecomment.pices.toLocaleString(undefined, {minimumFractionDigits: 0,maximumFractionDigits: 0})}} VNĐ</p>
                    </b-card-text>

                    <b-button variant="outline-success" @click="fetchChoiseRepas(repaRecomment.id)">Chọn</b-button>
                    <b-button variant="outline-success" @click="repas = repaRecomment, modalShow = true">Đánh giá</b-button>
                </b-card>
         </b-col>
       </b-row>
       <b-row class="mt-3 pl-3">
           <h2>
               Danh sách món ăn cho bạn
           </h2>
       </b-row>
       <b-row class="mt-3">
           <b-col cols="3" v-for="i in repasList" :key="i.id">
               <b-card
                    :title="i.name"
                    :img-src="i.img"
                    :img-alt="i.name"
                    img-top
                    tag="article"
                    style="max-width: 20rem;"
                    class="mb-2"
                >
                    <b-card-text>
                        <p>{{i.detail}}</p>
                        <p>Giá: {{i.pices.toLocaleString(undefined, {minimumFractionDigits: 0,maximumFractionDigits: 0})}} VNĐ</p>
                    </b-card-text>

                    <b-button variant="outline-success" @click="fetchChoiseRepas(i.id)">Chọn</b-button>
                    <b-button variant="outline-success" @click="repas = i, modalShow = true">Đánh giá</b-button>
                </b-card>
           </b-col>
       </b-row>
        <b-modal v-model="modalShow" hide-footer centered :title="returnName">
            <b-form-rating v-model="point" variant="warning" class="mb-2"></b-form-rating>
            <b-button block variant="outline-info" class="mt-3" @click="fetchPointRepas()">Xác nhận</b-button>
        </b-modal>
   </b-container>
</template>
<script>
import config from '@/config'
import {
    repas
} from '@/services/repas'
export default {
    data() {
        return {
            modalShow: false,
            repas:{},
            repasList:[],
            selected: null,
            width: 0,
            height: 0,
            age: 0,
            sexe: null,
            sex: [
                {
                    value: null,
                    text: 'Chọn giới tính'
                },
                {
                    value: 'M',
                    text: 'Nam'
                },
                {
                    value: 'FM',
                    text: 'Nữ'
                }
            ],
            point: 0,
            repaRecomment: null
        }
    },
    computed: {
        repaType() {
            return config.repasType
        },
        returnName() {
            return `Chấm điểm cho món ăn ${this.repas.name}`
        }
    },
    created() {
        this.getListRepas()
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
        async getRepasFlInfo() {
            let calo = 0
            let min = 0
            let max = 0
            if(this.sexe === 'M'){
                calo = 10*this.width + 6.25*this.height - 5*this.age +5
            }else if(this.sexe === 'FM'){
                calo = 10*this.width + 6.25*this.height - 5*this.age -161
            }else{
                calo = 10*this.width + 6.25*this.height - 5*this.age
            }
            min = ((calo*1.2)/3) * 0.7
            max = ((calo*1.2)/3) * 1.5
            await this.fetchApiType(min,max)
        },
        async getListRepas(){
            repas.listRepas().then(result=>{
                this.repasList = result.response
                for(let i = 0; i < result.response.length; i++){
                  await this.getPointRepa(result.response[i].id)
                }
            })
        },
        fetchApiType(min,max) {
            if(this.selected == null) {
                return this.alertError('fail chưa chọn loại món ăn')
            }
            repas.listRepasType(this.selected,max,min).then(result =>{
                this.repasList = result.response
            })
        },
        fetchChoiseRepas(id){
            repas.choiseRepas(id).then(result=>{
                if(result.status == "SUCCESS"){
                    this.alertSuccess(`Chọn thành công mon ${id} thanh cong`)
                }else{
                    this.alertError('Thất bại')
                }
            })
        },
        fetchPointRepas(){
            repas.pointRepas(this.repas.id,this.point).then(result=>{
                if(result.status == "SUCCESS"){
                    this.alertSuccess(`Danh gia mon ${this.repas.name} thanh cong`)
                    this.repas = {}
                    this.point = 0
                    this.modalShow = false
                }else{
                    this.alertError('Thất bại')
                }
            })
        },
        getPointRepa(id){
            repas.getPointRepa(id).then(result => {
               let a = this.repasList.find(e => e.id == result.response.id)
               a['point'] = result.response.point
            })
        },
        checkPoint(){
            let point = []
            this.repasList.forEach(e => {
               e['pointRecomment'] = e.point * 0.7 + e.choise * 0.3
               point.push(e['pointRecomment'])
            })
            let max = Math.max.apply(Math, point)
            this.repasList = [...this.repasList]
            let maxRepas = this.repasList.find(ele => ele.pointRecomment == max)
            this.repaRecomment = maxRepas
        }
    },
}
</script>
