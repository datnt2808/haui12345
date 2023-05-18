<template>
    <div class="admin-content">
        <div class="atable-header">
            <AdminLineLink name="Danh mục sản phẩm"></AdminLineLink>
            <div class="table-toolbar">
                <div class="search-toolbar">
                    <MInput v-model="textSearch" ref="inputSearch"
                        styleInput="width:400px; height:36px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                        placeholder="Tìm kiếm danh mục"></MInput>
                    <button @click="search">Tìm kiếm</button>
                </div>
                <div class="add-toolbar">
                    <button @click="addCategory">Thêm mới</button>
                    <div class="refresh" @click="refresh"><i class="fa-solid fa-rotate"></i></div>
                </div>
            </div>
            <div class="list-name-table">
                Danh sách danh mục
            </div>
        </div>
        <div class="table-admin">

            <table>
                <thead>
                    <tr>
                        <th style="width: 50px;padding-left: 10px;">STT</th>
                        <th style="width: 150px;">Mã danh mục</th>
                        <th style="width: 250px;">Tên danh mục</th>
                        <th style="width: 500px;">Mô tả</th>
                        <th style="width: 100px;">Ngày tạo</th>
                        <th style="width: 100px;">Ngày sửa</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in dataCategory" :key="index" @click="trClick(item.categoryID)"
                        @dblclick="rowOnDblClick(item)" :class="{
                            'row-selected': rowSelected == item.categoryID,
                        }">
                        <td style="padding-left: 10px;">{{ index + 1 }}</td>
                        <td>{{ item.categoryCode }}</td>
                        <td>{{ item.categoryName }}</td>
                        <td>{{ item.description }}</td>
                        <td>{{ formatDate(item.createdDate) }}</td>
                        <td>{{ formatDate(item.modifiedDate) }}</td>
                        <td>
                            <div class="tbmethods">
                                <button style="margin-left: 10px;" @click="questionDeleteItem(item)">Xóa</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="nodata" v-show="noData">
                <img src="../../assets/Image/Nodata.jpg" alt="">
            </div>
            <!-- <div class="see-more" style="margin-top: 10px;" @click="seeMore" v-show="showSeeMore">Xem thêm</div> -->
        </div>
        <div class="table__paging" v-if="showTablePaging">
            <div class="paging__left">
                Tống số bản ghi : <b>{{ totalRecord }}</b>
            </div>
            <div class="paging__right">
                <div class="m-pagding-right-left">
                    <div>
                        <MSelectBox :data="[
                            { feildShow: '10 bản ghi trên trang', feildValue: 10 },
                            { feildShow: '20 bản ghi trên trang', feildValue: 20 },
                            { feildShow: '50 bản ghi trên trang', feildValue: 50 },
                            { feildShow: '70 bản ghi trên trang', feildValue: 70 },
                            { feildShow: '100 bản ghi trên trang', feildValue: 100 },
                        ]" v-model="pageSize"></MSelectBox>
                    </div>
                </div>
                <div class="m-pagding-right-right">
                    <div class="m-page-number-group">
                        <button class="m-page-number" v-for="(item, index) in pageNumber" :key="item"
                            :class="{ 'm-page-number-select': pageChoice == item }" @click="changePageChoice(
                                pageNumber[index - 1],
                                item,
                                pageNumber[index + 1]
                            )
                                ">
                            {{ item }}
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <AdminCategoryDetail v-if="showPopup" @onClose="showPopup = false" :id="id" :type="type" @success="success">
        </AdminCategoryDetail>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>

<script>
import AdminLineLink from '@/layout/AdminLineLink.vue';
import MInput from '@/components/MInput.vue';
import AdminCategoryDetail from './AdminCategoryDetail.vue';
import Resource from '../../js/gResource';
import axios from 'axios';
import { formatDate } from '@/js/gCommon'
import MLoading from '@/components/MLoading.vue';
import { getStorage, ref, deleteObject } from "firebase/storage";
import ApiProductCategory from '../../js/apiProductCategory';
import MSelectBox from '@/components/MSelectBox.vue';
export default {
    /**
           * Tên component
           */
    name: 'AdminCategory',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { AdminLineLink, MInput, AdminCategoryDetail, MLoading, MSelectBox },
    /**
     * Emit sự thay đổi
     */
    emits: [""],
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            showPopup: false,
            noData: false,
            id: '',
            type: '',
            dataCategory: {},
            rowSelected: -1,
            reloadTable: false,
            showLoading: false,
            textSearch: "",
            pageSize: 10,
            pageNumber: 1,
            showSeeMore: false,
            showTablePaging: false,

            pageSize: 10,
            // Số trang được tính
            pageNumber: [],
            // Vị trí trang là 1
            pageChoice: 1,
            // Số bản ghi là 0
            totalRecord: 0,
            // Số trang là  0
            currentPage: 0,
            // Số trang trả về
            totalPage: 0,
            //Popup
        }
    },
    /**
     * Phương thức
     */
    methods: {
        questionDeleteItem(item) {
            let text = `Bạn có muỗn xóa danh mục ${item.categoryName} không ?`;
            if (confirm(text) == true) {
                this.deleteItem(item);
            }
        },
        addCategory() {
            this.showPopup = true;
            this.id = null;
            this.type = Resource.FormAdminType.Add;
        },

        trClick(idRow) {
            this.rowSelected = idRow;
        },

        refresh() {
            this.textSearch = '';
            this.pageSize = 10;
            this.pageNumber = 1;
            this.filterAndPaging();
        },

        rowOnDblClick(data) {
            try {
                this.showPopup = true;
                this.id = data.categoryID;
                this.type = Resource.FormAdminType.Update;
            } catch (error) {
                console.log(error);
            }
        },

        deleteItem(data) {
            if (data.image != null) {
                const storage = getStorage();

                // Create a reference to the file to delete
                const desertRef = ref(storage, data.image);

                // Delete the file
                deleteObject(desertRef).then(() => {
                    console.log("xóa thành công");
                }).catch((error) => {
                    console.log("Xóa thất bại");
                });
            }

            axios.delete(ApiProductCategory.deleteProductCategoryByID(data.categoryID))
                .then((res) => {
                    if (res.status == 200) {
                        this.$toast.success("Xóa thành công");
                        this.filterAndPaging();
                    }
                })
                .catch((err) => {
                    if(err.response.status == 500){
                        alert("Xóa danh mục thất bại do còn sản phẩm trong danh mục này");
                        this.$toast.error("Xóa thất bại");
                    }
                })
        },

        formatDate(datetime) {
            try {
                return formatDate(datetime);
            } catch (error) {
                console.log(error);
            }
        },

        filterAndPaging() {
            this.showLoading = true;
            setTimeout(() => {
                axios.get(ApiProductCategory.filterProductCategory(this.textSearch, this.pageSize, this.pageChoice))
                    .then((res) => {
                        if (res.status == 200) {
                            if (res.data.totalRecord > 0) {
                                this.showLoading = false;
                                this.noData = false;
                                this.dataCategory = res.data.data;
                                this.showSeeMore = true;
                                // console.log(res);
                                this.showTablePaging = true;
                                // Gán dữ liệu số trang trả về bằng Data trả về
                                this.totalPage = res.data.totalPage;
                                // Gán dữ liệu số bản ghi cho form bằng Data trả về
                                this.totalRecord = res.data.totalRecord;
                                // Gán số trang được chọn bằng số trang được chọn
                                this.currentPage = this.pageChoice;
                                // Set số page
                                this.setPageNumber();
                                // console.log(res);
                            } else {
                                this.showLoading = false;
                                this.noData = true;
                                this.dataCategory = null;
                                this.showSeeMore = false;
                                this.showTablePaging = false;
                            }
                        }
                    })
            }, 500)
        },

        success() {
            this.filterAndPaging();
            this.reloadTable = false;
        },

        search() {
            this.textSearch = this.$refs.inputSearch.modelValue;
            this.pageSize = 10;
            this.pageNumber = 1;
            this.filterAndPaging();
        },

        seeMore() {
            this.textSearch = this.$refs.inputSearch.value;
            this.pageSize = this.pageSize + 10;
            this.pageNumber = 1;
            this.filterAndPaging();
        },

        changePageChoice(pagePrev, pageNumber, pageNext) {
            try {
                // Khởi tạo lại page number
                var a = parseInt(this.totalRecord / this.pageSize);
                if (this.totalRecord % this.pageSize != 0) a++;

                // Click vào số trang
                if (parseInt(pageNumber)) {
                    this.pageChoice = pageNumber;
                    if (a > 5) {
                        this.pageNumber = []; // Khỏi tạo lại danh sách số trang
                        this.pageNumber.push(1);
                        if (this.pageChoice <= 2) {
                            this.pageNumber.push(2);
                            this.pageNumber.push(3);
                            this.pageNumber.push("...");
                        } else if (this.pageChoice > 2 && this.pageChoice < a - 2) {
                            this.pageNumber.push("...");
                            this.pageNumber.push(this.pageChoice);
                            this.pageNumber.push(this.pageChoice + 1);
                            this.pageNumber.push(this.pageChoice + 2);
                            this.pageNumber.push("...");
                        } else {
                            this.pageNumber.push("...");
                            this.pageNumber.push(a - 2);
                            this.pageNumber.push(a - 1);
                        }
                        this.pageNumber.push(a);
                    }
                    // Load bảng khi chọn trang
                    // this.$emit("update:modelValue", true);
                }
                // Khi click vào ...
                else if (pageNext && pagePrev) {
                    if (parseInt(pageNext) == a) {
                        this.pageNumber = []; // Khỏi tạo lại danh sách số trang
                        this.pageNumber.push(1);
                        if (parseInt(pagePrev) >= a - 3) {
                            this.pageNumber.push("...");
                            this.pageNumber.push(a - 2);
                            this.pageNumber.push(a - 1);
                        } else if (parseInt(pagePrev) >= 3 && parseInt(pagePrev) < a - 3) {
                            this.pageNumber.push("...");
                            this.pageNumber.push(parseInt(pagePrev) + 1);
                            this.pageNumber.push(parseInt(pagePrev) + 2);
                            this.pageNumber.push(parseInt(pagePrev) + 3);
                            this.pageNumber.push("...");
                        } else {
                            this.pageNumber.push(2);
                            this.pageNumber.push(3);
                            this.pageNumber.push("...");
                        }
                        this.pageNumber.push(a);
                    } else if (parseInt(pagePrev) == 1) {
                        this.pageNumber = []; // Khỏi tạo lại danh sách số trang
                        this.pageNumber.push(1);
                        if (parseInt(pageNext) <= 4) {
                            this.pageNumber.push(2);
                            this.pageNumber.push(3);
                            this.pageNumber.push("...");
                        } else if (parseInt(pageNext) > 4 && parseInt(pageNext) <= a - 2) {
                            this.pageNumber.push("...");
                            this.pageNumber.push(parseInt(pageNext) - 3);
                            this.pageNumber.push(parseInt(pageNext) - 2);
                            this.pageNumber.push(parseInt(pageNext) - 1);
                            this.pageNumber.push("...");
                        } else {
                            this.pageNumber.push("...");
                            this.pageNumber.push(a - 2);
                            this.pageNumber.push(a - 1);
                        }
                        this.pageNumber.push(a);
                    }
                }
            } catch (error) {
                console.log(error);
            }
        },
        /**
         * Hiển thị số trang của paging
         * CreateBY : Đăng(23/1/2023)
         */
        setPageNumber() {
            this.pageNumber = []; // Khỏi tạo lại danh sách số trang
            if (this.totalPage > 5) {
                if (this.pageChoice >= 1 && this.pageChoice < 3) {
                    this.pageNumber.push(1);
                    this.pageNumber.push(2);
                    this.pageNumber.push(3);
                    this.pageNumber.push("...");
                    this.pageNumber.push(this.totalPage);
                } else if (this.pageChoice < this.totalPage - 2) {
                    this.pageNumber.push(1);
                    this.pageNumber.push("...");
                    this.pageNumber.push(this.pageChoice);
                    this.pageNumber.push(this.pageChoice + 1);
                    this.pageNumber.push(this.pageChoice + 2);
                    this.pageNumber.push("...");
                    this.pageNumber.push(this.totalPage);
                } else {
                    this.pageNumber.push(1);
                    this.pageNumber.push("...");
                    this.pageNumber.push(this.totalPage - 2);
                    this.pageNumber.push(this.totalPage - 1);
                    this.pageNumber.push(this.totalPage);
                }
            } else {
                for (let i = 1; i <= this.totalPage; i++) {
                    this.pageNumber.push(i);
                }
            }
        },

    },
    created() {
        this.filterAndPaging();
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        // Thực hiện reload table khi dữ liệu trong table thay đổi
        reloadTable(newVal) {
            try {
                if (newVal) {
                    this.reloadTable = newVal;
                    this.filterAndPaging();
                }
            } catch (error) {
                console.log(error);
            }
        },
        // Bắt sự kiện thay đổi số trang được chọn thì hiển thị lại dữ liệu theo số trang
        pageChoice() {
            try {
                this.changePageChoice();
                this.filterAndPaging();
            } catch (error) {
                console.log(error);
            }
        },

        //Bắt sự kiện thay đổi số lượng bản ghi trong 1 trang
        pageSize() {
            try {
                if (this.pageChoice > (this.totalRecord / this.pageSize)) {
                    this.pageChoice = 1;
                }
                this.filterAndPaging();
            } catch (error) {
                console.log(error);
            }
        },

        // Bắt sự kiện người dùng nhập giá trị tìm kiếm
        textSearch() {
            if (this.$refs.inputSearch.value) {
                this.pageChoice = 1;
                clearTimeout(this.setSearchTime);
                this.setSearchTime = setTimeout(async () => {
                    this.filterAndPaging();
                }, 500);
            }
        },
    }
}
</script>

<style>
@import url(../../css/admin/admincategory.css);
</style>