<template>
    <div>
        <select v-model="value" style="height: 36px;width: 100px;margin: 0 10px;border: 1px solid #bbb;border-radius: 4px;">
            <option v-for="year in years" :key="year" :value="year">{{ year }}</option>
        </select>
    </div>
</template>
  
<script>
export default {
    props: ["modelValue"],
    emits: ["update:modelValue"],
    created() {
        this.value = this.modelValue;
    },
    watch: {
        modelValue(newVal) {
            this.$emit("update:modelValue", newVal);
        },
        value(newVal) {
            this.$emit("update:modelValue", newVal);
        }
    },
    data() {
        return {
            years: [],
            value: '',
        };
    },
    mounted() {
        const currentYear = new Date().getFullYear();
        const years = [];
        for (let i = currentYear; i >= 1900; i--) {
            years.push(i);
        }
        this.years = years;
    },
};
</script>
  