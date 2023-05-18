<template>
    <div>
        <TheHeader></TheHeader>
        <TheNavbar></TheNavbar>
        <div class="content">
            <TheLineLink name="Giỏ hàng"></TheLineLink>
            <div v-show="showCart">
                <table class="m-table-order">
                    <thead>
                        <tr>
                            <th style="min-width: 50px;padding-left: 16px;">
                                STT
                            </th>
                            <th style="min-width: 300px;">Sản phẩm</th>
                            <th style="min-width: 200px;">Đơn giá</th>
                            <th style="min-width: 100px;">Số lượng</th>
                            <th style="min-width: 200px;">Thành tiền</th>
                            <th style="min-width: 100px;">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item, index) in listCart" :key="index">
                            <td style="min-width: 50px; padding-left: 16px;">
                                {{ index + 1 }}
                            </td>
                            <td style="min-width: 300px;cursor: pointer;" @click="detailProduct(item)">
                                <div class="product-cart">
                                    <img :src="item.image" alt="">
                                    <div class="product-cart-name">{{ item.productName }}</div>
                                </div>
                            </td>
                            <td style="min-width: 150px;">{{ formatMoney(item.price) }}</td>
                            <td style="min-width: 150px;">
                                <MQuantity v-model="item.quantitys" :quantity="item.quantity" v-show="item.quantity > 0"></MQuantity>
                            </td>
                            <td style="min-width: 150px;" v-show="item.quantity <= 0">{{ item.quantity }}</td>
                            <td style="min-width: 150px;">
                                {{ formatMoney(item.price * item.quantitys) }}
                            </td>
                            <td style="min-width: 100px; cursor: pointer;" @click="deleteProdoctCart(item)">
                                <div class="cart-method">Xóa</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="pay">
                    <div class="total-pay">
                        Tổng thanh toán(tạm tính) :{{ formatMoney(totalAmount) }}
                    </div>
                    <div class="purchase" @click="purchase">
                        <button>Mua hàng</button>
                    </div>
                    <!-- <router-link to="/purchase" ></router-link> -->
                </div>
            </div>
            <div class="nocart" v-show="noCart">
                <img src="../../assets/Image/nocart.png" alt="">
                <h4>Không có sản phẩm ở giỏ hàng</h4>
                <router-link to="/">
                    <h5>Tiếp tục mua sắm</h5>
                </router-link>
            </div>
        </div>
        <TheFooter></TheFooter>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
import MInput from '@/components/MInput.vue';
import TheFooter from '@/layout/TheFooter.vue';
import TheHeader from '@/layout/TheHeader.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import { formatMoney } from '@/js/gCommon'
import MQuantity from '@/components/MQuantity.vue';
import MLoading from '@/components/MLoading.vue';
import axios from 'axios';
import ApiProduct from '../../js/apiProduct';
export default {
    /**
     * Tên component
     */
    name: 'Cart',
    /**
     * Hứng nhận
     */
    props: {},
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, MInput, TheFooter, TheLineLink, MQuantity, MLoading },
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
            listCart: [],
            totalCartItem: 0,
            showCart: false,
            noCart: false,
            listProduct: [],
            showLoading: false,
        }
    },
    /**
     * Phương thức
     */
    methods: {
        deleteProdoctCart(item) {
            let text = "Bạn có muỗn xóa sản phẩm khỏi giỏ hàng không ?";
            if (confirm(text) == true) {
                this.removeProduct(item);
            }
        },

        formatMoney(menoy) {
            return formatMoney(menoy);
        },

        removeProduct(item) {
            this.$store.commit('removeCart', item);
            this.$toast.success("Xóa thành công sản phẩm khỏi giỏ hàng")
        },

        purchase() {
            const id = localStorage.getItem("UserID");
            if (!id) {
                alert("Bạn chưa đăng nhập!Vui lòng đăng nhập để sử dụng");
                this.$router.push('/account/sign-up');
            } else {
                let count = 0;
                let b = 0;
                this.listCart.forEach((x) => {
                    let a = this.listProduct.find(y => y.productID == x.productID);
                    console.log(a);
                    if (x.quantitys < 0) {
                        x.quantitys = 1;
                        b++;
                    }
                    if (x.quantitys > a.quantity) {
                        count++;
                        x.quantitys = 1;
                    }
                });
                if (count == 0 && b == 0) {
                    this.$router.push('/purchase');
                } else if (b > 0) {
                    alert("Số lượng nhập nhỏ hơn 0");
                    return;
                } else {
                    alert("Sản phẩm mua nhiều hơn số lượng có trong kho");
                    return;
                }
            }
        },

        detailProduct(data) {
            this.$router.push({ name: 'product', params: { id: data.productID } });
        },

        getProductByID() {
            let listID = this.$store.state.cart.items.map(x => x.productID);
            listID.forEach(x => {
                axios.get(ApiProduct.getProductByID(x))
                    .then((res) => {
                        let product = res.data;
                        this.listProduct.push(product);
                    })
            });
        }
    },
    created() {
        this.showLoading = true;
        setTimeout(() => {
            this.showLoading = false
            this.listCart = this.$store.state.cart.items;
            this.totalCartItem = this.$store.state.cart.totalCartItem;
            this.getProductByID();
            if (this.listCart.length > 0) {
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
        },

    },
    computed: {
        totalAmount() {
            return this.$store.state.cart.items.reduce((total, item) => total + (item.price * item.quantitys), 0);
        },

        totalRecord() {
            return this.$store.state.cart.items.length;
        },
    },

}
</script>
  
<style>
@import url(../../css/cart.css);
</style>