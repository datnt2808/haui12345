<template>
    <div class="field-input">
        <input class="m-input" type="date" :class="{ 'm-input-error': valRequired }" :style="styleVal" ref="inputFocus"
            @input="onInput" @mouseover="mouseOver" @mouseout="mouseOut" :tabindex="tabIndex" v-model="value" />
        <div v-show="showErorr" class="error-input-alert">
            <p class="error-input-arrow"></p>
            <div class="error-input-content">
                <p>
                    {{ messError }}
                </p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: "MInput",
    data() {
        return {
            value: "", // v-model input
            valRequired: false, // không được bỏ trống dữ liệu
            showErorr: false, // Thông báo lỗi
        };
    },
    props: {
        messError: String, // nội dung lỗi khi validate input
        modelValue: String, // giá trị của input nhậ từ parent
        styleVal: String, // css cho input
        required: Boolean, // bắt buộc phải nhập dữ liệu
        tabIndex: String,
    },
    methods: {
        formatDate(datetime) {
            // eslint-disable-next-line no-undef
            return formatDistanceToNow(new Date(datetime))
        },
        /**
         * Check dữ liệu khi người dùng nhập
        * CreatedBy :Đăng(10/01/2022)
        * EditedBy : Đăng(11/01/2022)
        */
        validate() {
            // Kiểm tra quan tọng nếu nhập lỗi validate thì hiển thị css class input error không thì tắt css error input
            if (this.required) {
                this.valRequired = true;
                this.showErorr = false;
                return {
                    status: false,
                    messError: this.messError,
                };
            } else {
                this.valRequired = false;
                return {
                    status: true,
                };
            }
        },

        /**
         * sự kiện oninput
        * CreatedBy :Đăng(10/01/2022)
        * EditedBy : Đăng(11/01/2022)
        */
        onInput() {
            // Kiểm tra giá trị nhập vào tự input
            this.value = event.target.value;
            // Update giá trị value
            this.$emit("update:modelValue", event.target.value);
            // Không show lỗi
            this.showErorr = false;
            this.valRequired = false;
        },

        /**
         * Show lỗi khi di chuyển chuột vào
        * CreatedBy :Đăng(10/01/2022)
        * EditedBy : Đăng(11/01/2022)
        */
        mouseOver() {
            if (this.valRequired) this.showErorr = true;
        },

        /**
         * Show lỗi khi di chuyển chuột ra
        * CreatedBy :Đăng(10/01/2022)
        * EditedBy : Đăng(11/01/2022)
        */
        mouseOut() {
            this.showErorr = false;
        },

        /**
        * Foocus
        * CreatedBy :Đăng(10/01/2022)
        * EditedBy : Đăng(11/01/2022)
        */
        focusFunc() {
            this.$refs.inputFocus.focus();
        },
    },
    watch: {
        value(newVal) {
            if (newVal) {
                this.value = new Date(newVal).toISOString().split("T")[0];
            } else {
                this.value = '';
            }
        },
        modelValue(newVal) {
            this.value = newVal;
        }
    },
    created() {
        if (this.modelValue) {
            const date = new Date(this.modelValue);
            this.value = new Date(date).toISOString().split("T")[0];
        } else {
            this.value = ``;
        }

    },
    mounted() {
    },
};
</script>
<style scoped>
@import url(../css/components/input.css);
</style>