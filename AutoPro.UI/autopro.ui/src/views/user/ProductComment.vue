<template>
  <div class="aform-detail">
    <div class="aform-account">
      <div class="aform-title">
        <div class="aform-title-left">Viết đánh giá</div>
        <div class="onClose" @click="onClose" style="cursor: pointer">
          <i class="fa-regular fa-circle-xmark"></i>
        </div>
      </div>
      <div class="form-input">
        <div class="login-account">
          <div class="text">Nội dung đánh giá :</div>
          <MInput
            type="text"
            ref="account"
            styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
            v-model="detail"
          >
          </MInput>
        </div>
        <div class="login-password">
          <!-- <AwesomeVueStarRating :star="this.star" :disabled="this.disabled" :maxstars="this.maxstars"
                        :starsize="this.starsize" :hasresults="this.hasresults" :hasdescription="this.hasdescription"
                        :ratingdescription="this.ratingdescription" /> -->
          <star-rating
            :show-rating="false"
            v-model:rating="rating"
            :animate="true"
          ></star-rating>
        </div>
      </div>
      <div class="submit" @click="sendComment">
        <input type="submit" value="Gửi đánh giá" style="padding: 4px" />
      </div>
    </div>
    <MLoading v-if="showLoading"></MLoading>
  </div>
</template>

<script>
// import AwesomeVueStarRating from 'awesome-vue-star-rating'
import StarRating from "vue-star-rating";
import MInput from "@/components/MInput.vue";
import MLoading from "@/components/MLoading.vue";
import axios from "axios";
import { faL } from "@fortawesome/free-solid-svg-icons";
import ApiUser from "../../js/apiUser";

export default {
  /**
   * Tên component
   */
  name: "ProductComment",
  /**
   * Hứng nhận
   */
  props: ["idProduct", "idOrder", "idOrderDetail"],
  /**
   * Component được sử dụng
   */
  components: { MInput, MLoading, StarRating },
  /**
   * Emit sự thay đổi
   */
  emits: ["onClose","updateOrderDetailProduct"],
  directives: {},
  methods: {
    async updateproductComment() {
      let orderDetailProduct = {
        idOrderDetail: this.idOrderDetail,
        idOrder: this.idOrder,
        idProduct: this.idProduct,
      };
      try {
        const response = await axios.post(
          "https://localhost:7129/api/v1/ProductComment/UpdateCommentbyOrderDetailProduct",
          orderDetailProduct
        );

        if (response.status === 200) {
          console.log("update comment sản phẩm thành công");
        }
        console.log(response);
        return response; // Trả về kết quả từ updateproductComment
      } catch (err) {
        console.log(err);
        this.$toast.error("Có lỗi xảy ra");
        throw err; // Ném lỗi để bắt được ở phần gọi hàm
      }
    },
    async sendComment() {
      let comment = {
        userID: this.dataUser.userID,
        name: this.dataUser.fullName,
        image: this.dataUser.image,
        detail: this.detail,
        productID: this.idProductPost,
        ratingID: this.rating,
      };
      await axios
        .post("https://localhost:7129/api/v1/ProductComment", comment)
        .then((res) => {
          if (res.status == 201) {
            const updateResult = this.updateproductComment();
            updateResult
              .then((res) => {
                if (res.status == 200) {
                  this.$toast.success("Đánh giá thành công");
                  this.$emit("onClose");
                  this.$emit("updateOrderDetailProduct");
                }
              })
              .catch((err) => {
                console.log(err);
                this.$toast.error("Có lỗi xảy ra");
              });
          }
        })
        .catch((err) => {
          console.log(err);
          this.$toast.error("Có lỗi xảy ra");
        });
    },

    onClose() {
      this.$emit("onClose");
    },
  },
  /**
   * Data
   */
  data() {
    return {
      detail: "",
      showLoading: false,
      idUserPost: "",
      idProductPost: "",
      dataUser: {},
      rating: 0,
    };
  },
  created() {
    if (this.idProduct) {
      this.idProductPost = this.idProduct;
      let idUser = localStorage.getItem("UserID");
      axios.get(ApiUser.getUserById(idUser)).then((res) => {
        if (res.status == 200) {
          this.dataUser = res.data;
          // console.log('user', this.dataUser);
        }
      });
    } else {
      this.$toast.error("Có lỗi xảy ra");
    }
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {},
  computed: {},
};
</script>

<style>
/* @import url(../../css/rating.css); */
</style>