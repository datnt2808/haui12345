<template>
  <div>
    <div style="height: auto; width: 100%">
      <div
        style="
          margin: 40px auto;
          padding-left: 45%;
          font-size: 20px;
          font-weight: bold;
        "
      >
        Kết quả giao dịch
      </div>
      <div style="margin: 40px auto; padding-left: 40%; font-size: 16px">
        Mã giao dịch : {{ queryPayment.vnp_BankTranNo }}
      </div>
      <div style="margin: 40px auto; padding-left: 40%; font-size: 16px">
        Mã đơn hàng : {{ queryPayment.vnp_OrderInfo }}
      </div>
      <div style="margin: 40px auto; padding-left: 40%; font-size: 16px">
        Ngày giao dịch : {{ queryPayment.vnp_PayDate }}
      </div>
      <div style="margin: 40px auto; padding-left: 40%; font-size: 16px">
        Ngân hàng giao dịch : {{ queryPayment.vnp_BankCode }}
      </div>
      <div style="margin: 40px auto; padding-left: 40%; font-size: 16px">
        Loại giao dịch : {{ queryPayment.vnp_CardType }}
      </div>
      <div style="margin: 40px auto; padding-left: 40%; font-size: 16px">
        Số tiền giao dịch : {{ formatMoney(queryPayment.vnp_Amount / 100) }}
      </div>
      <div
        style="
          margin: 40px auto;
          padding-left: 40%;
          font-size: 18px;
          display: flex;
          align-items: center;
        "
      >
        Trạng thái giao dịch :
        <div style="display: flex;align-items: center;margin-left: 4px;" v-if="queryPayment.vnp_ResponseCode == 0">
          <b style="color: rgb(0, 86, 0)"
            >{{ ketqua(queryPayment.vnp_ResponseCode) }}
          </b>
          <img src="../../assets/Image/checked.png" style="width: 20px;height: 20px; margin-left: 4px;" alt="" />
        </div>
        <div style="display: flex;align-items: center;margin-left: 4px;" v-else>
          <b style="color: rgb(0, 86, 0)"
            >{{ ketqua(queryPayment.vnp_ResponseCode) }}
          </b>
          <img src="../../assets/Image/warning.png" style="width: 20px;height: 20px; margin-left: 4px;" alt="" />
        </div>
      </div>
      <div style="margin: 40px auto; padding-left: 40%; font-size: 18px">
        <p>
          Trang sẽ tự chuyển hướng sau : <b>{{ timeRemaining }}</b> giây
        </p>
      </div>
      <!-- <div style="display: flex;">
                <button style="padding: 5px 20px;border-radius: 4px;border: 1px solid #bbb;margin-left:38%;" @click="continueAction">Tiếp tục thanh toán</button>
                <button style="padding: 5px 20px;border-radius: 4px;border: 1px solid #bbb;margin-left: 20px;padding-left:20px;">Quay lại giỏ hàng</button>
            </div> -->
    </div>
    <MLoading v-if="showLoading"></MLoading>
  </div>
</template>

<script>
import MLoading from "@/components/MLoading.vue";
import { formatMoney, ketquaVNpay } from "@/js/gCommon";
export default {
  /**
   * Tên component
   */
  name: "VNPay",
  /**
   * Hứng nhận
   */
  props: {},
  /**
   * Component được sử dụng
   */
  components: { MLoading },
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
      queryPayment: {},
      redirectTime: 20000,
      vnpaySuccess: "",
      countdown: 20, // Số giây để đếm ngược
      intervalId: null, // Lưu trữ ID của setInterval() để có thể dừng bộ đếm
    };
  },
  /**
   * Phương thức
   */
  methods: {
    formatMoney(money) {
      return formatMoney(money);
    },

    ketqua(state) {
      return ketquaVNpay(state);
    },

    redirect() {
      this.$router.push("/order");
      this.$toast.success("Đặt hàng thành công");
      this.$toast.success("Gửi email thành công");
    },
  },
  created() {
    if (this.$route.query && this.$route.query.vnp_ResponseCode) {
      this.vnpaySucces = this.$route.query.vnp_ResponseCode;
    }
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {
    // vnpaySucces(newVal) {
    //     if (newVal == 0) {
    //         setTimeout(() => {
    //             this.redirect();
    //         }, 20000);
    //     }
    // }
  },
  computed: {
    timeRemaining() {
      // Tính thời gian còn lại từ countdown
      const minutes = Math.floor(this.countdown / 60);
      const seconds = this.countdown % 60;
      return `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
    },
  },
  mounted() {
    const query = this.$route.query;
    this.queryPayment = query;
    console.log(this.queryPayment);
    this.intervalId = setInterval(() => {
      if (this.countdown > 0) {
        this.countdown--;
      } else {
        clearInterval(this.intervalId);
        // Thực hiện hành động khi bộ đếm thời gian đếm ngược kết thúc ở đây
        this.redirect();
      }
    }, 1000);
  },
};
</script>

<style></style>