<template>
  <div>
    <TheHeader></TheHeader>
    <TheNavbar></TheNavbar>
    <div class="content" id="main">
      <TheLineLink name="Sản phẩm" :detail="'/ ' + product.productName"></TheLineLink>
      <div class="details-product">
        <div class="details-product-image">
          <img :src="product.image" alt="" />
        </div>
        <div class="details-product-right">
          <div class="details-product-name">
            Tên sản phẩm: {{ product.productName }}
          </div>
          <div class="details-product-code">Mã sản phẩm: {{ product.productCode }}</div>
          <div class="details-product-brand">Thương hiệu: {{ brand.brandName }}</div>
          <div class="details-product-brand">Xuất xứ: {{ product.placeOrigin }}</div>
          <div class="details-product-price">Giá tiền: {{ formatMoney(product.price) }} </div>
          <div v-if="starCommentProduct > 0">
            <div class="details-product-sell" style="display: flex;align-items: center;">
              <div>Đánh giá: {{ this.starCommentProduct }}/5</div><img src="../../assets/Image/star.svg"
                style="margin-left: 4px;width: 16px;height: 16px;" alt="">
            </div>
          </div>
          <div v-else>
            <div class="details-product-sell">Đánh giá: Chưa có đánh giá</div>
          </div>
          <div class="details-product-sell">Đã bán: {{ product.quantitySell }}</div>
          <div class="details-product-sell">Số lượng còn: {{ product.quantity }}</div>
          <div class="details-product-status">Tình trạng : <b> {{ formatStatusProduct(product.quantity -
            product.quantitySell)
          }}</b></div>
          <div class="details-product-number">
            <i class="fa-solid fa-minus" style="cursor: pointer;" @click="minusQuantity"></i>
            <MInput style="width: 80px; border-radius: 1px" v-model="this.number"></MInput>
            <i class="fa-solid fa-plus" style="cursor: pointer;" @click="addQuantity"></i>
          </div>
          <div class="details-product-order" @click="addCart" v-show="showCartButton">
            <button>Đặt hàng</button>
          </div>
          <div class="details-product-describe">Mô tả : {{ product.description }}</div>
          <div class="details-product-commit">
            Thông tin thêm
            <p>
              <i class="fa-solid fa-circle-check" style="color: #11990f"></i>
              Đảm bảo giá thấp nhất
            </p>
            <p>
              <i class="fa-solid fa-circle-check" style="color: #11990f"></i>
              Cam kết đúng chất lượng và chủng loại sản phẩm
            </p>
            <p>
              <i class="fa-solid fa-circle-check" style="color: #11990f"></i>
              Hoàn trả 100% chi phí đặt trước nếu không đảm bảo chất lượng sản
              phẩm
            </p>
          </div>
          <div class="detail-product-comment">Đánh giá</div>
          <div class="list-comment" v-for="(item, index) in dataComment" :key="index">
            <div class="user-comment" style="margin: 20px 0;">
              <div class="user-comment-img">
                <img :src="item.Image" alt="" />
              </div>
              <div class="user-comment-conten">
                <div style="display: flex;justify-content: space-between;">
                  <div class="username-comment">Người đánh giá: {{ item.Name }}</div>
                  <div>
                    <star-rating :show-rating="false" :read-only="true" :star-size="20" :rating="item.RatingID"
                      :animate="true"></star-rating>
                    <!-- Đánh giá: {{ item.RatingID }} sao -->
                  </div>
                </div>
                <div class="user-content-comment">Nội dung: {{ item.Detail }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="line-footer"></div>
      <div class="new-products-imported">
        <div class="title">SẢN PHẨM TƯƠNG TỰ</div>
        <div class="list-product-impoted">
          <div v-for="(item, index) in dataProductNews" :key="index">
            <div>
              <!-- <router-link :to="'/product/' + item.productID" style="text-decoration: none;color: black;"
              @click="detailProduct(item.productID)"> -->
              <div class="product">
                <div class="product-image">
                  <img :src="item.image" alt="">
                  <div class="favourtive" @click="favoriteProduct(item)">
                    <i class="fa-solid fa-heart"></i>
                  </div>
                </div>
                <div class="product-name">{{ item.productName }}</div>
                <div class="price">{{ formatMoney(item.price) }}</div>
                <div class="product-buttom">
                  <div class="product-detail" @click="detailProduct(item.productID)">Xem chi tiết</div>
                  <div class="add-cart" @click="addCart2(item)">Thêm vào giỏ hàng</div>
                </div>
              </div>
              <!-- </router-link> -->
            </div>
          </div>
        </div>
        <div class="see-more" @click="seeMoreImported">Xem thêm</div>
      </div>
    </div>
    <TheFooter></TheFooter>
    <MLoading v-if="showLoading"></MLoading>
  </div>
</template>
  
<script>
import MInput from "@/components/MInput.vue";
import MLoading from "@/components/MLoading.vue";
import TheFooter from "@/layout/TheFooter.vue";
import TheHeader from "@/layout/TheHeader.vue";
import TheLineLink from "@/layout/TheLineLink.vue";
import TheNavbar from "@/layout/TheNavbar.vue";
import axios from 'axios';
import { formatStatusProduct, formatDate, formatMoney } from '@/js/gCommon'
import ApiProduct from '../../js/apiProduct';
import ApiBrand from '../../js/apiBrand';
import StarRating from 'vue-star-rating'

export default {
  /**
   * Tên component
   */
  name: "DetailsProduct",
  /**
   * Hứng nhận
   */
  props: {
    id: {
      type: String,
      required: true
    }
  },
  /**
   * Component được sử dụng
   */
  components: { TheHeader, TheNavbar, TheFooter, TheLineLink, MInput, MLoading, StarRating },
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
      showLoading: false,
      product: {},
      brand: {},
      dataProductNews: {},
      pageSize: 4,
      productCart: {
        quantitys: ''
      },
      number: 1,
      productCart2: {
        quantitys: ''
      },
      number2: 1,
      textSearch: '',
      productFavorite: {},
      showCartButton: false,
      dataComment: [],
    };
  },
  /**
   * Phương thức
   */
  methods: {
    formatMoney(money) {
      return formatMoney(money);
    },

    formatStatusProduct(status) {
      return formatStatusProduct(status);
    },

    async getBrand(id) {
      await axios.get(ApiBrand.getBrandByID(id))
        .then((res) => {
          this.brand = res.data;
          this.textSearch = res.data.brandName;
          // console.log(this.brand);
        })
    },

    detailProduct(item) {
      this.getProductByID(item);
    },

    getProductNews() {
      this.showLoading = true;
      setTimeout(() => {
        axios.get(ApiProduct.filterProduct(this.textSearch, this.pageSize, 2))
          .then((res) => {
            if (res.status == 200) {
              this.showLoading = false;
              this.dataProductNews = res.data.data;
            } else {
              this.showLoading = false;
              this.dataProductNews = null;
            }
          })
      }, 500);
    },

    seeMoreImported() {
      this.pageSize = this.pageSize + 4;
      this.getProductNews();
    },

    addCart() {
      let type = typeof this.number;
      // console.log(type);
      if (type == "string") {
        alert("Dữ liệu nhập vào sai định dạng số");
        this.number = 1;
        return;
      }
      if (this.number > this.product.quantity) {
        alert("Sản phẩm mua nhiều hơn số lượng có trong kho");
        this.number = 1;
        return
      }
      this.productCart = { ...this.product };
      this.productCart.quantitys = this.number;
      // console.log(this.productCart);
      this.$store.commit('addToCart', this.productCart);
      this.$router.push('/cart');
      this.$toast.success("Thêm thành công sản phẩm vào giỏ hàng");
    },

    addCart2(data) {
      console.log(data);
      if (this.number2 > data.quantity) {
        alert("Sản phẩm mua nhiều hơn số lượng có trong kho");
        this.number2 = 1;
        return;
      }
      this.productCart2 = { ...data };
      this.productCart2.quantitys = this.number2;
      // console.log(this.productCart);
      this.$store.commit('addToCart', this.productCart2);
      // this.$router.push('/cart');
      this.$toast.success("Thêm thành công sản phẩm vào giỏ hàng");
    },

    minusQuantity() {
      this.number = parseInt(this.number) - 1;
    },

    addQuantity() {
      this.number = parseInt(this.number) + 1;
    },

    getProductByID(value) {
      // Khởi tạo lấy giá trị id truyền vào
      if (value) {
        // Bật loadding
        this.showLoading = true;
        setTimeout(async () => {
          //Lấy dữ liệu
          await axios.get(ApiProduct.getProductByID(value))
            .then((res) => {
              this.showLoading = false;
              this.product = res.data;
              this.getCommnetbyProduct(res.data.productID);
              let showbuttonCart = res.data.quantity - res.data.quantitySell;
              if (showbuttonCart == 0) {
                this.showCartButton = false;
              } else {
                this.showCartButton = true;
              }
              this.getBrand(this.product.brandID);
              this.getProductNews();
              // console.log("pro", this.product);
            })
        }, 500)
      }
    },

    getCommnetbyProduct(idProducts) {
      axios.get('https://localhost:7129/api/v1/ProductComment/ListCommentByPorduct', { params: { idProduct: idProducts } })
        .then((res) => {
          if (res.status == 200) {
            this.dataComment = res.data;
            // console.log(this.dataComment);
          }
        })
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
    }
  },
  created() {
    let id = this.$route.params.id;
    this.getProductByID(id);
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {
    '$route.params.id': function (newVal) {
      this.getProductByID(newVal);
    },

    number(newVal) {
      if (newVal <= 0) {
        alert("Số lượng nhập nhỏ hơn 0");
        this.number = 1;
      }

      if (newVal > this.product.quantity) {
        alert("Bạn đã nhập số lượng lớn hơn số lượng có trong kho");
        this.number = 1;
      }
    },
  },
  computed: {
    starCommentProduct() {
      if (this.dataComment.length > 0) {
        let tong = 0;
        this.dataComment.forEach((x) => {
          tong += x.RatingID;
        })
        // console.log(tong);
        // console.log(this.dataComment.length);
        return parseFloat(tong / this.dataComment.length);
      } else {
        return 0;
      }
    }
  }
};
</script>
  
<style>
@import url(../../css/detailsproduct.css);
</style>