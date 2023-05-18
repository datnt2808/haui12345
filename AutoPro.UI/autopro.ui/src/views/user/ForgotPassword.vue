<template>
    <div>
        <div class="login">
            <img src="../../assets/Image/bglogin.png" alt="">
            <div class="form-login">
                <div class="title-form">
                    QUÊN MẬT KHẨU
                </div>
                <div class="form-input">
                    <div class="forgot-account">
                        <div class="text">Tên đăng nhập :</div>
                        <MInput type="text" v-model="account" ref="account" messError="Tài khoản không được bỏ trống"
                            styleInput="width: 400px; height: 30px;; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                        </MInput>
                    </div>
                    <div class="forgot-email">
                        <div class="text">Email :</div>
                        <MInput type="text" v-model="email" ref="email" messError="Email không được bỏ trống"
                            styleInput="width: 400px; height: 30px;; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                        </MInput>
                    </div>
                </div>
                <div class="submit"  @click="sendForgot">
                    <input type="submit" value="Gửi" style="padding: 4px ;border-radius:4px">
                </div>
                <div class="orther">
                    <router-link to="/account/sign-up" class="sign-up">Đăng nhập</router-link>
                    hoặc
                    <router-link to="/account/register" class="register">Đăng kí</router-link>
                </div>
            </div>
        </div>
        <TheFooter></TheFooter>
    </div>
</template>

<script>
import TheFooter from '@/layout/TheFooter.vue';
import TheHeader from '@/layout/TheHeader.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import MInput from '@/components/MInput.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import axios from 'axios';
export default {
    /**
         * Tên component
         */
    name: 'ForgotPassword',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, TheFooter, MInput, TheLineLink },
    /**
     * Emit sự thay đổi
     */
    emits: [""],
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            account: '',
            email: '',
        }
    },
    /**
     * Phương thức
     */
    methods: {
        validateForm() {
            let validate = true;
            if (this.account.trim().length <= 0) {
                this.$refs.account.validate();
                validate = false;
            }
            if (this.email.trim().length <= 0) {
                this.$refs.email.validate();
                validate = false;
            }
            return validate;
        },

        forgotPassword() {
            axios.post("https://localhost:7129/api/v1/User/forgotpassword", { account: this.account, email: this.email })
                .then((res) => {
                    if (res.status == 200) {
                        alert("Email đã được gửi về email của quý khách");
                        this.sendEmail(res.data);
                        this.$router.push('/account/forgot-password')
                    }
                })
                .catch((err) => {
                    console.log(err);
                    alert("Email hoặc tên tài khoản nhập sai");
                })
        },

        async sendEmail(pass) {
            let emailToMail = this.email
            let emailSend = {
                fromEmail: "phamducdang0403@gmail.com",
                fromDisplayName: "AUTOPRO",
                toEmail: emailToMail,
                subject: "Đơn hàng đã được đặt thành công",
                body: `Chào ${this.account},
                        <br>
                        Mật khẩu của bạn là ${pass}`
            }
            await axios.post("https://localhost:7129/api/Mail/send", emailSend)
                .then((res) => {
                    console.log(res);
                })
        },

        sendForgot(){
            if(!this.validateForm()){
                alert("Bạn đã nhập thiếu thông tin");
            }else{
                this.forgotPassword();
            }
        }
    },
    created() {

    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>

<style>
@import url(../../css/form.css);
</style>