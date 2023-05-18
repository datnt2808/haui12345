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
                        Mã danh mục :
                    </div>
                    <MInput type="text" v-model="category.categoryCode" ref="categoryCode"
                        messError="Mã danh mục không được bỏ trống"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
                <div class="acol2">
                    <div class="acol2-text">
                        Tên danh mục :
                    </div>
                    <MInput type="text" v-model="category.categoryName" ref="categoryName"
                        messError="Tên danh mục không được bỏ trống"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
            </div>
            <div class="agroup1">
                <div class="acol1">
                    <div class="acol1-text">
                        Mô tả :
                    </div>
                    <MInput type="text" v-model="category.description"
                        styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                    </MInput>
                </div>
            </div>
            <div class="aformSave" @click="save(category)">
                <button>Lưu</button>
            </div>
        </div>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
import MInput from '@/components/MInput.vue';
import MLoading from '@/components/MLoading.vue';
import Resource from '../../js/gResource';
import axios from 'axios';
import ApiProductCategory from '../../js/apiProductCategory';
export default {
    /**
     * Tên component
     */
    name: "AdminCategoryDetail",
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
            category: {
                categoryCode: "",
                categoryName: "",
            },
            title: '',
        };
    },
    /**
     * Phương thức
     */
    methods: {
        questionSaveItem(item) {
            let text = `Bạn có muốn lưu danh mục ${item.categoryCode} không ?`;
            if (confirm(text) == true) {
                this.saveCategory();
            } else {
                this.$emit("onClose");
            }
        },

        onClose() {
            this.$emit("onClose");
        },
        validateForm() {
            let validate = true;
            if (this.category.categoryCode.trim().length <= 0) {
                this.$refs.categoryCode.validate();
                validate = false;
            }
            if (this.category.categoryName.trim().length <= 0) {
                this.$refs.categoryName.validate();
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
        async saveCategory() {
            if (this.type == Resource.FormAdminType.Add) {
                await axios.post(ApiProductCategory.addProductCategory(), this.category)
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
                await axios.put(ApiProductCategory.updateProductCategory(this.id), this.category)
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
                            this.$toast.error("Mã danh mục đã tồn tại");
                        } else {
                            this.$toast.error("Cập nhật danh mục thất bại");
                        }
                    })
            }
        }
    },
    created() {
        // Khởi tạo lấy giá trị id truyền vào
        if (this.id) {
            // Bật loadding
            this.showLoading = true;
            setTimeout(() => {
                this.title = Resource.TitleFormAdmin.UpdateCategory;
                //Lấy dữ liệu
                axios.get(ApiProductCategory.getProductCategoryByID(this.id))
                    .then((res) => {
                        this.showLoading = false;
                        this.category = res.data;
                        // this.srcImage = res.data.image;
                        // this.ImageNone = true;
                        // console.log(this.srcImage);
                    })
            }, 500)
        } else {
            this.title = Resource.TitleFormAdmin.AddCategory;
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