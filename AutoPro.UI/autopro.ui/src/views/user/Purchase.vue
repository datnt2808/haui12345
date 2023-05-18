<template>
  <div>
    <TheHeader></TheHeader>
    <TheNavbar></TheNavbar>
    <div class="content">
      <TheLineLink name="Đặt hàng"></TheLineLink>
      <div class="purcharse">
        <div class="information-user-order">
          <div class="title-purcharse-user">
            <h6>Thông tin khách hàng</h6>
            <router-link to="/user/:id" class="user-update">Chỉnh sửa thông tin nhận hàng</router-link>
          </div>
          <div class="content-purcharse-user">
            <div class="purcharse-name">
              <h6>Họ và tên:</h6>
              <MInput type="text" class="m-inputp" ref="fullName" messError="Họ và tên không được bỏ trống" styleInput="width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;" v-model="fullName"></MInput>
              <!-- <input type="text" class="m-inputp" v-model="fullName" style="
                  width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;
                " /> -->
            </div>
            <div class="purcharse-address">
              <h6>Địa chỉ:</h6>
              <MInput type="text" class="m-inputp" ref="address" messError="Địa chỉ không được bỏ trống" styleInput="width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;" v-model="address"></MInput>
              <!-- <input type="text" class="m-inputp" v-model="address" style="
                  width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;
                " /> -->
            </div>
            <div class="purcharse-phone-number">
              <h6>Số điện toại:</h6>
              <MInput type="text" class="m-inputp" ref="phoneNumber" messError="Số điện thoại không được bỏ trống"
                styleInput="width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;" v-model="phoneNumber"></MInput>
              <!-- <input type="text" class="m-inputp" v-model="phoneNumber" style="
                  width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;
                " /> -->
            </div>
            <div class="purcharse-phone-number">
              <h6>Email:</h6>
              <MInput type="text" class="m-inputp" ref="email" messError="Email không được bỏ trống" styleInput="width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;" v-model="email"></MInput>
              <!-- <input type="text" class="m-inputp" v-model="email" style="
                  width: 350px;
                  height: 30px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;
                " /> -->
            </div>
            <div class="purcharse-payment-methods">
              <h6>Phương thức thanh toán</h6>
              <MRadio :data="[
                { Gender: 'Thanh toán qua VNPay', GenderValue: 1 },
                { Gender: 'Thanh toán tại nhà', GenderValue: 2 },
              ]" v-model="checkOutTypeID"></MRadio>
            </div>
            <div class="purcharse-phone-number">
              <h6>Ghi chú</h6>
              <textarea v-model="description" style="
                  width: 350px;
                  height: 100px;
                  padding-left: 10px;
                  border-radius: 4px;
                  border: 1px solid #bbb;
                  word-break: break-word;
                  margin-top: 70px;
                "></textarea>
            </div>
            <div style="position: absolute; bottom: 0; right: 40px" v-if="showPayVnPay" @click="paymentVnpay">
              <button style="
                  padding: 0 10px;
                  border: 1px solid #bbb;
                  border-radius: 4px;
                ">
                Đi tới thanh toán VNPAY
              </button>
            </div>
          </div>
        </div>
        <div class="information-product">
          <h6>Thông tin đơn hàng</h6>
          <div class="list-purchase-product" v-for="(item, index) in listCart" :key="index" :class="{
            'row-selected': rowSelected == item.productID,
          }">
            <div class="product-purchase">
              <div class="product-purchase-image" @click="detailProduct(item)" style="cursor: pointer">
                <img :src="item.image" alt="" />
              </div>
              <div class="product-purchase-name">
                {{ item.productName }}
                <br />
                Mã sản phẩm:{{ item.productCode }}
                <br />
                Giá sản phẩm: {{ formatMoney(item.price) }}
                <br />
                Số lượng*{{ item.quantitys }}
              </div>
              <div class="product-purchase-totalmoney">
                {{ formatMoney(item.price * item.quantitys) }}
                <div class="thungracdonhang" @click="deleteProdoctCart(item)">
                  <img src="../../assets/Image/thungrac.png" alt="" />
                </div>
              </div>
            </div>
          </div>
          <div class="total">
            <div>Tổng cộng:</div>
            <div>{{ formatMoney(totalAmount) }}</div>
          </div>
        </div>
      </div>
      <!-- <router-link to="/order"> -->
      <div class="order-purchase" @click="orderProduct" v-show="showDatHang">
        <button>Đặt hàng</button>
      </div>
      <!-- </router-link> -->
    </div>
    <TheFooter></TheFooter>
    <MLoading v-if="showLoading"></MLoading>
  </div>
</template>
  
<script>
import MInput from "@/components/MInput.vue";
import TheFooter from "@/layout/TheFooter.vue";
import TheHeader from "@/layout/TheHeader.vue";
import TheLineLink from "@/layout/TheLineLink.vue";
import { formatMoney, formatDate } from "@/js/gCommon";
import TheNavbar from "@/layout/TheNavbar.vue";
import axios from "axios";
import ApiUser from "../../js/apiUser";
import MLoading from "@/components/MLoading.vue";
import MRadio from "@/components/MRadio.vue";
import ApiOrder from "../../js/apiOrder";

export default {
  /**
   * Tên component
   */
  name: "Purchase",
  /**
   * Hứng nhận
   */
  props: [""],
  /**
   * Component được sử dụng
   */
  components: {
    TheHeader,
    TheNavbar,
    TheFooter,
    TheLineLink,
    MInput,
    MLoading,
    MRadio,
  },
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
      user: {},
      showPayVnPay: false,
      showLoading: false,
      customerInfo: {},
      orderDate: new Date(),
      deliveryDate: "",
      userID: "",
      email: "",
      fullName: "",
      address: "",
      phoneNumber: "",
      checkOutTypeID: 2,
      description: "",
      listCart: [],
      rowSelected: -1,
      listOrderDetail: [],
      email: {},
      listProductDetail: [],
      showDatHang: true,
    };
  },
  /**
   * Phương thức
   */
  methods: {
    formatMoney(menoy) {
      return formatMoney(menoy);
    },

    dateformat(date) {
      return formatDate(date);
    },
    paymentVnpay() {
      let totalAmount = this.totalAmount;
      console.log(totalAmount);
      axios
        .post("https://localhost:7129/api/PayMent/redirect-vnpay", {
          totalAmount: totalAmount,
        })
        .then((res) => {
          let vnpayUrl = res.data;
          // const newTab = window.open(vnpayUrl);
          // newTab.focus();
          window.location.href = vnpayUrl;
          // console.log(res.data);
        });
    },

    deleteProdoctCart(item) {
      let text = `Bạn có muỗn xóa sản phẩm "${item.productName}" khỏi đơn hàng không ?`;
      if (confirm(text) == true) {
        this.removeProduct(item);
      }
    },

    removeProduct(item) {
      this.$store.commit("removeCart", item);
      this.$toast.success("Xóa sản phẩm khỏi đơn hàng thành công");
    },

    validateBeforeSave(data) {
      /**
       * Kiểm tra dữ liệu trước khi lưu
       */
      this.$refs.form.validate();
      if (
        !this.validForm ||
        !dataSave ||
        (dataSave && Object.keys(dataSave).length === 0)
      ) {
        return false;
      }
      if (!this.radios) {
        this.$toast.warning("Vui lòng chọn hình thức thanh toán");
        return false;
      }
      return true;
    },

    detailProduct(data) {
      this.$router.push({ name: "product", params: { id: data.productID } });
    },

    validateForm() {
      let validate = true;
      if (this.fullName.trim().length <= 0) {
        this.$refs.fullName.validate();
        validate = false;
      }
      if (this.address.trim().length <= 0) {
        this.$refs.address.validate();
        validate = false;
      }
      if (this.phoneNumber.trim().length <= 0) {
        this.$refs.phoneNumber.validate();
        validate = false;
      }
      if (this.email.trim().length <= 0) {
        this.$refs.email.validate();
        validate = false;
      }
      if (this.checkOutTypeID <= 0 || this.checkOutTypeID == null) {
        validate = false;
      }
      return validate;
    },
    // Click nút Đặt hàng
    orderProduct() {
      // validate
      if (!this.validateForm()) {
        alert("Bạn đã nhập thiếu thông tin");
      } else {
        this.handleOrder();
      }
    },
    sendEmail(order, listProduct) {
      let emailToMail = this.email;
      this.email = {
        fromEmail: "nguyenthanhdat28082001@gmail.com",
        fromDisplayName: "HaUI",
        toEmail: emailToMail,
        subject: "Đơn hàng đã được đặt thành công",
        body: `Chào ${order.fullName},<br>
                        Cảm ơn bạn đã đặt hàng từ chúng tôi. Đơn hàng của bạn đã được tiếp nhận và đang được xử lý. Dưới đây là chi tiết đơn hàng của bạn:
                        <br>
                        Mã đơn hàng: ${order.orderCode}
                        <br>
                        Ngày đặt hàng: ${this.dateformat(order.orderDate)}
                        <br>
                        Số điện thoại: ${order.phoneNumber}
                        <br>
                        Nơi nhận: ${order.address}
                        <br>
                        Ghi chú: ${order.description}
                        <br>
                        Hình thức thanh toán: ${order.checkOutTypeName}
                        <br>
                        Tình trạng thanh toán: ${order.checkoutStatusName}
                        <br>
                        Danh sach Sản phẩm:
                        <table>
                            <thead style="text-align:left">
                                <tr>
                                    <th style="width:200px">Tên sản phẩm</th>
                                    <th style="width:200px">Giá</th>
                                    <th style="width:200px">Số lượng</th>
                                    <th style="width:200px">Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${listProduct}
                            </tbody>
                        </table>
                        <br>
                        Tổng thanh toán :${formatMoney(order.totalAmount)}
                        <br>
                        Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu nào, vui lòng liên hệ với chúng tôi. Chúng tôi luôn sẵn sàng hỗ trợ bạn.
                        <br>
                        Chúng tôi rất cảm kích sự lựa chọn của bạn và mong muốn được phục vụ bạn trong tương lai.
                        <br>
                        Trân trọng,
                        <br>
                        HaUI`,
      };
      axios
        .post("https://localhost:7129/api/Mail/send", this.email)
        .then((res) => {
          console.log(res);
          // this.$toast.success("Email được gửi thành công")
        })
        .catch((err) => {
          alert("Email gửi thất bại");
          this.$toast.error("Gửi email thất bại");
        });
    },
    handleOrder() {
      const me = this;
      this.prepareBeforeHandle();
      let orderParam = {
        order: JSON.stringify(this.customerInfo),
        orderdetail: JSON.stringify(this.listOrderDetail),
      };
      // console.log(orderParam);
      if (this.checkOutTypeID == 1) {
        this.paymentVnpay();
        axios
          .post(ApiOrder.insertOrderDetail(), orderParam)
          .then((res) => {
            // console.log(res);
            if (res.status == 201) {
              alert("Đơn hàng đã được đặt thành công");
              let listProduct = JSON.parse(orderParam.orderdetail);
              let productListHtml = "";
              console.log(listProduct);
              listProduct.forEach((item) => {
                // Do something with each item in the array
                productListHtml += `<tr>
                                        <td>${item.productName}</td>
                                        <td>${formatMoney(item.price)}</td>
                                        <td>${item.quantitys}</td>
                                        <td>${formatMoney(
                  item.price * item.quantitys
                )}</td>
                                    </tr>`;
              });
              // console.log(productListHtml);
              this.sendEmail(res.data, productListHtml);
              this.$router.push("/order");
              this.$toast.success("Đặt hàng thành công");
            } else {
              alert("Có lỗi xảy ra");
              this.$toast.success("Đặt hàng thất bại");
            }
          })
          .catch((err) => {
            console.log(err);
            this.$toast.error("Có lỗi xảy ra");
          });
      } else {
        axios
          .post(ApiOrder.insertOrderDetail(), orderParam)
          .then((res) => {
            // console.log(res);
            if (res.status == 201) {
              alert("Đơn hàng đã được đặt thành công");
              let listProduct = JSON.parse(orderParam.orderdetail);
              let productListHtml = "";
              console.log(listProduct);
              listProduct.forEach((item) => {
                // Do something with each item in the array
                productListHtml += `<tr>
                                        <td>${item.productName}</td>
                                        <td>${formatMoney(item.price)}</td>
                                        <td>${item.quantitys}</td>
                                        <td>${formatMoney(
                  item.price * item.quantitys
                )}</td>
                                    </tr>`;
              });
              // console.log(productListHtml);
              this.sendEmail(res.data, productListHtml);
              this.$router.push("/order");
              this.$toast.success("Đặt hàng thành công");
              this.$toast.success("Email được gửi thành công");
            } else {
              alert("Có lỗi xảy ra");
              this.$toast.success("Đặt hàng thất bại");
            }
          })
          .catch((err) => {
            console.log(err);
            this.$toast.error("Có lỗi xảy ra");
          });
      }
    },

    /**\
     * Chuẩn bị dữ liệu trước khi đặt hàng
     */
    prepareBeforeHandle() {
      this.customerInfo["orderCode"] = "";
      this.customerInfo["orderDate"] = new Date();
      this.customerInfo["idUser"] = this.userID;
      this.customerInfo["fullName"] = this.fullName;
      this.customerInfo["address"] = this.address;
      this.customerInfo["phoneNumber"] = this.phoneNumber;
      this.customerInfo["description"] = this.description;
      this.customerInfo["totalAmount"] = this.totalAmount;
      this.customerInfo["statusOrders"] = 2; // chờ tiếp nhận
      this.customerInfo["checkOutTypeID"] = this.checkOutTypeID; // Thanh toán tại nhà
      this.customerInfo["CheckOutStatusID"] = 2; // Chưa thanh toán

      if (this.totalProduct == 0) {
        let text = `Không có sản phẩm nào ở giỏ hàng vui lòng chọn tiếp tục mua sắm!Bạn có muốn chuyển hướng về trang chủ không`;
        if (confirm(text) == true) {
          this.$router.push("/");
          return;
        }
      }
      // this.customerInfo["totalprice"] = this.totalAmount;
      // Xử lý danh sách các hàng hóa mua
      // console.log(this.customerInfo);
      // Xử lý danh sách các hàng hóa mua
      this.listOrderDetail = this.listCart.map((x) => ({
        idOrderDetail: "",
        price: x.price,
        productCode: x.productCode,
        productID: x.productID,
        productName: x.productName,
        quantitys: parseInt(x.quantitys),
      }));
      // console.log(this.listOrderDetail);
    },
  },
  created() {
    this.showLoading = true;
    const id = localStorage.getItem("UserID");
    setTimeout(() => {
      this.showLoading = false;
      axios.get(ApiUser.getUserById(id)).then((res) => {
        if (res.status == 200) {
          this.user = res.data;
          // console.log(this.user);
          this.userID = this.user.userID;
          this.fullName = this.user.fullName;
          this.address = this.user.address;
          this.email = this.user.email;
          console.log(this.email);
          this.phoneNumber = this.user.phoneNumber;
        }
      });
      this.listCart = this.$store.state.cart.items;
    }, 500);
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {
    checkOutTypeID(newVal) {
      this.checkOutTypeID = newVal;
      // if (newVal == 1) {
      //     this.showPayVnPay = true;
      // } else {
      //     this.showPayVnPay = false;
      // }
    },

    totalProduct(newVal) {
      if (this.totalProduct == 0) {
        alert("Không có sản phẩm ở giỏ hàng");
        this.showDatHang = false;
      } else {
        this.showDatHang = true;
      }
    },
  },
  computed: {
    totalAmount() {
      return this.$store.state.cart.items.reduce(
        (total, item) => total + item.price * item.quantitys,
        0
      );
    },

    totalProduct() {
      return this.$store.state.cart.items.length;
    },
  },
};
</script>
  
<style>
@import url(../../css/purcharse.css);
</style>