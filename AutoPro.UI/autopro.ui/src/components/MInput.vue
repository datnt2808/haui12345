<template>
    <div>
        <input class="m-input" :type="type" :placeholder="placeholder" :style="styleInput" v-model="value"
            :class="{ 'confirm': confirm }" @input="onInput">
        <div class="under_input" v-show="showError">
            <label for="" style="font-size: 14px;">{{ messError }}</label>
        </div>
    </div>
</template>
  
<script>
export default {
    /**
     * Tên component
     */
    name: 'MInput',
    /**
     * Hứng nhận
     */
    props: ["placeholder", "styleInput", "type", "modelValue", "messError", "required"],
    /**
     * Component được sử dụng
     */
    components: {},
    /**
     * Emit sự thay đổi
     */
    emits: ["update:modelValue"],
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            value: "",
            confirm: false,
            showError: false,
        }
    },
    /**
     * Phương thức
     */
    methods: {
        validate() {
            // if (this.requied) {
            this.showError = true;
            this.confirm = true;
            // }
        },

        onInput() {
            // Kiểm tra giá trị nhập vào tự input
            this.value = event.target.value;
            // Update giá trị value
            this.$emit("update:modelValue", event.target.value);
            // Không show lỗi
            this.showError = false;
            this.confirm = false;
        }
    },
    created() {
        this.value = this.modelValue
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        value(newVal) {
            this.$emit("update:modelValue", newVal);
        },
        modelValue(newVal) {
            this.value = newVal;
            // this.$emit("update:modelValue", newVal);
        }
    }
}
</script>
  
<style>
@import url(../css/components/input.css);
</style>