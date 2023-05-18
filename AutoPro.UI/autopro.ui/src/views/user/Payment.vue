<template>
  <div class="help-payment">
    <MLoading v-if="showLoading"></MLoading>
    <div class="title-help-payment" style="font-weight: 600;">PHƯƠNG THỨC THANH TOÁN</div>
    <div class="content-help-payment">
      <p>Áp dụng thanh toán bằng tiền mặt hoặc chuyển khoản qua hệ thống ngân hàng.</p>
      <p>Tại khu vực thành phố Hà Nội áp dụng thanh toán tiền mặt 100% kể từ khi nhận hàng.</p>
      <p>
        Các tỉnh thành khác vui lòng thanh toán chuyển khoản qua ngân hàng 30% đến 100% giá trị hàng hóa kể từ khi đặt
        hàng.
        Số tiền còn lại khách hàng có thể khi nhận hàng sẽ thanh toán số tiền còn lại cho bên vận chuyển thu hộ.Hoặc có
        thể
        chuyển khoản số tiền còn lại qua tài khoản ngân hàng trước khi HaUI chuyển hàng, mọi hàng hoá không đạt tiêu
        chuẩn,
        chất lượng yêu cầu HaUI sẽ hoàn trả 100% số tiền khách hàng đã chuyển.
      </p>
      <p style="font-weight: 600; font-size: 14px;">Quý khách thanh toán qua ngân hàng, vui lòng chuyển tiền đến tài khoản
        của chúng tôi theo thông tin dưới đây:</p>
      <div class="card-payment">
        <div class="image-card">
          <img src="../../assets/Image/bank-agribank.png" alt="">
        </div>
        <div class="text-card">
          <p style="margin-top: 8px;">Ngân Hàng Nông nghiệp và phát triển Nông thôn Việt Nam (Agribank) - Chi nhánh Tây Hồ
            - Hà Nội</p>
          <p>Tên tài khoản : Nguyễn Thành Đạt</p>
          <p>Số tài khoản : 0335147831</p>
        </div>
      </div>
      <div class="card-payment">
        <div class="image-card">
          <img src="../../assets/Image/bank-vietcombank.jpg" alt="">
        </div>
        <div class="text-card">
          <p style="margin-top: 8px;">Ngân hàng thương mại cổ phần Ngoại thương Việt Nam Vietcombank – Chi nhánh Hà Nội
          </p>
          <p>Tên tài khoản : Nguyễn Thành Đạt</p>
          <p>Số tài khoản : 0335147831</p>
        </div>
      </div>
      <div class="card-payment">
        <div class="image-card">
          <img src="../../assets/Image/bank-techcombank.png" alt="">
        </div>
        <div class="text-card">
          <p style="margin-top: 8px;">Ngân hàng Thương mại Cổ phần Kỹ Thương Việt Nam Techcombank – Chi nhánh Cầu Giấy- Hà
            Nội</p>
          <p>Tên tài khoản : Nguyễn Thành Đạt</p>
          <p>Số tài khoản : 0335147831</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import MLoading from '@/components/MLoading.vue';

export default {
  /**
   * Tên component
   */
  name: "Payment",
  /**
   * Hứng nhận
   */
  props: [""],
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
      showLoading: false
    };
  },
  /**
   * Phương thức
   */
  methods: {},
  created() {
    this.showLoading = true;
    setTimeout(async () => {
      this.showLoading = false;
    }, 500);
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {}
};
</script>

<style>
@import url(../../css/help.css);
</style>