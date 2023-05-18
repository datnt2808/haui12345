<template>
    <div class="admin-content">
        <div class="atable-header">
            <AdminLineLink name="Đơn hàng"></AdminLineLink>
            <div class="table-toolbar">
                <div class="search-toolbar">
                    <MInput v-model="textSearch" ref="inputSearch"
                        styleInput="width:400px; height:36px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                        placeholder="Tìm kiếm đơn hàng"></MInput>
                    <button @click="search">Tìm kiếm</button>
                </div>
                <div class="add-toolbar">
                    <!-- <button @click="addOrder">Thêm mới</button> -->
                    <div class="refresh" @click="refresh">
                        <i class="fa-solid fa-rotate"></i>
                    </div>
                </div>
            </div>
            <div class="list-name-table">Danh sách đơn hàng hoàn</div>
        </div>
        <div class="table-admin">
            <table>
                <thead>
                    <tr>
                        <th style="width: 50px; padding-left: 10px">STT</th>
                        <th style="width: 150px">Mã đơn hàng</th>
                        <th style="width: 100px">Ngày tạo</th>
                        <th style="width: 100px">Người nhận</th>
                        <th style="width: 250px">Địa chỉ</th>
                        <th style="width: 100px">Tổng tiền</th>
                        <th style="width: 200px">Tình trạng</th>
                        <th style="width: 150px">Lí do hoàn hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in dataOrder" :key="index" @click="trClick(item.orderID)"
                        @dblclick="rowOnDblClick(item)" :class="{
                            'row-selected': rowSelected == item.orderID,
                        }">
                        <td style="padding-left: 10px">{{ index + 1 }}</td>
                        <td>{{ item.orderCode }}</td>
                        <td>{{ formatDate(item.orderDate) }}</td>
                        <td>{{ item.fullName }}</td>
                        <td>{{ item.address }}</td>
                        <td>{{ formatMoney(item.totalAmount) }}</td>
                        <td>{{ item.statusOrdersName }}</td>
                        <td>{{ item.reason }}</td>
                    </tr>
                </tbody>
            </table>
            <div class="nodata" v-show="noData">
                <img src="../../assets/Image/Nodata.jpg" alt="" />
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
                            :class="{ 'm-page-number-select': pageChoice == item }" @click="
                                changePageChoice(
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
        <AdminOrderDetail v-if="showPopup" @onClose="showPopup = false" :id="id" :type="type" :statusOrder="statusOrder"
            @success="success">
        </AdminOrderDetail>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
import AdminLineLink from "@/layout/AdminLineLink.vue";
import AdminOrderDetail from "./AdminOrderDetail.vue";
import MInput from "@/components/MInput.vue";
import Resource from "../../js/gResource";
import axios from "axios";
import ApiBrand from "../../js/apiBrand";
import { formatDate, formatMoney } from "@/js/gCommon";
import MLoading from "@/components/MLoading.vue";
import { getStorage, ref, deleteObject } from "firebase/storage";
import ApiOrder from "../../js/apiOrder";
import MSelectBox from "@/components/MSelectBox.vue";
export default {
    /**
     * Tên component
     */
    name: "AdminOrderReturn",
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { AdminLineLink, MInput, AdminOrderDetail, MLoading, MSelectBox },
    /**
     * Emit sự thay đổi
     */
    emits: [""],
    directives: {},
    /**
     * Data
     */
    data() {
        return {
            showPopup: false,
            noData: false,
            id: "",
            statusOrder: "",
            type: "",
            dataOrder: {},
            rowSelected: -1,
            reloadTable: false,
            showLoading: false,
            textSearch: "",
            pageSize: 10,
            pageNumber: 1,
            showSeeMore: false,
            showTablePaging: false,
            statusFilter: 0,

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
        };
    },
    /**
     * Phương thức
     */
    methods: {
        formatMoney(moeny) {
            return formatMoney(moeny);
        },

        trClick(idRow) {
            this.rowSelected = idRow;
        },

        addOrder() {
            this.showPopup = true;
            this.id = null;
            this.type = Resource.FormAdminType.Add;
        },

        refresh() {
            this.textSearch = "";
            this.pageSize = 10;
            this.pageNumber = 1;
            this.filterAndPaging();
        },

        rowOnDblClick(data) {
            try {
                this.showPopup = true;
                this.id = data.orderID;
                this.statusOrder = data.statusOrders;
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
                deleteObject(desertRef)
                    .then(() => {
                        console.log("xóa thành công");
                    })
                    .catch((error) => {
                        console.log("Xóa thất bại");
                    });
            }

            axios
                .delete(ApiBrand.deleteBrandByID(data.orderID))
                .then((res) => {
                    if (res.status == 200) {
                        this.$toast.success("Xóa thành công");
                        this.filterAndPaging();
                    }
                })
                .catch((err) => {
                    console.log(err);
                    this.$toast.error("Xóa thất bại");
                });
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
                // axios.get(ApiOrder.filterOrder(this.textSearch, this.pageSize, this.pageNumber))
                axios
                    .get(
                        ApiOrder.filterOrder(
                            this.textSearch,
                            this.pageSize,
                            this.pageChoice
                        )
                    )
                    .then((res) => {
                        if (res.status == 200) {
                            if (res.data.totalRecord > 0) {
                                this.showLoading = false;
                                this.noData = false;
                                this.dataOrder = res.data.data;
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
                                this.dataOrder = null;
                                this.showSeeMore = false;
                                this.showTablePaging = false;
                            }
                        }
                    });
            }, 500);
        },

        filterAndPagingByStatus() {
            this.showLoading = true;
            setTimeout(() => {
                // axios.get(ApiOrder.filterOrder(this.textSearch, this.pageSize, this.pageNumber))
                axios
                    .get(
                        ApiOrder.filterOrderByStatus(
                            this.textSearch,
                            this.pageSize,
                            this.pageChoice,
                            this.statusFilter
                        )
                    )
                    .then((res) => {
                        if (res.status == 200) {
                            if (res.data.totalRecord > 0) {
                                this.showLoading = false;
                                this.noData = false;
                                this.dataOrder = res.data.data;
                                this.showSeeMore = true;
                                // console.log(res.dataOrder);
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
                                this.dataOrder = null;
                                this.showSeeMore = false;
                                this.showTablePaging = false;
                            }
                        }
                    });
            }, 500);
        },

        success() {
            let param = this.$route.params.id;
            // console.log(param);
            if (param) {
                this.statusFilter = param;
                this.changePageChoice();
                this.filterAndPagingByStatus();
            } else {
                this.changePageChoice();
                this.filterAndPaging();
            }
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
        let param = this.$route.params.id;
        console.log(param);
        if (param) {
            this.statusFilter = param;
            this.filterAndPagingByStatus();
        } else {
            this.filterAndPaging();
        }
    },

    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        "$route.params.id": function (newVal) {
            this.pageSize = 10;
            this.pageChoice = 1;
            this.$refs.inputSearch.value = "";
            if (newVal === undefined) {
                this.filterAndPaging();
            } else {
                this.statusFilter = newVal;
                this.filterAndPagingByStatus();
            }
        },

        // Thực hiện reload table khi dữ liệu trong table thay đổi
        reloadTable(newVal) {
            try {
                if (newVal) {
                    this.reloadTable = newVal;
                    let param = this.$route.params.id;
                    // console.log(param);
                    if (param) {
                        this.statusFilter = param;
                        this.filterAndPagingByStatus();
                    } else {
                        this.filterAndPaging();
                    }
                }
            } catch (error) {
                console.log(error);
            }
        },
        // Bắt sự kiện thay đổi số trang được chọn thì hiển thị lại dữ liệu theo số trang
        pageChoice() {
            try {
                let param = this.$route.params.id;
                // console.log(param);
                if (param) {
                    this.statusFilter = param;
                    this.changePageChoice();
                    this.filterAndPagingByStatus();
                } else {
                    this.changePageChoice();
                    this.filterAndPaging();
                }
            } catch (error) {
                console.log(error);
            }
        },

        //Bắt sự kiện thay đổi số lượng bản ghi trong 1 trang
        pageSize() {
            try {
                if (this.pageChoice > this.totalRecord / this.pageSize) {
                    this.pageChoice = 1;
                }
                this.pageSize = this.pageSize;
                let param = this.$route.params.id;
                // console.log(param);
                if (param) {
                    this.statusFilter = param;
                    this.changePageChoice();
                    this.filterAndPagingByStatus();
                } else {
                    this.changePageChoice();
                    this.filterAndPaging();
                }
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
    },
};
</script>
  
<style>
@import url(../../css/admin/adminorder.css);
</style>