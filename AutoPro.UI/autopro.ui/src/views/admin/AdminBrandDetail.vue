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
                        Mã nhãn hàng :
                    </div>
                    <MInput type="text" v-model="brand.brandCode" ref="brandCode"
                        messError="Mã nhãn hàng không được bỏ trống"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol2">
                    <div class="acol2-text">
                        Tên nhãn hàng :
                    </div>
                    <MInput type="text" v-model="brand.brandName" ref="brandName"
                        messError="Tên nhãn hàng không được bỏ trống"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1">
                <div class="acol1">
                    <div class="acol1-text">
                        Mô tả :
                    </div>
                    <MInput type="text" v-model="brand.description"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
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
                <MInput type="text" v-model="brand.image" styleInput="width: 900px; height: 30px;display: none;">
                </MInput>
            </div>
            <div class="aformSave" @click="save(brand)">
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
export default {
    /**
     * Tên component
     */
    name: "AdminBrandDetail",
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
            showLoading: false,
            brand: {
                brandCode: "",
                brandName: "",
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
            let text = `Bạn có muốn lưu nhãn hàng "${item.brandName}" không ?`;
            if (confirm(text) == true) {
                this.saveBrand();
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
            const storageRef = ref(storage, "Brand/" + file.name);
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
                        this.ImageNone = true;
                        this.brand.image = downloadURL;
                        this.srcImage = downloadURL;
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
            if (this.brand.brandCode.trim().length <= 0) {
                this.$refs.brandCode.validate();
                validate = false;
            }
            if (this.brand.brandName.trim().length <= 0) {
                this.$refs.brandName.validate();
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
        async saveBrand() {
            if (this.type == Resource.FormAdminType.Add) {
                await axios.post(ApiBrand.addBrand(), this.brand)
                    .then((res) => {
                        if (res.status == 201) {
                            this.$toast.success("Tạo thành công");
                            this.$emit("onClose");
                            this.$emit("success");
                        }
                    })
                    .catch((err) => {
                        console.log(err);
                        if (err.response.status == 400) {
                            this.$toast.error("Mã nhãn hàng đã tồn tại");
                        } else {
                            this.$toast.error("Tạo thất bại");
                        }
                    })
            } else {
                this.brand.image = this.srcImage;
                await axios.put(ApiBrand.updateBrand(this.id), this.brand)
                    .then((res) => {
                        if (res.status == 200) {
                            this.$toast.success("Cập nhật thành công");
                            this.$emit("success");
                            this.$emit("onClose");
                        }
                    })
                    .catch((err) => {
                        console.log(err);
                        if (err.response.status == 400) {
                            this.$toast.error("Mã nhãn hàng đã tồn tại");
                        } else {
                            this.$toast.error("Cập nhật thất bại");
                        }
                    })
            }
        }
    },
    created() {
        this.srcImage = "";
        // Khởi tạo lấy giá trị id truyền vào
        if (this.id) {
            // Bật loadding
            this.showLoading = true;
            setTimeout(() => {
                this.title = Resource.TitleFormAdmin.UpdateBrand;
                //Lấy dữ liệu
                axios.get(ApiBrand.getBrandByID(this.id))
                    .then((res) => {
                        this.showLoading = false;
                        this.brand = res.data;
                        this.srcImage = res.data.image;
                        if (this.srcImage) {
                            this.ImageNone = true;
                        }
                        // console.log(this.srcImage);
                    })
            }, 500)
        } else {
            this.title = Resource.TitleFormAdmin.AddBrand;
        }
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        srcImage(newVal) {
            this.brand.image = newVal;
        }
    },
};
</script>
  
<style>
@import url(../../css/admin/adminaccount.css);
</style>