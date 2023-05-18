<template>
    <div class="aform-detail">
        <div class="aform-account">
            <div class="aform-title">
                <div class="aform-title-left">
                    {{ this.title }}
                </div>
                <div class="onClose" @click="onClose" style="cursor: pointer;">
                    <i class="fa-regular fa-circle-xmark"></i>
                </div>
            </div>
            <div class="login-password" style="max-height: 40px;">
                <div class="text">Mật khẩu cũ :</div>
                <MInput type='text' ref="passwordOld" messError="Mật khẩu cũ không được bỏ trống"
                    styleInput="width: 950px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                    v-model="passwordOld">
                </MInput>
            </div>
            <div class="login-password" style="max-height: 40px;">
                <div class="text">Mật khẩu mới:</div>
                <MInput :type="showPassword3 ? 'text' : 'password'" ref="passwordNew"
                    messError="Mật khẩu mới không được bỏ trống"
                    styleInput="width: 950px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                    v-model="passwordNew">
                </MInput>
                <div class="update-show-password" @click="togglePasswordVisibility">
                    {{ showPassword3 ? 'Ẩn' : 'Hiện' }}
                </div>
            </div>
            <div class="login-password" style="max-height: 40px;">
                <div class="text">Nhập lại mật khẩu mới:</div>
                <MInput :type="showPassword4 ? 'text' : 'password'" ref="confirmPassword"
                    messError="Mật khẩu nhập lại không được bỏ trống"
                    styleInput="width: 950px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                    v-model="confirmPasswordNew">
                </MInput>
                <div class="update-show-password" @click="togglePasswordVisibility2">
                    {{ showPassword4 ? 'Ẩn' : 'Hiện' }}
                </div>
            </div>
            <div class="aformSave">
                <button style="background-color: #206905;margin-left: 40px;color: white;" @click="updatePassword">Cập
                    nhật</button>
            </div>
        </div>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
import MInput from '@/components/MInput.vue';
import MLoading from '@/components/MLoading.vue';
import axios from 'axios';
import Resource from '@/js/gResource';
export default {
    /**
     * Tên component
     */
    name: "OrderDetail",
    /**
     * Hứng nhận
     */
    props: ["id"],
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
            idUser: '',
            passwordOld: '',
            passwordNew: '',
            confirmPasswordNew: '',
            title: '',
            showLoading: false,
            showPassword3: false,
            showPassword4: false,
        };
    },
    /**
     * Phương thức
     */
    methods: {
        questionSaveItem() {
            let text = `Bạn có muốn cập nhật mật khẩu không ?`;
            if (confirm(text) == true) {
                if(this.passwordNew.trim() != this.confirmPasswordNew.trim()){
                    this.$refs.confirmPassword.confirm = true;
                    this.$refs.passwordNew.confirm = true;
                    alert("Mật khẩu nhập lại không khớp");
                    return;
                }else{
                    this.updatePasswordNew();
                }
            } else {
                // this.$emit("onClose");
            }
        },

        onClose() {
            this.$emit("onClose");
        },
        validateForm() {
            let validate = true;
            if (this.passwordOld.trim().length <= 0) {
                this.$refs.passwordOld.validate();
                validate = false;
            }
            if (this.passwordNew.trim().length <= 0) {
                this.$refs.passwordNew.validate();
                validate = false;
            }
            if (this.confirmPasswordNew.trim().length <= 0) {
                this.$refs.confirmPassword.validate();
                validate = false;
            }
            return validate;
        },

        updatePassword() {
            if (!this.validateForm()) {
                alert("Bạn đã nhập thiếu thông tin");
            } else {
                this.questionSaveItem();
            }
        },

        updatePasswordNew() {
            axios.put("https://localhost:7129/api/v1/User/updatePassword", { passold: this.passwordOld, id: this.idUser, passnew: this.passwordNew })
                .then((res) => {
                    console.log(res);
                    if (res.status == 200) {
                        alert("Cập nhật mật khẩu thành công");
                        this.$toast.success("Cập nhật mật khẩu thành công")
                        this.$emit("onClose");
                    }
                })
                .catch((err) => {
                    console.log(err);
                    alert("Cập nhật mật khẩu thất bại");
                    this.$toast.error("Cập nhật mật khẩu thất bại")

                })
        },

        togglePasswordVisibility() {
            this.showPassword3 = !this.showPassword3;
        },

        togglePasswordVisibility2() {
            this.showPassword4 = !this.showPassword4;
        }

    },
    created() {
        let id = localStorage.getItem("UserID");
        this.title = Resource.TitleFormAdmin.updatePassword;
        this.idUser = id;
        if (this.id) {
            // Bật loadding
            setTimeout(() => {
            }, 200)
        }
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        // confirmPasswordNew(newVal) {
        //     console.log(newVal);
        //     console.log('new',this.passwordNew);
        //     if (this.passwordNew.trim() != null && newVal.trim() != null && this.passwordNew != newVal) {
        //         this.$refs.confirmPassword.showError = true;
        //     } else {
        //         this.$refs.confirmPassword.confirm = false;
        //     }
        // }
    },
};
</script>
  
<style>
@import url(../../css/admin/adminaccount.css);
</style>