<template>
    <div>
        <TheHeader></TheHeader>
        <TheNavbar></TheNavbar>
        <div class="content" id="main">
            <MLoading v-if="showLoading"></MLoading>
            <TheLineLink name="Liên hệ"></TheLineLink>
            <div class="content-contact">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.47378845151!2d105.73253187498159!3d21.05373098060188!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345457e292d5bf%3A0x20ac91c94d74439a!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2hp4buHcCBIw6AgTuG7mWk!5e0!3m2!1svi!2s!4v1684167493777!5m2!1svi!2s"
                    width="100%" height="500px" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="contact-email">
                <div>
                    <h6 style="margin-top: 8px;">Liên hệ với chúng tôi</h6>
                    <p> Số 298 đường Cầu Diễn, quận Bắc Từ Liêm, thành phố Hà Nội.</p>
                    <h6>Thời gian làm việc</h6>
                    <p>Từ 8h30 đến 17h30 từ thứ 2 đến thứ 7</p>
                    <h6>Hotline hỗ trợ</h6>
                    <p>0394061318</p>
                </div>
                <div class="form-contact">
                    <div>
                        <h6 style="font-weight: 600;">Email cho chúng tôi</h6>
                        <div class="contact-name">
                            <div class="text">Họ và tên:</div>
                            <MInput type="text" v-model="contact.contactName"
                                styleInput="width: 300px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="contact-email">
                            <div class="text">Email :</div>
                            <MInput type="email" v-model="contact.contactEmail"
                                styleInput="width: 300px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="contact-phone">
                            <div class="text">Số điện thoại:</div>
                            <MInput type="text" v-model="contact.contactPhone"
                                styleInput="width: 300px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                    </div>
                    <div style="margin-top: 26px; padding-left: 8px;">
                        <div class="contact-noidung">
                            <div class="text">Nội dung:</div>
                            <MInput type="text" v-model="contact.contactContent"
                                styleInput="width: 400px; height: 90px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="contact-submit" @click="sendContact">
                            <button>Gửi</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <TheFooter></TheFooter>
    </div>
</template>

<script>

import TheHeader from '@/layout/TheHeader.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import MInput from '@/components/MInput.vue';
import TheFooter from '@/layout/TheFooter.vue';
import MLoading from '@/components/MLoading.vue';
import Resource from '../../js/gResource';
import axios from 'axios';
import { formatDate } from '@/js/gCommon'
import { getStorage, ref, deleteObject } from "firebase/storage";
import ApiContact from '../../js/apiContact';
export default {
    /**
     * Tên component
     */
    name: 'Contact',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, TheLineLink, MInput, TheFooter, MLoading },
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
            showLoading: false,
            contact: {},
        }
    },
    /**
     * Phương thức
     */
    methods: {
        sendContact() {
            this.showLoading = true;
            setTimeout(() => {
                this.showLoading = false;
                axios.post(ApiContact.addContact(), this.contact)
                    .then((res) => {
                        if (res.status == 201) {
                            alert("Gửi thành công");
                            this.contact = {};
                            this.$toast.success("Gửi đơn liên hệ thành công")
                        }
                    })
                    .catch((err) => {
                        this.$toast.error("Gửi đơn liên hệ thất bại")
                        console.log(err);
                    })
            }, 500);
        }
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

<style>
@import url(../../css/contact.css);
</style>