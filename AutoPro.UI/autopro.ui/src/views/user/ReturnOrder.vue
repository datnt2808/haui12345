<template>
    <div class="aform-detail">
        <div class="aform-account">
            <div class="aform-title">
                <div class="aform-title-left">Lí do hoàn hàng</div>
                <div class="onClose" @click="onClose" style="cursor: pointer">
                    <i class="fa-regular fa-circle-xmark"></i>
                </div>
            </div>
            <div class="form-input">
                <div class="login-account">
                    <div class="text">Nội dung hoàn hàng:</div>
                    <MInput type="text" ref="account"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                        v-model="detail">
                    </MInput>
                </div>
            </div>
            <div class="submit" @click="sendReturnOrder">
                <input type="submit" value="Gửi" style="padding: 4px" />
            </div>
        </div>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
// import AwesomeVueStarRating from 'awesome-vue-star-rating'
import MInput from "@/components/MInput.vue";
import MLoading from "@/components/MLoading.vue";
import axios from "axios";
import ApiUser from "../../js/apiUser";

export default {
    /**
     * Tên component
     */
    name: "ReturnOrder",
    /**
     * Hứng nhận
     */
    props: ["idOrderReturn"],
    /**
     * Component được sử dụng
     */
    components: { MInput, MLoading },
    /**
     * Emit sự thay đổi
     */
    emits: ["onClose"],
    directives: {},
    methods: {
        onClose() {
            this.$emit("onClose");
        },

        sendReturnOrder() {
            let param = {
                idOrder: this.idOrderReturn,
                statusOrder: 5,
                reason: this.detail
            }
            axios.post("https://localhost:7129/api/v1/Orders/updateOrderByStatus", param)
                .then((res) => {
                    console.log(res);
                    if(res.status == 200){
                        this.$toast.success("Gửi đơn xác nhận hủy hàng thành công");
                        this.$emit("onClose");
                        this.$emit("closeDetail");
                    }
                })
        }
    },
    /**
     * Data
     */
    data() {
        return {
            detail: "",
            showLoading: false,
        };
    },
    created() {
        console.log(this.idOrderReturn);
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {},
    computed: {},
};
</script>
  
<style>
/* @import url(../../css/rating.css); */
</style>