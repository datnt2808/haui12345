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
                <div class="acol11" style="margin: 15px 0;">
                    <div class="acol1-text" style="margin-left: 15px;">
                        Mã sản phẩm :
                    </div>
                    <MInput type="text" v-model="product.productCode" ref="productCode"
                        messError="Mã sản phẩm không được bỏ trống"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol12" style="margin: 15px 0;">
                    <div class="acol2-text" style="margin-left: 15px;">
                        Tên sản phẩm :
                    </div>
                    <MInput type="text" v-model="product.productName" ref="productName"
                        messError="Tên sản phẩm không được bỏ trống"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol11" style="margin: 15px 0;">
                    <div class="acol1-text" style="margin-left: 15px;">
                        Giá :
                    </div>
                    <MInput type="text" v-model="product.price" ref="price" messError="Giá sản phẩm không được bỏ trống"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1" style="padding: 0 20px;">
                <div class="acol11" style="margin: 15px 0;">
                    <div class="acol1-text" style="margin-left: 15px;">
                        Nơi xuất xứ :
                    </div>
                    <MInput type="text" v-model="product.placeOrigin" ref="placeOrigin"
                        messError="Nơi xuất xử không được bỏ trống"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol11" style="margin: 15px 0;">
                    <div class="acol1-text" style="margin-left: 15px;">
                        Số lượng nhập :
                    </div>
                    <MInput type="text" v-model="product.quantity" ref="quantity"
                        messError="Số lượng nhập không được bỏ trống"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol12" style="margin: 15px 0;">
                    <div class="acol2-text" style="margin-left: 15px;">
                        Mô tả :
                    </div>
                    <MInput type="text" v-model="product.description"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1" style="padding:0 20px;">
                <!-- <div class="acol11" style="margin: 15px 0;">
                    <div class="acol1-text" style="margin-left: 15px;">
                        Trạng thái :
                    </div>
                    <MInput type="text" v-model="product.status"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div> -->
                <div class="acol11" style="margin: 15px 0;">
                    <div class="acol1-text" style="margin-left: 15px;">
                        Nhãn hàng :
                    </div>
                    <MCombobox api="https://localhost:7129/api/v1/Brand" v-model="product.brandID" propValue="brandID"
                        propName="brandName" ref="cbxBrand"></MCombobox>
                    <!-- <MInput type="text" v-model="product.brandID"
                        styleInput="width: 250px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput> -->
                </div>
                <div class="acol11" style="margin: 15px 0;">
                    <div class="acol1-text" style="margin-left: 15px;">
                        Danh mục :
                    </div>
                    <MCombobox api="https://localhost:7129/api/v1/ProductCategory" v-model="product.categoryID"
                        propValue="categoryID" propName="categoryName" ref="cbxCategory"></MCombobox>
                </div>
            </div>
            <div class="agroup1image">
                <div class="acol1-image">
                    <div class="aco1-image-file">
                        <div class="acol1-text" style="margin-left: 15px;">
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
                <MInput type="text" v-model="product.image" styleInput="width: 900px; height: 30px;display: none;">
                </MInput>
            </div>
            <div class="aformSave" @click="save(product)">
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
import {
    getDownloadURL,
    getStorage,
    ref,
    uploadBytesResumable,
} from "firebase/storage";
import MLoading from '@/components/MLoading.vue';
import ApiProduct from '../../js/apiProduct';
import MCombobox from '@/components/MCombobox.vue';
export default {
    /**
     * Tên component
     */
    name: "AdminProductDetail",
    /**
     * Hứng nhận
     */
    props: ["id", "type"],
    /**
     * Component được sử dụng
     */
    components: { MInput, MLoading, MCombobox },
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
            product: {
                productCode: "",
                productName: "",
                price: 0,
                placeOrigin: "",
                quantity: "",
            },
            showLoading: false,
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
            let text = `Bạn có muốn lưu sản phẩm ${item.productCode} không ?`;
            if (confirm(text) == true) {
                this.saveProduct();
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
            const storageRef = ref(storage, "Products/" + file.name);
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
                        this.product.image = downloadURL;
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
            if (this.product.productCode.trim().length <= 0) {
                this.$refs.productCode.validate();
                validate = false;
            }
            if (this.product.productName.trim().length <= 0) {
                this.$refs.productName.validate();
                validate = false;
            }
            if (this.product.price <= 0) {
                this.$refs.price.validate();
                validate = false;
            }
            if (this.product.placeOrigin.trim().length <= 0) {
                this.$refs.placeOrigin.validate();
                validate = false;
            }
            if (this.product.quantity <= 0) {
                this.$refs.quantity.validate();
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

        async saveProduct() {
            if (this.type == Resource.FormAdminType.Add) {
                await axios.post(ApiProduct.addProduct(), this.product)
                    .then((res) => {
                        if (res.status == 201) {
                            this.$toast.success("Tạo sẩn phẩm thành công");
                            this.$emit("onClose");
                            this.$emit("success");
                        }
                    })
                    .catch((err) => {
                        console.log(err);
                        if (err.response.status == 400) {
                            this.$toast.error("Mã sản phẩm đã tồn tại");
                        } else {
                            this.$toast.error("Tạo thất bại");
                        }
                    })
            } else {
                this.product.image = this.srcImage;
                await axios.put(ApiProduct.updateProduct(this.id), this.product)
                    .then((res) => {
                        if (res.status == 200) {
                            this.$toast.success("Cập nhật sản phẩm thành công");
                            this.$emit("success");
                            this.$emit("onClose");
                        }
                    })
                    .catch((err) => {
                        console.log(err);
                        if (err.response.status == 400) {
                            this.$toast.error("Mã sản phẩm đã tồn tại");
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
                this.title = Resource.TitleFormAdmin.UpdateProduct;
                //Lấy dữ liệu
                axios.get(ApiProduct.getProductByID(this.id))
                    .then((res) => {
                        this.showLoading = false;
                        this.product = res.data;
                        this.srcImage = res.data.image;
                        if (this.srcImage) {
                            this.ImageNone = true;
                        }
                        // console.log(this.srcImage);
                    })
            }, 500)
        } else {
            this.title = Resource.TitleFormAdmin.AddProduct;
        }
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        srcImage(newVal) {
            this.product.image = newVal;
        }
    },
};
</script>
  
<style>
@import url(../../css/admin/adminaccount.css);
</style>