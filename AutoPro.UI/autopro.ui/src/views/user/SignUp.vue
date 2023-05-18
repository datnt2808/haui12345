<template>
    <div class="login">
        <img src="../../assets/Image/nen.jpg" alt="">
        <div class="form-login">
            <div class="title-form">
                ĐĂNG NHẬP
            </div>
            <div class="form-input">
                <div class="login-account">
                    <div class="text">Tên đăng nhập :</div>
                    <MInput type="text" ref="account" messError="Tài khoản không được bỏ trống"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                        v-model="user.account">
                    </MInput>
                </div>
                <div class="login-password">
                    <div class="text">Mật khẩu :</div>
                    <MInput :type="showPassword3 ? 'text' : 'password'" ref="password"
                        messError="Mật khẩu không được bỏ trống"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                        v-model="user.password">
                    </MInput>
                    <div class="login-show-password" @click="togglePasswordVisibility">
                        {{ showPassword3 ? 'Ẩn' : 'Hiện' }}
                    </div>
                </div>
            </div>
            <div class="submit" @click="loginApp">
                <input type="submit" value="Đăng nhập" style="padding: 4px ;">
            </div>
            <div class="orther">
                <router-link to="/account/register" class="register">Đăng kí</router-link>
                hoặc
                <router-link to="/account/forgot-password" class="forgot-password">Quên mật khẩu ?</router-link>
            </div>
        </div>
    </div>
</template>

<script>
import TheHeader from '@/layout/TheHeader.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import MInput from '@/components/MInput.vue';
import TheFooter from '@/layout/TheFooter.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import ApiUser from '../../js/apiUser';
import axios from 'axios';
import { fetchAPI } from '../../js/gCommon';
import { axiosServiceDefault } from '@/js/axiosService'
export default {
    /**
     * Tên component
     */
    name: 'SignUp',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, MInput, TheFooter, TheLineLink },
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
            user: {
                account: "",
                password: ""
            },
            showPassword3: false,

        }
    },
    /**
     * Phương thức
     */
    methods: {
        validateForm() {
            let validate = true;
            if (this.user.account.trim().length <= 0) {
                this.$refs.account.validate();
                validate = false;
            }
            if (this.user.password.trim().length <= 0) {
                this.$refs.password.validate();
                validate = false;
            }
            return validate;
        },

        loginApp() {
            if (!this.validateForm()) {
                alert("Bạn nhập thiều tài khoản hoặc mật khẩu");
            } else {
                axios.post(ApiUser.login(), { account: this.user.account, password: this.user.password })
                    .then((res) => {
                        // console.log('res', res);
                        if (res.status == 200) {
                            localStorage.setItem('UserID', res.data.UserID);
                            localStorage.setItem('Role', res.data.Role);
                            if (res.data.Role == "Admin") {
                                this.$router.push('/admin/dashload');
                                this.$toast.success("Đăng nhập thành công")
                            } else if (res.data.Role == "User") {
                                this.$router.push('/');
                                this.$toast.success("Đăng nhập thành công")
                            }
                        }
                    })
                    .catch(() => {
                        alert("Tài khoản hoặc mật khẩu sai");
                        this.$toast.error("Đăng nhập thất bại")
                    })
            }
        },

        togglePasswordVisibility() {
            this.showPassword3 = !this.showPassword3;
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