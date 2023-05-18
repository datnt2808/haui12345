<template>
  <div class="select-box">
    <div class="select-box-select">
      <input class="select-box-input" readonly v-model="value" @keydown="inputOnKeyDown" />
      <button @click="onShowHideData" @keydown="buttonOnKeyDown">
        <div class="select-box-icon"></div>
      </button>
    </div>
    <div v-show="isShowData" class="selectbox__data" v-clickoutside="hideListData">
      <a class="selectbox__item" v-for="(item, index) in data" :key="index" :value="item.feildValue"
        :class="{ 'item--selectedbox': index == indexItemSelect }" @click="itemOnSelect(item, index)">
        {{ item.feildShow
        }}</a>
    </div>
  </div>
</template>
<script>
import enumAUTO from "@/js/gEnum";
import { clickoutside } from "@/js/gCommon";
export default {
  name: "MSelectBox",
  data() {
    return {
      value: null,
      dataMain: [],
      isShowData: false,
      indexItemSelect: null,
      itemSelected: null,
    };
  },
  directives: {
    clickoutside,
  },
  watch: {
    // Thay đổi giá trị model
    modelValue(newVal) {
      let result = Number.parseFloat(newVal);
      // Kiểm tra giá trị thay đổi có trong data search không
      let data = this.dataMain.find((item) => item.feildValue == result);
      if (data) {
        // Giá trị hiển thị lên bằng tên
        this.value = data.feildShow;
        // Vị trí của nó trong danh sách
        this.indexItemSelect = this.dataMain.indexOf(data);
      }
    },
  },
  props: ["modelValue", "data"],
  created() {
    this.dataMain = this.data;
    let result = this.modelValue;
    let entitySelected = this.dataMain.find(
      (item) => item.feildValue == result
    );
    if (entitySelected) {
      this.value = entitySelected.feildShow;
    } else {
      this.value = "";
    }
  },
  /**
   * Lắng nghe sự kiện computed
   * CreatedBy :Đăng(10/01/2022)
   * EditedBy : Đăng(11/01/2022)
   */
  computed: {
    // trả vị trí của item tìm kiếm được
    findIndexSelected: function () {
      var me = this;
      // Kiểm tra lấy vị trí của nó trong data search có thì return về
      let findIndex = this.dataMain.findIndex(
        (item) => item.feildValue == me.itemSelected.feildValue
      );
      return findIndex;
    },
  },
  methods: {
    // Ẩn hiện data
    onShowHideData() {
      this.isShowData = !this.isShowData;
    },
    /**
     * Lấy item được chọn
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    itemOnSelect(item) {
      var me = this;
      this.itemSelected = item;
      // Set index cuar item duwojc chon
      this.indexItemSelect = me.findIndexSelected; //Lấy tại computed
      // Gán giá trị hiển thị bằng giá trị propName
      this.value = item[this.feildShow];
      // Thực hiện update data khi dữ liệu thay đổi
      this.$emit("update:modelValue", item.feildValue);
      // Ẩn data
      this.isShowData = false;
    },
    /**
     * Ẩn danh sách item
     */
    hideListData() {
      this.isShowData = false;
    },
    /**
     * Lập sự kiện cho input lên xuống
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    inputOnKeyDown(event) {
      const keyCode = event.keyCode;
      switch (keyCode) {
        // Án enter
        case enumAUTO.KEY_CODE.ENTER:
          // Gán giá trị item trên data search
          const item = this.dataMain[this.indexItemSelect];
          this.itemOnSelect(item);
          break;
        case enumAUTO.KEY_CODE.ROW_UP:
          // Hiển thị data
          this.isShowData = true;
          if (this.indexItemSelect > 0) {
            this.indexItemSelect--;
          }
          break;
        case enumAUTO.KEY_CODE.ROW_DOWN:
          // Chạy giá trị xuống dưới
          let maxLength = this.dataMain.length;
          if (this.indexItemSelect < maxLength - 1) {
            this.indexItemSelect++;
          }
          break;
        case enumAUTO.KEY_CODE.TAB:
          this.isShowData = false;
          break;
        default:
          break;
      }
    },
    /**
     * Lập sự kiện cho button
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    buttonOnKeyDown(event) {
      const keyCode = event.keyCode;
      switch (keyCode) {
        // Án enter
        case enumAUTO.KEY_CODE.ENTER:
          // Gán giá trị item trên data search
          const item = this.dataMain[this.indexItemSelect];
          this.itemOnSelect(item);
          setTimeout(() => {
            this.isShowData = false;
          }, 0);
          break;
        case enumAUTO.KEY_CODE.ROW_UP:
          // Hiển thị data
          this.isShowData = true;
          if (this.indexItemSelect > 0) {
            this.indexItemSelect--;
          }
          break;
        case enumAUTO.KEY_CODE.ROW_DOWN:
          // Chạy giá trị xuống dưới
          let maxLength = this.dataMain.length;
          if (this.indexItemSelect < maxLength - 1) {
            this.indexItemSelect++;
          }
          break;
        case enumAUTO.KEY_CODE.TAB:
          this.isShowData = false;
          break;
        default:
          break;
      }
    },
  },
  
};
</script>
<style scoped>
@import url(../css/components/combobox.css);
</style>
