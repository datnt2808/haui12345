<template>
  <div>
    <TheHeader></TheHeader>
    <TheNavbar></TheNavbar>
    <div class="content">
      <MLoading v-if="showLoading"></MLoading>
      <div class="line-content"></div>
      <div class="brand-products">
        <div class="title">NHÃN HÀNG HỢP TÁC</div>
        <div class="list-brand">
          <i
            class="fa-solid fa-circle-left fa-lg"
            @click="prevSlide"
            style="margin-right: 20px; cursor: pointer"
          ></i>
          <div class="slide-container" ref="slideContainer">
            <div
              class="slide"
              v-for="(item, index) in dataBrand"
              :key="item.brandID"
              :style="{
                transform:
                  'translateX(' + (index * 150 - currentIndex * 150) + 'px)',
              }"
            >
              <div class="item">
                <img :src="item.image" alt="" />
              </div>
            </div>
          </div>
          <i
            class="fa-solid fa-circle-right fa-lg"
            @click="nextSlide"
            style="margin-left: 20px; cursor: pointer"
          ></i>
        </div>
      </div>
      <div class="new-products-imported">
        <div class="title">SẢN PHẨM MỚI NHẬP VỀ</div>
        <div class="list-product-impoted">
          <div
            v-for="(item, index) in dataProductNews"
            :key="index"
            :class="{ 'row-selected': rowSelected == item.productID }"
          >
            <!-- <router-link :to="'/product/' + item.productID" style="text-decoration: none;color: black;"> -->
            <div>
              <div class="product">
                <div class="product-image">
                  <img :src="item.image" alt="" />
                  <div class="favourtive">
                    <i
                      class="fa-solid fa-heart"
                      @click="favoriteProduct(item)"
                    ></i>
                  </div>
                </div>
                <div class="product-name">{{ item.productName }}</div>
                <div class="price">{{ formatMoney(item.price) }}</div>
                <div class="product-buttom">
                  <div
                    class="product-detail"
                    @click="detailProduct(item.productID)"
                  >
                    Xem chi tiết
                  </div>
                  <div class="add-cart" @click="addCart(item)">
                    Thêm vào giỏ hàng
                  </div>
                </div>
              </div>
              <!-- </router-link> -->
            </div>
          </div>
        </div>
        <div class="see-more" @click="seeMoreImported">Xem thêm</div>
      </div>
      <div class="new-products-imported">
        <div class="title">SẢN PHẨM BÁN NHIỀU NHẤT</div>
        <div class="list-product-impoted">
          <div
            v-for="(item, index) in dataNews"
            :key="index"
            :class="{ 'row-selected': rowSelected == item.productID }"
          >
            <!-- <router-link :to="'/product/' + item.productID" style="text-decoration: none;color: black;"> -->
            <div>
              <div class="product">
                <div class="product-image">
                  <img :src="item.image" alt="" />
                  <div class="favourtive" @click="favoriteProduct(item)">
                    <i class="fa-solid fa-heart"></i>
                  </div>
                </div>
                <div class="product-name">{{ item.productName }}</div>
                <div class="price">{{ formatMoney(item.price) }}</div>
                <div class="product-buttom">
                  <div
                    class="product-detail"
                    @click="detailProduct(item.productID)"
                  >
                    Xem chi tiết
                  </div>
                  <div class="add-cart" @click="addCart(item)">
                    Thêm vào giỏ hàng
                  </div>
                </div>
              </div>
            </div>
            <!-- </router-link> -->
          </div>
        </div>
        <div class="see-more" @click="seeMoreImported2">Xem thêm</div>
      </div>
    </div>
    <TheFooter></TheFooter>
  </div>
</template>
<script>
import MLoading from "@/components/MLoading.vue";
import TheFooter from "@/layout/TheFooter.vue";
import TheHeader from "@/layout/TheHeader.vue";
import TheNavbar from "@/layout/TheNavbar.vue";
import axios from "axios";
import enumAUTO from "@/js/gEnum";
import ApiBrand from "../../js/apiBrand";
import ApiProduct from "../../js/apiProduct";
import { formatMoney } from "@/js/gCommon";

export default {
  /**
   * Tên component
   */
  name: "Home",
  /**
   * Hứng nhận
   */
  props: [""],
  /**
   * Component được sử dụng
   */
  components: { TheHeader, TheNavbar, TheFooter, MLoading },
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
      showPopup: false,
      role: "",
      id: "",
      dataBrand: {},
      rowSelected: -1,
      showLoading: false,
      textSearch: "",
      pageSize: 8,
      pageNumber: 1,
      showSeeMore: false,
      dataProductNews: {},
      productCart: {
        quantitys: "",
      },
      number: 1,
      productFavorite: {},
      listFilter: [],
      orderBy: "p.quantitySell DESC",
      pageIndex: 1,
      pageSizeNews: 8,
      dataNews: [],
      currentIndex: 0,
    };
  },
  mounted() {},
  /**
   * Phương thức
   */
  methods: {
    prevSlide() {
      if (this.currentIndex === 0) {
        this.currentIndex = this.dataBrand.length - 3;
      } else {
        this.currentIndex -= 1;
      }
    },

    nextSlide() {
      if (this.currentIndex === this.dataBrand.length - 3) {
        this.currentIndex = 0;
      } else {
        this.currentIndex += 1;
      }
    },

    formatMoney(money) {
      return formatMoney(money);
    },

    getAllBrand() {
      axios.get(ApiBrand.getAll()).then((res) => {
        if (res.status == 200) {
          this.dataBrand = res.data;
        } else {
          this.dataBrand = null;
        }
      });
    },

    getProductNews() {
      this.showLoading = true;
      setTimeout(() => {
        axios
          .get(ApiProduct.filterProduct("", this.pageSize, this.pageNumber))
          .then((res) => {
            if (res.status == 200) {
              this.showLoading = false;
              this.dataProductNews = res.data.data;
            } else {
              this.showLoading = false;
              this.dataProductNews = null;
            }
          });
      }, 500);
    },

    getDataRes() {
      this.listFilter = [
        {
          FieldName: "ProductCode",
          Operator: enumAUTO.Operator.Like,
          FilterValue: "",
        },
      ];
      this.showLoading = true;
      setTimeout(async () => {
        let objectFilter = {
          pageIndex: 1,
          pageSize: this.pageSizeNews,
          listFilter: this.listFilter,
          listOrderBy: this.orderBy,
        };
        // console.log(objectFilter);
        await axios
          .post(
            "https://localhost:7129/api/v1/Product/PagingProductByFilter",
            objectFilter
          )
          .then((res) => {
            // console.log(res);
            if (res.status == 200) {
              this.showLoading = false;
              this.dataNews = res.data.data;
              // console.log(res);
              // console.log(this.dataSearch);
            }
          });
      }, 500);
    },

    seeMoreImported() {
      this.pageSize = this.pageSize + 8;
      this.getProductNews();
    },

    seeMoreImported2() {
      this.pageSizeNews = this.pageSizeNews + 8;
      this.getDataRes();
    },

    detailProduct(item) {
      this.$router.push({ name: "product", params: { id: item } });
    },

    addCart(data) {
      this.productCart = data;
      this.productCart.quantitys = this.number;
      // console.log(this.productCart);
      this.$store.commit("addToCart", this.productCart);
      this.$toast.success("Thêm thành công sản phẩm vào giỏ hàng");
    },

    favoriteProduct(item) {
      let user = localStorage.getItem("UserID");
      if (user) {
        console.log(item);
        this.productFavorite = item;
        this.$store.commit("addToFavorite", item);
        // this.$toast.success("Thêm thành công vào sản phẩm yêu thích");
      } else {
        alert(
          "Bạn chưa đăng nhập. Vui lòng đăng nhập để sử dụng tính năng này"
        );
      }
    },
  },

  created() {
    const role = localStorage.getItem("Role");
    this.role = role;
    if (role == "Admin") {
      this.$router.push("/forbidden");
    }
    this.showLoading = true;
    setTimeout(() => {
      this.getAllBrand();
      this.getProductNews();
      this.getDataRes();
      this.showLoading = false;
    }, 500);
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {},
  mounted() {
    setInterval(() => {
      this.currentIndex = (this.currentIndex + 1) % this.dataBrand.length;
    }, 3000);
  },
};
</script>

<style>
@import url(../../css/home.css);
</style>