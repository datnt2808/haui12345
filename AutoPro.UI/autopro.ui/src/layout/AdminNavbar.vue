<template>
    <div class="nav">
        <!-- <div class="anav-header">
            <router-link to="/admin/dashload">
                <div class="aheader-left">
                    <img src="../assets/Image/a1.jpg" alt="">
                </div>
            </router-link>
        </div> -->
        <div class="anav-list">
            <div class="admin-info">
                <img :src="this.srcImageAdmin" alt="">
            </div>
            <div class="adminname">
                <div>Xin chào, {{ admin.account }}</div>
                <div><i class="fa-solid fa-caret-down" style="margin-left: 8px"></i>
                </div>
                <div class="under-admin-info">
                    <div class="details-user" @click="infoAdmin">Tài khoản của tôi</div>
                    <div class="details-user" @click="UpdatePassword">Cập nhật mật khẩu</div>
                    <router-link to="/" class="item-header" @click="logout">
                        <div class="logout">Đăng xuất</div>
                    </router-link>
                </div>
            </div>
            <router-link to="/admin/dashload" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Tổng quan</div>
                </div>
            </router-link>
            <router-link to="/admin/revenue-statistics" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Thống kê doanh thu</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
            <router-link to="/admin/brand" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Quản lí nhãn hàng</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
            <div class="anav-item anav-menu">
                <div class="anav__text">Quản lí đơn hàng</div>
                <i class="fa-solid fa-caret-down"></i>
                <div class="anav-submenu">
                    <div class="anav-item" @click="allOrder">
                        <div class="anav__texts">Tất cả đơn hàng</div>
                        <i class="fa-solid fa-caret-down" style="color: black;"></i>
                    </div>
                    <div class="anav-item" @click="orderProcess">
                        <div class="anav__texts">Đơn hàng chờ xử lí</div>
                        <i class="fa-solid fa-caret-down" style="color: black;"></i>
                    </div>
                    <div class="anav-item" @click="orderDone">
                        <div class="anav__texts">Đơn hàng thành công</div>
                        <i class="fa-solid fa-caret-down" style="color: black;"></i>
                    </div>
                    <div class="anav-item" @click="orderCacel">
                        <div class="anav__texts">Đơn hàng đã hủy</div>
                        <i class="fa-solid fa-caret-down" style="color: black;"></i>
                    </div>
                    <div class="anav-item" @click="orderWaitReturn">
                        <div class="anav__texts">Đơn hàng hoàn chờ duyệt</div>
                        <i class="fa-solid fa-caret-down" style="color: black;"></i>
                    </div>
                    <div class="anav-item" @click="orderReturn">
                        <div class="anav__texts">Đơn hàng hoàn</div>
                        <i class="fa-solid fa-caret-down" style="color: black;"></i>
                    </div>
                </div>
            </div>
            <router-link to="/admin/category" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Quản lí danh mục</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
            <!-- <router-link to="/admin/order" style="text-decoration: none;"> -->
            <!-- </router-link> -->
            <router-link to="/admin/account" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Quản lí tài khoản</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
            <router-link to="/admin/news" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Quản lí tin tức</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
            <router-link to="/admin/contact" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Quản lí liên hệ</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
            <router-link to="/admin/product" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Quản lí sản phẩm</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
            <router-link to="/admin/comment" style="text-decoration: none;">
                <div class="anav-item">
                    <div class="anav__text">Quản lí đánh giá</div>
                    <i class="fa-solid fa-caret-down"></i>
                </div>
            </router-link>
        </div>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>

<script>
import axios from 'axios';
import ApiUser from '@/js/apiUser';
import MLoading from '@/components/MLoading.vue';
import UpdatePassword from '@/views/user/UpdatePassword.vue';

export default {
    /**
           * Tên component
           */
    name: 'AdminNavbar',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { MLoading, UpdatePassword },
    /**
     * Emit sự thay đổi
     */
    emits: ["infoAdmin", "showUpdate"],
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            idAdmin: '',
            admin: {},
            showLoading: false,
            srcImageAdmin: '',
        }
    },
    /**
     * Phương thức
     */
    methods: {
        logout() {
            localStorage.removeItem('UserID');
            localStorage.removeItem('Role');
            this.$router.push('/');
        },
        infoAdmin() {
            this.$emit("infoAdmin");
        },

        allOrder() {
            this.$router.push('/admin/order');
        },

        orderDone() {
            this.$router.push({ name: 'orderStatus', params: { id: 1 } });
        },

        orderProcess() {
            this.$router.push({ name: 'orderStatus', params: { id: 2 } });
        },

        orderCacel() {
            this.$router.push({ name: 'orderStatus', params: { id: 3 } });
        },

        orderWaitReturn() {
            this.$router.push({ name: 'orderStatusReturn', params: { id: 5 } });
        },

        orderReturn() {
            this.$router.push({ name: 'orderStatusReturn', params: { id: 6 } });
        },

        UpdatePassword() {
            this.$emit("showUpdate");
            // this.showUpdate = true;
        },

    },
    created() {
        const adminID = localStorage.getItem("UserID");
        this.idAdmin = adminID;
        this.showLoading = true;
        setTimeout(() => {
            axios.get(ApiUser.getUserById(adminID))
                .then((res) => {
                    this.showLoading = false;
                    if (res.status == 200) {
                        this.admin = res.data;
                        this.srcImageAdmin = res.data.image;
                        // console.log(this.admin);
                    }
                })
        }, 500)
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>

<style>
@import url(../css/admin/adminnavbar.css);
</style>