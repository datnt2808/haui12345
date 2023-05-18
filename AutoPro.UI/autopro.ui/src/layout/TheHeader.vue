<template>
    <div>
        <div class="header">
            <div class="header-left">
                <router-link to="/" class="logo" @click="goHome">
                    <img src="../assets/Image/a1.jpg" alt="">
                    <h6 style="font-weight: 700;">Hệ thống quản lý đồng phục HaUI</h6>
                </router-link>
                <div class="search">
                    <MInput placeholder="Nhập từ khóa tìm kiếm" type="text" v-model="keySeach"
                        v-on:keyup.enter="searchProductHeader"
                        styleInput="width:350px; height:36px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                    <div class="icon" @click="searchProductHeader">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                </div>
            </div>
            <div class="header-right">
                <div class="user" :class="{ 'isNoLogin': isNoLogin }">
                    <router-link to="/account/sign-up" class="account">
                        <i class="fa-regular fa-user " style=""></i>
                        <div class="info">
                            <div class="">Tài khoản</div>
                        </div>
                    </router-link>
                </div>
                <div class="user" :class="{ 'isLogin': isLogin }">
                    <div class="account">
                        <i class="fa-regular fa-user " style=""></i>
                        <div class="info">
                            <div class="">Xin chào , {{ this.user.fullName }}</div>
                            <div class="under-user">
                                <router-link :to="'/user/' + userID" class="item-header" @click="goHome">
                                    <div class="details-user">Tài khoản của tôi</div>
                                </router-link>
                                <router-link to="/list-product-favorite" class="item-header" @click="goHome">
                                    <div class="product-favorite">Sản phẩm yêu thích</div>
                                </router-link>
                                <div class="item-header" @click="updatePassword">
                                    <div class="product-favorite">Cập nhật mật khẩu</div>
                                </div>
                                <router-link to="/" class="item-header" @click="logout">
                                    <div class="logout">Đăng xuất</div>
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
                <router-link to="/cart" class="cart" @click="goHome">
                    <i class="fa-solid fa-cart-plus"></i>
                    <div class="info-cart">Giỏ hàng của bạn</div>
                </router-link>
                <router-link to="/order" class="cart" @click="goHome">
                    <i class="fa-solid fa-cart-flatbed-suitcase"></i>
                    <div class="info-cart">Đơn hàng của bạn</div>
                </router-link>
            </div>
        </div>
        <div class="line-header"></div>
        <UpdatePassword v-if="showUpdate" @onClose="showUpdate = false"></UpdatePassword>
    </div>
</template>

<script>
import MInput from '@/components/MInput.vue'
import axios from 'axios';
import ApiUser from '../js/apiUser';
import UpdatePassword from '@/views/user/UpdatePassword.vue';
export default {
    /**
       * Tên component
       */
    name: 'TheHeader',
    /**
     * Hứng nhận
     */
    props: [''],
    /**
     * Component được sử dụng
     */
    components: { MInput, UpdatePassword },
    /**
     * Emit sự thay đổi
     */
    emits: ["update:keySearch", "update:modelValue"],
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            isNoLogin: false,
            isLogin: false,
            user: {},
            userID: '',
            keySeach: '',
            listFilter: [],
            showUpdate: false,
        }
    },
    /**
     * Phương thức
     */
    methods: {
        logout() {
            this.goHome();
            localStorage.removeItem('UserID');
            localStorage.removeItem('Role');
            this.isLogin = true;
            this.isNoLogin = false;
            this.$router.push('/');
            this.$toast.success("Đăng xuất thành công")
        },

        searchProductHeader() {
            this.$store.commit('updateSearch', this.keySeach);
            this.$router.push({ path: '/product/search/', name: 'productFilter', query: { key: this.keySeach } })
        },

        updatePassword() {
            this.goHome();
            this.showUpdate = true;
        },

        goHome(){
            this.$store.commit('updateSearch');
        }
    },
    created() {
        const login = localStorage.getItem("UserID");
        const role = localStorage.getItem("Role");
        if (role == "Admin") {
            this.$router.push('/forbidden');
            return;
        }

        let quey = this.$store.state.search;
        console.log(quey);
        if(quey != null){
            this.keySeach = quey;
        }
        this.userID = login;
        // console.log(this.userID);
        if (this.userID != null) {
            this.isLogin = false;
            this.isNoLogin = true;
            axios.get(ApiUser.getUserById(login))
                .then((res) => {
                    if (res.status == 200) {
                        this.user = res.data;
                        // console.log(this.user);
                    } else if (res.status == 400) {
                        console.log(res.moreInfo);
                    }
                })
        } else {
            this.isLogin = true;
            this.isNoLogin = false;
        }
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        userID(newVal) {
            if (newVal != null) {
                this.isLogin = false;
                this.isNoLogin = true;
            } else {
                // this.userID = newVal;
            }
        },
        
        keySeach(newVal) {
            this.keySeach = newVal;
            this.$emit("update:keySearch", newVal);
            this.$store.commit('updateSearch', newVal);
        },

        search(newVal){
            this.keySeach = newVal;
            this.$store.commit('updateSearch', newVal);
        }
    },
    computed:{
        search(){
            return this.$store.state.search;
        }
    }
}
</script>

<style>
@import url(../css/header.css);
</style>