<template>
  <div class="number">
    <i class="fa-solid fa-minus" @click="minusQuantity"></i>
    <input class="m-input" style="width: 80px; border-radius: 0px" v-model="value" @input="onInput" />
    <i class="fa-solid fa-plus" @click="addQuantity"></i>
  </div>
</template>
  
<script>
export default {
  /**
   * Tên component
   */
  name: "MQuantity",
  /**
   * Hứng nhận
   */
  props: {
    modelValue: Number,
    quantity: Number,
  },
  /**
   * Component được sử dụng
   */
  components: {},
  /**
   * Emit sự thay đổi
   */
  emits: ["update:modelValue"],
  directives: {},
  /**
   * Data
   */
  data() {
    return {
      value: "",
      quantityHave: 0,
    };
  },
  /**
   * Phương thức
   */
  methods: {
    minusQuantity() {
      let number = parseInt(this.value);
      number -= parseInt(1);
      this.$emit("update:modelValue", number);
    },

    addQuantity() {
      let number = parseInt(this.value);
      number += parseInt(1);
      this.$emit("update:modelValue", number);
    },

    onInput() {
      let paValue = this.value;
      let paModelValue = this.modelValue;
      if (isNaN(paValue) || isNaN(paModelValue)) {
        alert("Định dạng số lượng bạn nhập vào không đúng dịnh dạng số");
        this.$emit("update:modelValue", 1)
      }
    }
  },
  created() {
    this.value = this.modelValue;
    this.quantityHave = this.quantity;
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {
    value(newVal) {
      if (newVal <= 0) {
        alert("Số lượng nhập phải lớn hơn 0");
        this.$emit("update:modelValue", 1);
      } else if (newVal > this.quantityHave) {
        alert(
          `Số lượng có trong kho là: ${this.quantityHave} .Bạn đã nhập lớn hơn số lượng có trong kho`
        );
        this.value = 1;
        this.$emit("update:modelValue", 1);
      } else {
        this.$emit("update:modelValue", newVal);
      }
    },
    modelValue(newVal) {
      if (newVal <= 0) {
        alert("Số lượng nhập phải lớn hơn 0");
        this.$emit("update:modelValue", 1);
      } else if (newVal > this.quantityHave) {
        alert(
          `Số lượng có trong kho là: ${this.quantityHave} .Bạn đã nhập lớn hơn số lượng có trong kho`
        );
        this.value = 1;
        this.$emit("update:modelValue", 1);
      } else {
        this.value = newVal;
      }

      // this.$emit("update:modelValue", newVal);
    },
  },
};
</script>
  
<style>
@import url(../css/components/input.css);
</style>