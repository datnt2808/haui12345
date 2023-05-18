<template>
  <div>
    <div class="login">
      <img src="../../assets/Image/bglogin.png" alt="" />

      <div class="form-register">
        <div class="title-form">ĐĂNG KÍ</div>
        <div class="form-input">
          <div class="register-account">
            <div class="text">Tên đăng nhập :</div>
            <MInput type="text" v-model="this.user.account" ref="account" messError="Tài khoản không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
          </div>
          <div class="register-account">
            <div class="text">Họ :</div>
            <MInput type="text" v-model="this.user.firstName" ref="firstName" messError="Họ không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
          </div>
          <div class="register-account">
            <div class="text">Tên :</div>
            <MInput type="text" v-model="this.user.lastName" ref="lastName" messError="Tên không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
          </div>
          <div class="register-fullName">
            <div class="text">Họ và tên :</div>
            <MInput type="text" v-model="this.user.fullName" ref="fullName" messError="Họ và tên không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
          </div>
          <div class="register-address">
            <div class="text">Địa chỉ :</div>
            <MInput type="text" v-model="this.user.address" ref="address" messError="Địa chỉ không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
          </div>
          <div class="register-birth">
            <div class="text">Ngày sinh :</div>
            <MDatePicker v-model="this.user.dateOfBirth" ref="dateOfBirth" messError="Tài khoản không được bỏ trống"
              styleVal="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MDatePicker>
          </div>
          <div class="register-address">
            <div class="text">Email :</div>
            <MInput type="text" v-model="this.user.email" ref="email" messError="Email không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
          </div>
          <div class="register-gender">
            <div class="text">Giới tính :</div>
            <div class="gender">
              <MRadio :data="[
                { Gender: 'Nam', GenderValue: 0 },
                { Gender: 'Nữ', GenderValue: 1 },
                { Gender: 'Khác', GenderValue: 2 },
              ]" v-model="this.user.gender"></MRadio>
            </div>
          </div>
          <div class="register-password">
            <div class="text">Mật khẩu :</div>
            <MInput :type="showPassword1 ? 'text' : 'password'" v-model="this.user.password" ref="password"
              messError="Mật khẩu không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
            <div class="register-show-password" @click="showPasswords1">
              {{ showPassword1 ? 'Ẩn' : 'Hiện' }}
            </div>
          </div>
          <div class="register-password">
            <div class="text">Nhập lại mật khẩu :</div>
            <MInput :type="showPassword2 ? 'text' : 'password'" v-model="this.user.password2" ref="password2"
              messError="Mật khẩu không được bỏ trống"
              styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
            </MInput>
            <div class="register-show-password" @click="showPasswords2">
              {{ showPassword2 ? 'Ẩn' : 'Hiện' }}
            </div>
          </div>
          <div class="register-account">
            <img :class="{ 'ImageNone': ImageNone }" :src="srcImage" alt=""
              style="height: 200px;width: 200px;display: none;border: 1px solid #bbb;margin-left: 150px;margin-bottom: 30px;border-radius:50%;">
            <div class="aco1-image-file" style="padding-left: 50px;">
              <input type="file" ref="fileInput" @change="handleFileUpload()" />
            </div>
            <MInput type="text" v-model="this.user.image" styleInput="width: 900px; height: 30px;display:none">
            </MInput>
          </div>
        </div>
        <div class="submit" @click="register">
          <input type="submit" value="Đăng kí" style="padding: 4px" />
        </div>
        <div class="orther">
          <router-link to="/account/sign-up" class="sign-up">Đăng nhập</router-link>
          hoặc
          <router-link to="/account/forgot-password" class="forgot-password">Quên mật khẩu ?</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import TheFooter from "@/layout/TheFooter.vue";
import TheHeader from "@/layout/TheHeader.vue";
import TheNavbar from "@/layout/TheNavbar.vue";
import MInput from "@/components/MInput.vue";
import TheLineLink from "@/layout/TheLineLink.vue";
import axios from "axios";
import { app, storage } from "../../js/firebase";
import {
  getDownloadURL,
  getStorage,
  ref,
  uploadBytes,
  uploadBytesResumable,
} from "firebase/storage";
import MRadio from "@/components/MRadio.vue";
import MDatePicker from "@/components/MDatePicker.vue";
import ApiUser from '../../js/apiUser';
export default {
  /**
   * Tên component
   */
  name: "Register",
  /**
   * Hứng nhận
   */
  props: [""],
  /**
   * Component được sử dụng
   */
  components: { TheHeader, TheNavbar, TheFooter, MInput, TheLineLink, MRadio, MDatePicker },
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
      //   file: null,
      imageUrl: null,
      labelProcess: "",
      showPassword1: false,
      showPassword2: false,
      user: {
        account: "",
        password: "",
        password2: "",
        firstName: "",
        lastName: "",
        fullName: "",
        address: "",
        email: "",
      },
      showLoading: false,
      title: '',
      srcImage: "",
      ImageNone: false,
    };
  },
  /**
   * Phương thức
   */
  methods: {
    handleFileUpload: async function () {
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
          let process = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          // console.log(process);
          this.labelProcess = "Đang tải : " + process + "%";
          if (process == 100) {
            this.labelProcess = "Đã tải xong : " + process + "%";
          }
        },
        (error) => {
          console.log(error);
          alert("Tải ảnh lỗi");
        },
        () => {
          // Handle successful uploads on complete
          // For instance, get the download URL: https://firebasestorage.googleapis.com/...
          getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
            console.log(downloadURL);
          });
          // uploadTask.snapshot.ref.getDownloadURL().then((downloadURL) => {
          //   console.log(downloadURL);
          //   //   this.product.images.push(downloadURL);
          // });
        }
      );
    },
    showPasswords1() {
      this.showPassword1 = !this.showPassword1;
    },
    showPasswords2() {
      this.showPassword2 = !this.showPasswoFrd2;
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
      if (this.user.password.trim().length <= 0) {
        this.$refs.password.validate();
        validate = false;
      }
      if (this.user.password2.trim().length <= 0) {
        this.$refs.password2.validate();
        validate = false;
      }
      return validate;
    },

    register() {
      if (!this.validateForm()) {
        alert("Bạn đã nhập thiếu thông tin");
      } else {
        if (this.user.password != this.user.password2) {
          alert("Mật khẩu nhập lại sai");
        }
        else {
          axios.post(ApiUser.addUser(), this.user)
            .then((res) => {
              if (res.status == 201) {
                alert("Đăng kí thành công");
                this.$router.push('/');
              }
            })
            .catch((err) => {
              console.log(err);
              if (err.response.status == 400) {
                this.$toast.error("Tên tài khoản hoặc email đã tồn tại");
              } else {
                this.$toast.error("Tạo thất bại");
              }
            })
        }
      }
    },
  },
  created() { },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {
  },
};
</script>

<style>
@import url(../../css/form.css);
</style>