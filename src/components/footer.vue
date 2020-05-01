<template>
    <b-jumbotron>
        <b-row style="borber-bottom:1px solid #999">
            <b-col>
                <b-img v-bind="mainProps" rounded alt="Rounded image" src="/logoname.png"></b-img>
            </b-col>
            <b-col>Nhà hàng được yêu thích</b-col>
            <b-col>Home stay được yêu thích</b-col>
            <b-col>Về chúng tôi</b-col>
        </b-row>
        <b-row>
            <b-col>© 2020 TalaTula. Bản quyền thuộc về Tunt Inpg15.</b-col>
        </b-row>
    </b-jumbotron>
</template>
<script>
export default {
    data() {
      return {
        mainProps: { width: 180, height: 150, class: 'm1' }
      }
    }
}
</script>