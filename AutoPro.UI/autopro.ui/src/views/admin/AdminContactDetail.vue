<template>
    <div class="aform-detail">
        <div class="aform-account">
            <div class="aform-title">
                <div class="aform-title-left">
                    {{ this.title }}
                </div>
                <div class="onClose" @click="onClose">
                    <i class="fa-regular fa-circle-xmark"></i>
                </div>
            </div>
            <div class="agroup1">
                <div class="acol1">
                    <div class="acol1-text">
                        Người gửi :
                    </div>
                    <MInput type="text" v-model="contact.contactName"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol2">
                    <div class="acol2-text">
                        Email :
                    </div>
                    <MInput type="text" v-model="contact.contactEmail"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1">
                <div class="acol1">
                    <div class="acol1-text">
                        Số điện thoại :
                    </div>
                    <MInput type="text" v-model="contact.contactPhone"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol2">
                    <div class="acol2-text">
                        Mô tả :
                    </div>
                    <MInput type="text" v-model="contact.contactContent"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
            </div>
            <div class="aformSave" @click="questionSaveItem(contact)">
                <button>Lưu</button>
            </div>
        </div>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
import MInput from '@/components/MInput.vue';
import Resource from '../../js/gResource';
import axios from 'axios';
import ApiBrand from '../../js/apiBrand';
import {
    getDownloadURL,
    getStorage,
    ref,
    uploadBytesResumable,
} from "firebase/storage";
import MLoading from '@/components/MLoading.vue';
import ApiContact from '../../js/apiContact';
export default {
    /**
     * Tên component
     */
    name: "AdminContactDetail",
    /**
     * Hứng nhận
     */
    props: ["id", "type"],
    /**
     * Component được sử dụng
     */
    components: { MInput, MLoading },
    /**
     * Emit sự thay đổi
     */
    emits: ["onClose", "success"],
    directives: {},
    /**
     * Data
     */
    data() {
        return {
            contact: {},
            showLoading: false,
            title: '',
        };
    },
    /**
     * Phương thức
     */
    methods: {
        questionSaveItem(item) {
            let text = `Bạn có muốn lưu liên hệ này không ?`;
            if (confirm(text) == true) {
                this.saveContact();
            } else {
                this.$emit("onClose");
            }
        },

        onClose() {
            // uploadTask.cancel();
            this.$emit("onClose");
        },

        async saveContact() {
            if (this.type == Resource.FormAdminType.Add) {
                await axios.post(ApiContact.addContact(), this.contact)
                    .then((res) => {
                        if (res.status == 201) {
                            this.$toast.success("Tạo thành công");
                            this.$emit("onClose");
                            this.$emit("success");
                        }
                    })
                    .catch((err) => {
                        this.$toast.error("Tạo thất bại");
                        console.log(err);
                    })
            } else {
                await axios.put(ApiContact.updateContact(this.id), this.contact)
                    .then((res) => {
                        if (res.status == 200) {
                            this.$toast.success("Cập nhật thành công");
                            this.$emit("success");
                            this.$emit("onClose");
                        }
                    })
                    .catch((err) => {
                        this.$toast.error("Cập nhật thất bại");
                        console.log(err);
                    })
            }
        }
    },
    created() {
        if (this.id) {
            // Bật loadding
            this.showLoading = true;
            setTimeout(() => {
                this.title = Resource.TitleFormAdmin.UpdateAccount;
                //Lấy dữ liệu
                axios.get(ApiContact.getContactByID(this.id))
                    .then((res) => {
                        this.showLoading = false;
                        this.contact = res.data;
                        // this.srcImage = res.data.image;
                        // this.ImageNone = true;
                        // console.log(this.srcImage);
                    })
            }, 500)
        } else {
            this.title = Resource.TitleFormAdmin.AddAccount;
        }
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {},
};
</script>
  
<style>
@import url(../../css/admin/adminaccount.css);
</style>