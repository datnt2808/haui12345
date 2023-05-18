<template>
    <div class="admin-content">
        <AdminLineLink name="Tổng quan"></AdminLineLink>
        <div class="dashloadheader">
            <div class="iconh" @click="adminOrder">
                <div class="i1" style="background-color: #17a2b8;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Tổng số đơn hàng
                        </div>
                        <div style="font-size: 30px;">
                            {{ dashload.tongDonHang }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/bag.svg" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #137e8f;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
            <div class="iconh" @click="adminUser">
                <div class="i1" style="background-color: #11DC99;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Tổng số người dùng
                        </div>
                        <div style="font-size: 30px;">
                            {{ dashload.tongUser }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/user.svg" style="padding-right: 10px;" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #03A36D;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
            <div class="iconh" @click="adminBrand">
                <div class="i1" style="background-color: #EFF427;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Tổng số nhãn hàng
                        </div>
                        <div style="font-size: 30px;">
                            {{ dashload.tongNhanHang }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/brand.svg" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #959906;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
            <div class="iconh" @click="adminNews">
                <div class="i1" style="background-color: #F3482B;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Tổng số tin tức
                        </div>
                        <div style="font-size: 30px;">
                            {{ dashload.tongTinTuc }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/news.svg" style="padding-right: 10px;" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #C02910;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
        </div>
        <div class="dashloadheader" style="margin-top: 10px;display: flex;">
            <div class="iconh" @click="adminProduct">
                <div class="i1" style="background-color: #2371EC;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Tổng sản phẩm
                        </div>
                        <div style="font-size: 30px;">
                            {{ dashload.tongSanPham }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/product.png" style="padding-right: 10px;" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #1347DE;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
            <div class="iconh" @click="adminCategory">
                <div class="i1" style="background-color: #34EC52;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Tổng danh mục
                        </div>
                        <div style="font-size: 30px;">
                            {{ dashload.tongDanhMuc }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/category.png" style="padding-right: 10px;" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #08901E;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
            <div class="iconh" @click="adminRevenue">
                <div class="i1" style="background-color: #E79434;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Tổng doanh thu - thống kê
                        </div>
                        <div style="font-size: 30px;">
                            {{ formatMoney(dashload.tongDoanhThu) }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/revenue.png" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #C97310;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
            <div class="iconh" @click="adminProduct">
                <div class="i1" style="background-color: #E3D17F;">
                    <div class="i12">
                        <div style="font-size: 18px;">
                            Sản phẩm sắp hết hàng
                        </div>
                        <div style="font-size: 30px;">
                            {{ dashload.sanPhamSapHetHang }}
                        </div>
                    </div>
                    <div class="i13">
                        <img src="../../assets/Image/product.png" style="padding-right: 10px;" alt="">
                    </div>
                </div>
                <div class="i2" style="background-color: #D7B725;">
                    Xem chi tiết
                    <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
                </div>
            </div>
        </div>
        <div class="iconh" @click="adminComment" style="margin-top: 10px;">
            <div class="i1" style="background-color: #CC5AEF;">
                <div class="i12">
                    <div style="font-size: 18px;">
                        Tổng số đánh giá
                    </div>
                    <div style="font-size: 30px;">
                        {{ dashload.tongDanhgia }}
                    </div>
                </div>
                <div class="i13">
                    <img src="../../assets/Image/product.png" style="padding-right: 10px;" alt="">
                </div>
            </div>
            <div class="i2" style="background-color: #8218A3;">
                Xem chi tiết
                <i class="fa-regular fa-circle-right" style="margin-left: 4px;"></i>
            </div>
        </div>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>

<script>
import MLoading from '@/components/MLoading.vue';
import AdminLineLink from '@/layout/AdminLineLink.vue';
import axios from 'axios';
import { formatMoney } from "@/js/gCommon"

export default {
    /**
           * Tên component
           */
    name: 'AdminDashload',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { AdminLineLink, MLoading },
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
            showLoading: false,
            dashload: {},
        }
    },
    /**
     * Phương thức
     */
    methods: {
        formatMoney(money) {
            return formatMoney(money);
        },

        adminOrder() {
            this.$router.push('/admin/order');
        },

        adminUser() {
            this.$router.push('/admin/account');
        },

        adminBrand() {
            this.$router.push('/admin/brand');
        },

        adminNews() {
            this.$router.push('/admin/news');
        },

        adminProduct() {
            this.$router.push('/admin/product');
        },

        adminRevenue() {
            this.$router.push('/admin/revenue-statistics');
        },

        adminCategory() {
            this.$router.push('/admin/category');
        },
        
        adminComment() {
            this.$router.push('/admin/comment');
        },
    },
    created() {
        const role = localStorage.getItem("Role");
        if (role == "User" || role == null) {
            this.$router.push('/forbidden');
            return;
        }
        this.showLoading = true;
        setTimeout(() => {
            axios.get("https://localhost:7129/api/v1/Dashload")
                .then((res) => {
                    this.showLoading = false;
                    this.dashload = res.data;
                })
        }, 500);
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>

<style>
@import url(../../css/admin/admindashload.css);
</style>