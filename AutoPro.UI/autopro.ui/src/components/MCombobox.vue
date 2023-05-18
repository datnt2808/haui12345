<template>
  <div class="m-combobox" :key="renderCombobox">
    <div ref="combobox" class="field-combobox" @mouseover="mouseOver" @mouseout="mouseOut"
      :class="{ 'select-box-error': isRequired, 'border-green': isShowBoderGreen }">
      <input class="m-inputc" type="text" autocomplete="off" v-model="textSelected" @keydown="inputOnKeyDown"
        @click="onClick" @blur="onBlur" @input="onSearchItem" :tabindex="tabIndex" ref="inputFocus" />
      <button :id="id" class="combobox__button" @click="onShowHideData" @keydown="buttonOnKeyDown"
        :tabindex="tabIndex"></button>
      <div v-show="showError" class="error-selecbox-alert">
        <p class="error-selecbox-arrow"></p>
        <div class="error-selecbox-content">
          <p>
            {{ messError }}
          </p>
        </div>
      </div>
    </div>
    <div v-show="isShowData" class="combobox__data" v-clickoutside="hideListData">
      <a class="combobox__item" :ref="`item_${index}`" :class="{ 'item--selected': index == indexItemSelect }"
        v-for="(entity, index) in entitySearch" :key="index" :value="entity[propValue]"
        @click="itemOnSelect(entity, index)">{{ entity[propName] }}</a>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import enumAUTO from "@/js/gEnum";
import { clickoutside } from "@/js/gCommon";
export default {
  name: "MCombobox",
  props: [
    "id",
    "api",
    "propName",
    "propValue",
    "modelValue",
    "required",
    "messError",
    "tabIndex",
    "focus",
  ],
  directives: {
    clickoutside,
  },
  emits: ["update:modelValue",],
  data() {
    return {
      isShowData: false,
      entities: [],
      entitySearch: [],
      textSelected: null,
      indexItemSelect: 0,
      itemSelected: null,
      isRequired: false, // Trường dữ liệu bắt buộc phải chọn
      showError: false, // Hiển thị box nội dung lỗi
      renderCombobox: 0,
      isShowBoderGreen: false
    };
  },
  /**
   * Lập created cho load api
   * CreatedBy :Đăng(10/01/2022)
   * EditedBy : Đăng(11/01/2022)
   */
  created() {
    this.getData();
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
      let findIndex = this.entitySearch.findIndex(
        (item) => item[me.propValue] == me.itemSelected[me.propValue]
      );
      return findIndex;
    },
  },
  /**
   * Lăng nghe sự kiện thay đổi của giá trị
   * CreateBy : Đăng
   */
  watch: {
    // Thay đổi giá trị model
    modelValue(newVal) {
      // Kiểm tra giá trị thay đổi có trong data search không
      let data = this.entities.find((item) => item[this.propValue] == newVal);
      if (data) {
        // Giá trị hiển thị lên bằng tên
        this.textSelected = data[this.propName];
        // Vị trí của nó trong danh sách
        this.indexItemSelect = this.entities.indexOf(data);
        // Tắt class css của comboxbox
        this.isRequired = false;
      }
    },
    // Thực hiện render lại combobox
    renderCombobox(newVal) {
      // thực hiện get lại data
      if (newVal > 0) {
        this.getData();
      }
    },
  },
  /**
   * Lập các methord cho combobox
   * CreatedBy :Đăng(10/01/2022)
   * EditedBy : Đăng(11/01/2022)
   */
  methods: {
    getData() {
      // Lấy api
      if (this.api) {
        axios
          .get(this.api)
          .then((data) => {
            // Gán data bằng data load được
            this.entities = data.data;
            // Gán data tìm kiếm bằng data load được
            this.entitySearch = data.data;
            // Nếu là form thêm mới thì focus dữ liệu lên dòng đầu tiên
            //Focus giá trị đầu tiên của combobox
            if (this.entities.length > 0) {
              // Hiển thị tên phần tử đầu tiên
              const text = this.entities[0][this.propName];
              // Lấy giá trị đầu tiên
              const value = this.entities[0][this.propValue];
              // Gán lên form detail
              this.textSelected = text; // Hiển thị text lên input.
              // update giá trị
              this.$emit("update:modelValue", value);
            }
            // bingding dữ liệu lên data load được
            // Hiển thị giá trị data load được
            this.setItemSelected();
          })
          .catch((res) => {
            console.log(res);
          });
      }
    },
    /**
     * Thực hiện cộng để render lại
     */
    foreceRender() {
      this.renderCombobox += 1;
    },

    /**
     * Foocus
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    focusFunc() {
      this.$refs.inputFocus.focus();
      this.showError = false;
      this.isShowBoderGreen = true;
      //this.$refs.combobox.addClass("border-none");
    },
    /**
     * sự kiện oninput
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    onInput() {
      // Giá trị nhập vào của input
      this.textSelected = event.target.value;
      // Không show lỗi
      this.showErorr = false;
      // Không xâu css error của combobox
      this.isRequired = false;
      // Nếu giá trị input rỗng gán giá trị model là null
      if (this.textSelected.trim().length <= 0) {
        this.$emit("update:modelValue", null);
      }
    },
    /**
     * Ẩn danh sách item
     */
    hideListData() {
      this.isShowData = false;
    },
    /**
     * Check dữ liệu khi người dùng nhập
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    validate() {
      // Nếu vừa requied và giá trị input rỗng thực hiện show css combobox không thì tắt css combobox
      if (this.required && this.textSelected.trim().length <= 0) {
        this.isRequired = true;
        this.showErorr = false;
        return {
          status: false,
          messError: this.messError,
        };
      } else {
        this.isRequired = false;
        return {
          status: true,
        };
      }
    },
    //Hover chuột vào combobx hiện thị lỗi
    mouseOver() {
      if (this.isRequired) {
        this.showError = true;
        this.isShowData = false;
      }
    },

    //mouseOut ra combobox tắt hiện lỗi
    mouseOut() {
      this.showError = false;
    },
    onClick() {
      this.isShowBoderGreen = true;
    },
    onBlur() {
      if (this.required && this.textSelected.trim().length <= 0) {
        this.isShowBoderGreen = false;
      }
      else if (!this.required) {
        this.isShowBoderGreen = false;
      }
    },

    // Ẩn hiện data
    onShowHideData() {
      this.isShowData = !this.isShowData;
    },
    /**
     * Đóng bảng chọn khi click vào thẻ cha
     * CreateBy: Đăng (26/12/2022)
     */
    closeData() {
      this.isShowData = false;
    },
    /**
     * Lấy item được chọn
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    itemOnSelect(entity) {
      var me = this;
      // Reset lại danh sách
      this.entitySearch = this.entities;
      this.itemSelected = entity;
      // Set index cuar item duwojc chon
      this.indexItemSelect = me.findIndexSelected; //Lấy tại computed
      // Gán giá trị hiển thị bằng giá trị propName
      this.textSelected = entity[this.propName];
      // Thực hiện update data khi dữ liệu thay đổi
      this.$emit("update:modelValue", entity[this.propValue]);
      // Ẩn data
      this.isShowData = false;
    },
    /**
     * Set vị trí tìm được lên input
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    setItemSelected() {
      var me = this;
      // Item tương ứng với model value
      let entitySelected = this.entities.find(
        (item) => item[me.propValue] == me.modelValue
      );
      if (entitySelected) {
        this.textSelected = entitySelected[this.propName];
      } else {
        this.textSelected = "";
      }
    },
    /**
     * Thực hiện tìm kiếm bằng input
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    onSearchItem() {
      var me = this;
      // console.log(this.textSelected);
      // Item tương ứng với model value
      this.entitySearch = this.entities.filter((item) =>
        item[me.propName].toLowerCase().includes(me.textSelected.toLowerCase())
      );
      this.onInput();
      // console.log(this.entitySearch);
      if (this.entitySearch) {
        // Hiện data
        this.isShowData = true;
      } else {
        this.isShowData = false;
      }
    },
    /**
     * Lập sự kiện cho nút lên xuống
     * CreatedBy :Đăng(10/01/2022)
     * EditedBy : Đăng(11/01/2022)
     */
    inputOnKeyDown(event) {
      const keyCode = event.keyCode;
      switch (keyCode) {
        // Án enter
        case enumAUTO.KEY_CODE.ENTER:
          // Gán giá trị item trên data search
          const item = this.entitySearch[this.indexItemSelect];
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
          let maxLength = this.entitySearch.length;
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
      // console.log(event.keyCode);
      const keyCode = event.keyCode;
      switch (keyCode) {
        // Án enter
        case enumAUTO.KEY_CODE.ENTER:
          // Gán giá trị item trên data search
          const item = this.entitySearch[this.indexItemSelect];
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
          let maxLength = this.entitySearch.length;
          if (this.indexItemSelect < maxLength - 1) {
            this.indexItemSelect++;
          }
          break;
        case enumAUTO.KEY_CODE.TAB:
          // Ẩn data show
          this.isShowData = false;
          break;
        default:
          break;
      }
    },
  },
  mounted() {
    if (this.focus) {
      this.$refs.inputFocus.focus();
      this.isRequired = false;
    }
  },
};
</script>
<style scoped>
@import url(../css/components/combobox.css);
</style>
