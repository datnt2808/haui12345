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
            <div class="agroup1" style="padding: 0 20px;">
                <div class="acol12" style="margin: 15px 0;">
                    <div class="acol2-text">
                        Tài khoản :
                    </div>
                    <MInput type="text" v-model="user.account" ref="account" messError="Tài khoản không được bỏ trống"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput>
                </div>
                <div class="acol11" style="margin:15px 0">
                    <div class="acol1-text">
                        Email :
                    </div>
                    <MInput type="text" v-model="user.email" ref="email" messError="Email không được bỏ trống"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput>
                </div>
                <div class="acol12" style="margin: 15px 0;">
                    <div class="acol2-text">
                        Điện thoại :
                    </div>
                    <MInput type="text" v-model="user.phoneNumber" ref="phoneNumber"
                        messError="Số điện thoại không được bỏ trống"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1" style="padding: 0 20px;">
                <div class="acol11" style="margin:15px 0">
                    <div class="acol1-text">
                        Họ :
                    </div>
                    <MInput type="text" v-model="user.firstName" ref="firstName" messError="Họ không được bỏ trống"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput>
                </div>
                <div class="acol12" style="margin: 15px 0;">
                    <div class="acol2-text">
                        Tên :
                    </div>
                    <MInput type="text" v-model="user.lastName" ref="lastName" messError="Tên không được bỏ trống"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput>
                </div>
                <div class="acol11" style="margin:15px 0">
                    <div class="acol1-text">
                        Họ và tên :
                    </div>
                    <MInput type="text" v-model="user.fullName" ref="fullName" messError="Họ và tên không được bỏ trống"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1" style="padding: 0 20px;">
                <div class="acol11" style="margin:15px 0">
                    <div class="acol1-text">
                        Ngày sinh :
                    </div>
                    <MDatePicker v-model="user.dateOfBirth" ref="dateOfBirth"
                        styleVal="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MDatePicker>
                </div>
                <div class="acol12" style="margin: 15px 0;">
                    <div class="acol2-text">
                        Giới tính :
                    </div>
                    <MRadio :data="[
                        { Gender: 'Nam', GenderValue: 0 },
                        { Gender: 'Nữ', GenderValue: 1 },
                        { Gender: 'Khác', GenderValue: 2 },
                    ]" v-model="user.gender"></MRadio>
                    <!-- <MInput type="text" v-model="user.gender"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput> -->
                </div>
                <div class="acol11" style="margin:15px 0">
                    <div class="acol1-text">
                        Địa chỉ :
                    </div>
                    <MInput type="text" v-model="user.address" ref="address" messError="Địa chỉ không được bỏ trống"
                        styleInput="width: calc(250px); height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;margin-right:15px;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1image">
                <div class="acol1-image">
                    <div class="aco1-image-file">
                        <div class="acol1-text">
                            Hình ảnh :
                        </div>
                        <input type="file" ref="fileInput" @change="handleFileUpload()" />
                    </div>
                    <img :class="{ 'ImageNone': ImageNone }" :src="srcImage" alt=""
                        style="height: 100px;width: 100px;display: none;border: 1px solid #bbb;margin-left: 150px;margin-top: 10px;">
                </div>
            </div>
            <div class="acol2-link">
                <div class="acol1-text" style="width: 150px;display: none;">
                    Linh đường dẫn :
                </div>
                <MInput type="text" v-model="user.image" styleInput="display:none;width: 900px; height: 30px;">
                </MInput>
            </div>
            <div class="aformSave" @click="updateAdmin(user)">
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
import ApiUser from '@/js/apiUser';
import {
    getDownloadURL,
    getStorage,
    ref,
    uploadBytesResumable,
} from "firebase/storage";
import MLoading from '@/components/MLoading.vue';
import MDatePicker from '@/components/MDatePicker.vue';
import MRadio from '@/components/MRadio.vue';
export default {
    /**
     * Tên component
     */
    name: "AdminInfo",
    /**
     * Hứng nhận
     */
    props: ["id"],
    /**
     * Component được sử dụng
     */
    components: { MInput, MLoading, MDatePicker, MRadio },
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
            showLoading: false,
            user: {
                account: "",
                firstName: "",
                lastName: "",
                fullName: "",
                address: "",
                email: "",
                phoneNumber: "",
            },
            title: '',
            srcImage: "",
            ImageNone: false
        };
    },
    /**
     * Phương thức
     */
    methods: {
        questionSaveItem(item) {
            let text = `Bạn có muốn lưu tài khoản ${item.account} không ?`;
            if (confirm(text) == true) {
                this.saveAdmin();
            } else {
                this.$emit("onClose");
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
                        this.user.image = downloadURL;
                        alert("Đã tải ảnh xong");
                    });
                }
            );
        },
        onClose() {
            // uploadTask.cancel();
            this.$emit("onClose");
        },

        formatDate(datetime) {
            try {
                return formatDate(datetime);
            } catch (error) {
                console.log(error);
            }
        },

        validateForm() {
            let validate = true;
            if (this.user.account.trim().length <= 0) {
                this.$refs.account.validate();
                validate = false;
            }
            if (this.user.firstName.trim().length <= 0) {
                this.$refs.firstName.validate();
                validate = false;
            }
            if (this.user.lastName.trim().length <= 0) {
                this.$refs.lastName.validate();
                validate = false;
            }
            if (this.user.fullName.trim().length <= 0) {
                this.$refs.fullName.validate();
                validate = false;
            }
            if (this.user.address.trim().length <= 0) {
                this.$refs.address.validate();
                validate = false;
            }
            if (this.user.email.trim().length <= 0) {
                this.$refs.email.validate();
                validate = false;
            }
            if (this.user.phoneNumber.trim().length <= 0) {
                this.$refs.phoneNumber.validate();
                validate = false;
            }
            return validate;
        },
        updateAdmin(data) {
            if (!this.validateForm()) {
                alert("Bạn đã nhập thiếu thông tin");
            } else {
                this.questionSaveItem(data);
            }
        },

        async saveAdmin() {
            this.showLoading = true;
            setTimeout(async () => {
                this.user.image = this.srcImage;
                await axios.put(ApiUser.updateAdmin(this.id), this.user)
                    .then((res) => {
                        this.showLoading = false;
                        if (res.status == 200) {
                            this.$emit("success");
                            this.$emit("onClose");
                        }
                    })
                    .catch((err) => {
                        this.showLoading = false;
                        console.log(err);
                        if (err.response.status == 400) {
                            this.$toast.error("Tên tài khoản hoặc email đã tồn tại");
                        } else {
                            this.$toast.error("Cập nhật thất bại");
                        }
                    })
            }, 500)
        }
    },
    created() {
        this.srcImage = "";
        // Khởi tạo lấy giá trị id truyền vào
        if (this.id) {
            // Bật loadding
            this.showLoading = true;
            setTimeout(() => {
                this.title = Resource.InfoUser.Admin;
                //Lấy dữ liệu
                axios.get(ApiUser.getUserById(this.id))
                    .then((res) => {
                        this.showLoading = false;
                        this.user = res.data;
                        // console.log(res);
                        this.srcImage = res.data.image;
                        if (this.srcImage) {
                            this.ImageNone = true;
                        }
                        // console.log(this.srcImage);
                    })
            }, 500)
        }
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {},
};
</script>
  
<style>
@import url(../../css/admin/admininfo.css);
</style>