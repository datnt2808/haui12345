<template>
  <div>
    <label class="radio-default" v-for="(item, index) in data" :key="index" @keydown="keydown">
      {{ item.Gender }}
      <input type="radio" :value="item.GenderValue" :checked="modelRadioBox == item.GenderValue" v-model="modelRadioBox" :tabindex="tabIndex"/>
      <span class="checkmark-radio"  ></span>
    </label>
  </div>
</template>
<script>
import enumAUTO from '@/js/gEnum';
export default {
  name: "MRadio",
  data() {
    return {
      modelRadioBox: "", // v-model radiobox
    };
  },
  emits: ["update:modelValue"],
  props: {
    data: Array, //Mảng data cho list radiobox
    modelValue: Number, // Giá trị model value nhận từ form
    tabIndex: String,
  },
  watch: {
    modelRadioBox(newVal) {
      this.$emit("update:modelValue", newVal)
    },
    modelValue(newVal) {
      this.modelRadioBox = newVal
    }
  },
  created() {
    this.modelRadioBox = this.modelValue;
  },
  methods: {
    /**
     * Kích enter
     * @param {} event 
     */
    keydown(event) {
      const keyCode = event.keyCode;
      if (keyCode == enumAUTO.KEY_CODE.ENTER) {
        this.$emit("update:modelValue", this.modelRadioBox);
      }
    }

  },
};
</script>
<style scoped>
@import url(../css/components/radio.css);
</style>