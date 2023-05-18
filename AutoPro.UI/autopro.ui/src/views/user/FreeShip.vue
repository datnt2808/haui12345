<template>
    <div class="help-freeship">
        <MLoading v-if="showLoading"></MLoading>
        <div class="title-help-freeship" style="font-weight: 600;">Miễn phí vận chuyển - Free Shipping
        </div>
        <div class="content-help-freeship">
            <p>Cước phí vận chuyển:</p>
            <p style="padding-left: 20px;">Đối với khu vực nội thành Hà Nội:</p>
            <p style="padding-left: 20px;">HaUI sẽ Free ship cho tất cả các đơn hàng trong nội thành Hà Nội </p>
            <p>Đối với các khu vực khác:</p>
            <p style="padding-left: 20px;">Khách hàng có thế chọn phương thức hoặc đơn vị vận chuyển theo ý của mình, có thể
                gửi hoả tốc máy bay, chuyển
                phát nhanh, gửi 48 giờ, gửi chậm, gửi đường sắt, ô tô..</p>
            <p style="font-weight: 600;">Hệ thống quản lý đồng phục HaUI</p>
            <p>Địa chỉ: Số 298 đường Cầu Diễn, quận Bắc Từ Liêm, thành phố Hà Nội.  </p>
            <p>Điện thoại: 0915.76.5555 - 0961.399.499 - 0942.399.366</p>
        </div>
    </div>
</template>

<script>
import MLoading from '@/components/MLoading.vue';

export default {
    /**
     * Tên component
     */
    name: 'FreeShip',
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
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            showLoading: false
        }
    },
    /**
     * Phương thức
     */
    methods: {

    },
    created() {
        this.showLoading = true;
        setTimeout(async () => {
            this.showLoading = false;
        }, 500);
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>

<style></style>