<template>
    <div>
        <div class="line-footer"></div>
        <div class="footer">
            <div class="footer-left">
                <router-link to="/" style="text-decoration: none;color: black;">
                    <img src="../assets/Image/a1.jpg" style="margin-left: 40px;" alt="">
                    <h6 style="font-weight: 700;">Hệ thống quản lý đồng phục HaUI</h6>
                </router-link>
                <div class="contact">
                    <img src="../assets/Image/CarlsonFacebook.png" alt="">
                    <img src="../assets/Image/icon_twitter_20x20.gif" alt="">
                    <img src="../assets/Image/social-icon-google-plus.png" alt="">
                    <img src="../assets/Image/youtube20.png" alt="">
                </div>
                <div class="certification">
                    <img src="../assets/Image/bct-dathongbao.png" alt="">
                </div>
            </div>
            <div class="footer-right">
                <div class="address-store">
                    <h4>ĐỊA CHỈ </h4>
                    <h6>Cơ sở 1: Số 298 đường Cầu Diễn, quận Bắc Từ Liêm, thành phố Hà Nội.</h6>
                    <h6>Cơ sở 2: Phường Tây Tựu, quận Bắc Từ Liêm, thành phố Hà Nội.</h6>
                    <h6>Cơ sở 3:  Phường Tây Tựu, quận Bắc Từ Liêm, thành phố Hà Nội.</h6>
                    <h6>Điện thoại: 0915.76.5555 - 0355. 999. 336 </h6>
                    <h5> Giấy phép Đăng ký kinh doanh số 0105878779 </h5>
                    <h5>Do sở KHĐT TP.Hà Nội cấp ngày 06/05/2015</h5>
                    <h6> Copyright © 2015 - 2023 HaUI.com</h6>
                </div>
                <div class="sitemap">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.47378845151!2d105.73253187498159!3d21.05373098060188!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345457e292d5bf%3A0x20ac91c94d74439a!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2hp4buHcCBIw6AgTuG7mWk!5e0!3m2!1svi!2s!4v1684167493777!5m2!1svi!2s"
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    /**
       * Tên component
       */
    name: 'TheFooter',
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
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {

        }
    },
    /**
     * Phương thức
     */
    methods: {

    },
    created() {

    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>

<style>
@import url(../css/footer.css);
</style>