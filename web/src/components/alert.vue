<template>
    <div>
        <b-modal v-model="modalShow" hide-header hide-footer>
            <b-alert show :variant="color">{{text}}</b-alert>
        </b-modal>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                text: '',
                color: '',
                modalShow: false
            }
        },
        watch: {
            '$store.state.alert.message': function () {

                if (this.$store.state.alert.message == null) return;

                this.text = this.$store.state.alert.message;

                switch (this.$store.state.alert.type) {
                    case 'alert-success':
                        this.color = 'success';
                        break;
                    case 'alert-danger':
                        this.color = 'danger';
                        break;
                    default:
                        this.color = 'info';
                        break;
                }
                this.modalShow = true
                setTimeout(() => {
                    this.modalShow = false
                }, 3000);
            },
        },
    }
</script>