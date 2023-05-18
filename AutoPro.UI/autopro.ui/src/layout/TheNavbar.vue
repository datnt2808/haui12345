<template>
    <div class="navbar">
        <div class="nav-list">
            <router-link to="/" class="nav-item" style="display: flex;" @click="goHome">
                <i class="fa-solid fa-house"></i>
                <div class="nav-text" style="padding-left: 8px;">Trang chủ</div>
            </router-link>
            <div class="nav-item" style="display: flex;">
                <i class="fa-solid fa-bars"></i>
                <div class="nav-text" style="padding-left: 8px;">Danh mục sản phẩm</div>
                <div class="sub-menu">
                    <div class="nav-item-submenu" v-for="(item, index) in dataCategory" :key="index">
                        <div style="cursor: pointer;width: 220px;height: 40px;line-height:40px;"
                            @click="productCategory(item)">
                            <!-- <router-link :to="'/category/' + item.categoryID" class="no-link"
                                style="cursor: pointer;width: 220px;height: 40px;line-height:40px;"> -->
                            <div class="nav-text">{{ item.categoryName }}</div>
                            <!-- </router-link> -->
                        </div>
                    </div>
                </div>
            </div>
            <router-link to="/about" @click="goHome" class="nav-item">Giới thiệu</router-link>
            <router-link to="/news" @click="goHome" class="nav-item" style="display: flex;">
                <i class="fa-solid fa-newspaper"></i>
                <div class="nav-text" style="padding-left: 8px;">Tin tức</div>
            </router-link>
            <router-link to="/helps/pay-ment" @click="goHome" class="nav-item" style="display: flex;">
                <i class="fa-solid fa-headset"></i>
                <div class="nav-text" style="padding-left: 8px;">Chính sách</div>
            </router-link>
            <router-link to="/contact" @click="goHome" class="nav-item" style="display: flex;">
                <i class="fa-solid fa-circle-info"></i>
                <div class="nav-text" style="padding-left: 8px;">Liên hệ</div>
            </router-link>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import ApiProductCategory from '../js/apiProductCategory';
export default {
    /**
     * Tên component
     */
    name: "TheNavbar",
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: {},
    /**
     * Emit sự thay đổi
     */
    emits: [""],
    directives: {},
    /**
     * Data
     */
    data() {
        return {
            dataCategory: {},
        };
    },
    /**
     * Phương thức
     */
    methods: {
        getAllCategory() {
            axios.get(ApiProductCategory.getAll())
                .then((res) => {
                    if (res.status == 200) {
                        this.dataCategory = res.data;
                    } else {
                        this.dataCategory = null;
                    }
                })
        },
        goHome() {
            this.$store.commit('updateSearch');
        },

        productCategory(data) {
            this.goHome();
            this.$emit("onSearch", data.categoryID);
            console.log(data.categoryID);
            this.$router.push({ path: '/product/category/:id', name: 'productCategory', params: { id: data.categoryID } })
        }
    },
    created() {
        this.getAllCategory();
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
};
</script>

<style>
@import url(../css/navbar.css);
</style>