<template>
    <div>
        <TheHeader></TheHeader>
        <TheNavbar></TheNavbar>
        <div class="content" id="main">
            <TheLineLink name="Thông tin cá nhân" :detail="'/ ' + this.userDetail.fullName"></TheLineLink>
            <div class="details-form-user">
                <div class="details-header">
                    <div>Thông tin cá nhân</div>
                </div>
                <div class="details-form-input">
                    <div>
                        <div class="details-user-firstname">
                            <div class="details-text">Tài khoản :</div>
                            <MInput type="text" v-model="this.userDetail.account" ref="account"
                                messError="Tài khoản không được bỏ trống"
                                styleInput="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="details-user-firstname">
                            <div class="details-text">Họ :</div>
                            <MInput type="text" v-model="this.userDetail.firstName" ref="firstName"
                                messError="Họ không được bỏ trống"
                                styleInput="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="details-user-lastname">
                            <div class="details-text">Tên :</div>
                            <MInput type="text" v-model="this.userDetail.lastName" ref="lastName"
                                messError="Tên không được bỏ trống"
                                styleInput="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="details-user-fullName">
                            <div class="details-text">Họ và tên :</div>
                            <MInput type="text" v-model="this.userDetail.fullName" ref="fullName"
                                messError="Họ và tên không được bỏ trống"
                                styleInput="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="details-user-address">
                            <div class="details-text">Địa chỉ :</div>
                            <MInput type="text" v-model="this.userDetail.address" ref="address"
                                messError="Địa chỉ không được bỏ trống"
                                styleInput="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="details-user-birth">
                            <div class="details-text">Ngày sinh :</div>
                            <MDatePicker v-model="this.userDetail.dateOfBirth" ref="dateOfBirth"
                                styleVal="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MDatePicker>
                        </div>
                        <div class="details-user-gender">
                            <div class="details-text">Giới tính :</div>
                            <MRadio :data="[
                                { Gender: 'Nam', GenderValue: 0 },
                                { Gender: 'Nữ', GenderValue: 1 },
                                { Gender: 'Khác', GenderValue: 2 },
                            ]" v-model="this.userDetail.gender"></MRadio>
                        </div>
                        <div class="details-user-firstname">
                            <div class="details-text">Email :</div>
                            <MInput type="text" v-model="this.userDetail.email" ref="email"
                                messError="Email không được bỏ trống"
                                styleInput="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                        <div class="details-user-firstname">
                            <div class="details-text">Số điện thoại :</div>
                            <MInput type="text" v-model="this.userDetail.phoneNumber" ref="phoneNumber"
                                messError="Số điện thoại không được bỏ trống"
                                styleInput="width: 600px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                            </MInput>
                        </div>
                    </div>
                    <div class="udetails-user-firstname">
                        <img :class="{ 'ImageNone': ImageNone }" :src="srcImage" alt=""
                            style="height: 200px;width: 200px;display: none;border: 1px solid #bbb;margin-left: 150px;margin-bottom: 30px;border-radius:50%;">
                        <div class="aco1-image-file" style="padding-left: 50px;">
                            <input type="file" ref="fileInput" @change="handleFileUpload()" />
                        </div>
                        <MInput type="text" v-model="this.userDetail.image"
                            styleInput="width: 900px; height: 30px;display:none">
                        </MInput>
                    </div>

                </div>
            </div>
            <div class="details-user-update" @click="save(userDetail)">
                <button>Lưu</button>
            </div>
        </div>
        <TheFooter></TheFooter>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
import MInput from '@/components/MInput.vue';
import TheFooter from '@/layout/TheFooter.vue';
import TheHeader from '@/layout/TheHeader.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import axios from 'axios';
import ApiUser from '../../js/apiUser';
import MLoading from '@/components/MLoading.vue';
import MDatePicker from '@/components/MDatePicker.vue';
import MRadio from '@/components/MRadio.vue';
import {
    getDownloadURL,
    getStorage,
    ref,
    uploadBytesResumable,
} from "firebase/storage";
export default {
    /**
     * Tên component
     */
    name: 'DetailsUser',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, TheFooter, TheLineLink, MInput, MLoading, MDatePicker, MRadio },
    /**
     * Emit sự thay đổi
     */
    emits: ["clickInfo"],
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            userDetail: {
                account: "",
                firstName: "",
                lastName: "",
                fullName: "",
                address: "",
                email: "",
                phoneNumber: "",
            },
            showLoading: false,
            title: '',
            srcImage: "",
            ImageNone: false,
            id: '',
        }
    },
    /**
     * Phương thức
     */
    methods: {
        questionSaveItem(item) {
            let text = `Bạn có muốn lưu tài khoản ${item.account} không ?`;
            if (confirm(text) == true) {
                this.saveUser();
            } else {
                // this.$emit("onClose");
            }
        },

        async handleFileUpload() {
            //   const storageRef = ref(storage, "user/" + this.file.name);
            //   console.log(this.$refs.fileInput.files[0]);
            //   uploadBytes(storageRef,this.$refs.fileInput.files[0])
            //   .then((snapshot) => {
            //     console.log("ok");
            //   });
            let file = this.$refs.fileInput.files[0];
            const storage = getStorage();
            //   const metadata = {
            //     contentType: "image/jpeg/png",
            //   };
            const storageRef = ref(storage, "Users/" + file.name);
            const uploadTask = uploadBytesResumable(
                storageRef,
                this.$refs.fileInput.files[0]
                // metadata
            );

            uploadTask.on(
                "state_changed",
                (snapshot) => {
                    // console.log(snapshot);
                    let process = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    // console.log(process);
                    if (process == 100) {
                        console.log("tải ảnh lên thành công");
                    }
                },
                (error) => {
                    console.log(error);
                    alert("Tải ảnh lỗi");
                },
                () => {
                    // uploadTask.pause();
                    // Handle successful uploads on complete
                    // For instance, get the download URL: https://firebasestorage.googleapis.com/...
                    getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
                        // console.log(downloadURL);
                        this.srcImage = downloadURL;
                        this.ImageNone = true;
                        this.userDetail.image = downloadURL;
                        alert("Đã tải ảnh xong");
                    });
                }
            );
        },
        validateForm() {
            let validate = true;
            if (this.userDetail.account.trim().length <= 0) {
                this.$refs.account.validate();
                validate = false;
            }
            if (this.userDetail.firstName.trim().length <= 0) {
                this.$refs.firstName.validate();
                validate = false;
            }
            if (this.userDetail.lastName.trim().length <= 0) {
                this.$refs.lastName.validate();
                validate = false;
            }
            if (this.userDetail.fullName.trim().length <= 0) {
                this.$refs.fullName.validate();
                validate = false;
            }
            if (this.userDetail.address.trim().length <= 0) {
                this.$refs.address.validate();
                validate = false;
            }
            if (this.userDetail.email.trim().length <= 0) {
                this.$refs.email.validate();
                validate = false;
            }
            if (this.userDetail.phoneNumber.trim().length <= 0) {
                this.$refs.phoneNumber.validate();
                validate = false;
            }
            return validate;
        },

        save(data) {
            if (!this.validateForm()) {
                alert("Bạn đã nhập thiếu thông tin")
            } else {
                this.questionSaveItem(data);
            }
        },
        async saveUser() {
            if (!this.validateForm()) {
                alert("Bạn đã nhập thiếu thông tin");
            } else {
                this.userDetail.image = this.srcImage;
                await axios.put(ApiUser.updateUser(this.id), this.userDetail)
                    .then((res) => {
                        if (res.status == 200) {
                            alert("Sửa thành công");
                            this.$router.push('/');
                            this.$toast.success("Cập nhật thành công")
                        }
                    })
                    .catch((err) => {
                        console.log(err);
                        if (err.response.status == 400) {
                            this.$toast.error("Tên tài khoản hoặc email đã tồn tại");
                        } else {
                            this.$toast.error("Cập nhật thất bại");
                        }
                    })
            }
        }
    },
    created() {
        this.showLoading = true;
        const userID = localStorage.getItem("UserID");
        this.id = userID;
        setTimeout(() => {
            axios.get(ApiUser.getUserById(userID))
                .then((res) => {
                    if (res.status == 200) {
                        this.showLoading = false;
                        this.userDetail = res.data;
                        this.srcImage = res.data.image;
                        console.log(this.srcImage);
                        if (this.srcImage) {
                            this.ImageNone = true;
                        }
                    } else if (res.status == 400) {
                        console.log(res.moreInfo);
                    }
                })
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
@import url(../../css/detailsuser.css);
</style>