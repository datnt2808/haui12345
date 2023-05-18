<template>
    <div>
        <TheHeader></TheHeader>
        <TheNavbar></TheNavbar>
        <div class="content" id="main">
            <TheLineLink name="Sản phẩm yêu thích"></TheLineLink>
            <div class="list-product-impoted">
                <div v-for="(item, index) in listFavorite" :key="index">
                    <!-- <router-link :to="'/product/' + item.productID" style="text-decoration: none;color: black;"> -->
                    <div>
                        <div class="product">
                            <div class="product-image">
                                <img :src="item.image" alt="">
                                <div class="favourtive">
                                    <i class="fa-solid fa-heart" style="color: red;" @click="removeFavorite(item)"></i>
                                </div>
                            </div>
                            <div class="product-name">{{ item.productName }}</div>
                            <div class="price">{{ formatMoney(item.price) }}</div>
                            <div class="product-buttom">
                                <div class="product-detail" @click="detailProduct(item.productID)">Xem chi tiết</div>
                                <div class="add-cart" @click="addCart(item)">Thêm vào giỏ hàng</div>
                            </div>
                        </div>
                        <!-- </router-link> -->
                    </div>
                </div>
            </div>
            <div class="nocart" v-show="noCart">
                <img src="../../assets/Image/nocart.png" alt="">
                <h4>Không có sản phẩm yêu thích nào</h4>
            </div>
        </div>
        <TheFooter></TheFooter>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>

<script>
import TheFooter from '@/layout/TheFooter.vue';
import TheHeader from '@/layout/TheHeader.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import { formatMoney } from '@/js/gCommon'
import MQuantity from '@/components/MQuantity.vue';
import MLoading from '@/components/MLoading.vue';

export default {
    /**
         * Tên component
         */
    name: 'FavoriteProduct',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, TheFooter, TheLineLink, MLoading },
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
            listFavorite: [],
            totalCartItem: 0,
            showCart: false,
            noCart: false,
            showLoading: false,
            productCart: {
                quantitys: ''
            },
            number: 1,
        }
    },
    /**
     * Phương thức
     */
    methods: {
        detailProduct(item) {
            this.$router.push({ name: 'product', params: { id: item } });
        },

        addCart(data) {
            this.productCart = data;
            this.productCart.quantitys = this.number;
            // console.log(this.productCart);
            this.$store.commit('addToCart', this.productCart);
        },

        formatMoney(money) {
            return formatMoney(money);
        },

        removeFavorite(data) {
            this.showLoading = true;
            setTimeout(() => {
                this.showLoading = false;
                this.$store.commit('removeFavorite', data);
                this.$toast.success("Xóa thành công")
            }, 100);
        }
    },
    created() {
        this.showLoading = true;
        setTimeout(() => {
            this.showLoading = false
            this.listFavorite = this.$store.state.favorite.listFavorite;
            if (this.listFavorite.length > 0) {
                this.showCart = true;
                this.noCart = false;
            } else {
                this.showCart = false;
                this.noCart = true;
            }
        }, 400);
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        totalRecord(newVal) {
            if (newVal == 0) {
                this.showCart = false;
                this.noCart = true;
            }
        }
    },

    computed: {
        totalRecord() {
            return this.$store.state.favorite.listFavorite.length;
        }
    }
}
</script>

<style>
@import url(../../css/productfavorite.css);
</style>