<template>
    <div class="admin-content">
        <div class="atable-header">
            <AdminLineLink name="Sản phẩm"></AdminLineLink>
            <div class="table-toolbar">
                <div class="search-toolbar">
                    <MInput v-model="textSearch" ref="inputSearch"
                        styleInput="width:400px; height:36px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"
                        placeholder="Tìm kiếm sản phẩm"></MInput>
                    <button @click="search">Tìm kiếm</button>
                </div>
                <div class="add-toolbar">
                    <button @click="addProduct">Thêm mới</button>
                    <div class="refresh" @click="refresh"><i class="fa-solid fa-rotate"></i></div>
                </div>
            </div>
            <div class="list-name-table">
                <div>
                    Danh sách sản phẩm
                </div>
                <div style="display: flex;align-items: center;">
                    Sắp xếp theo:
                    <MSelectBoxDown :data="[
                        { feildShow: 'Ngày tạo gần nhất', feildValue: 'p.createdDate DESC' },
                        { feildShow: 'Ngày sửa gần nhất', feildValue: 'p.modifiedDate DESC' },
                        { feildShow: 'Theo giá tăng dần', feildValue: 'p.price ASC' },
                        { feildShow: 'Theo giá giảm dần', feildValue: 'p.price DESC' },
                        { feildShow: 'Tên sản phẩm a-z', feildValue: 'p.productName ASC' },
                        { feildShow: 'Tên sản phẩm z-a', feildValue: 'p.productName DESC' },
                    ]" v-model="orderBy"></MSelectBoxDown>
                </div>
            </div>
        </div>
        <div class="table-admin">
            <table>
                <thead>
                    <tr>
                        <th style="width: 50px;padding-left: 10px;">STT</th>
                        <th style="width: 100px;">Mã sản phẩm</th>
                        <th style="width: 150px;">Tên sản phẩm</th>
                        <th style="width: 100px;">Giá</th>
                        <th style="width: 100px;">Nơi xuất xứ</th>
                        <th style="width: 100px;">Hình ảnh</th>
                        <th style="width: 80px;">Đã bán</th>
                        <th style="width: 100px;">Số lượng tồn</th>
                        <th style="width: 120px;">Số lượng nhập</th>
                        <th style="width: 100px;">Trạng thái</th>
                        <th style="width: 150px;">Mô tả</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in dataProduct" :key="index" @click="trClick(item.productID)"
                        @dblclick="rowOnDblClick(item)" :class="{
                            'row-selected': rowSelected == item.productID,
                        }">
                        <td style="padding-left: 10px;">{{ index + 1 }}</td>
                        <td>{{ item.productCode }}</td>
                        <td>{{ item.productName }}</td>
                        <td>{{ formatMoney(item.price) }}</td>
                        <td>{{ item.placeOrigin }}</td>
                        <td><img :src="item.image" alt="" style="width: 100px;height: 100px;"></td>
                        <td>{{ item.quantitySell }}</td>
                        <td>{{ item.quantity - item.quantitySell }}</td>
                        <td>{{ item.quantity }}</td>
                        <td>
                            <div :class="{ 'statusProduct': statusProduct }"
                                style="border: 1px solid #bbb;padding-left: 10px;border-radius: 4px;background-color: #075FC6;color:white;font-size: 14px;width: 110px;">
                                {{ formatStatus(item.quantity) }}
                            </div>
                        </td>
                        <td style="padding-left: 10px;font-size: 14px;">{{ item.description }}</td>
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
        <AdminProductDetail v-if="showPopup" @onClose="showPopup = false" :id="id" :type="type" @success="success">
        </AdminProductDetail>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>

<script>
import AdminLineLink from '@/layout/AdminLineLink.vue';
import MInput from '@/components/MInput.vue';
import AdminProductDetail from './AdminProductDetail.vue';
import Resource from '../../js/gResource';
import axios from 'axios';
import ApiBrand from '../../js/apiBrand';
import { formatStatusProduct, formatDate, formatMoney } from '@/js/gCommon'
import MLoading from '@/components/MLoading.vue';
import { getStorage, ref, deleteObject } from "firebase/storage";
import ApiProduct from '../../js/apiProduct';
import MSelectBox from '@/components/MSelectBox.vue';
import MSelectBoxDown from '@/components/MSelectBoxDown.vue';
import enumAUTO from '@/js/gEnum';
export default {
    /**
           * Tên component
           */
    name: 'AdminProduct',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { AdminLineLink, MInput, AdminProductDetail, MLoading, MSelectBox, MSelectBoxDown },
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
            dataProduct: {},
            rowSelected: -1,
            reloadTable: false,
            showLoading: false,
            textSearch: "",
            pageNumber: 1,
            showSeeMore: false,
            statusProduct: false,

            showTablePaging: false,

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
            orderBy: 'p.modifiedDate DESC',
            pageIndex: 1,
            pageSize: 10,
            dataSearch: [],
        }
    },
    /**
     * Phương thức
     */
    methods: {
        questionDeleteItem(item) {
            let text = `Bạn có muỗn xóa sản phẩm "${item.productCode}" không ?`;
            if (confirm(text) == true) {
                this.deleteItem(item);
            }
        },
        trClick(idRow) {
            this.rowSelected = idRow;
        },

        addProduct() {
            this.showPopup = true;
            this.id = null;
            this.type = Resource.FormAdminType.Add;
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
                this.id = data.productID;
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

            axios.delete(ApiProduct.deleteProductByID(data.productID))
                .then((res) => {
                    if (res.status == 200) {
                        this.$toast.success("Xóa thành công");
                        this.filterAndPaging();
                    }
                })
                .catch((err) => {
                    console.log(err);
                    this.$toast.error("Xóa thất bại");
                })
        },

        formatDate(datetime) {
            try {
                return formatDate(datetime);
            } catch (error) {
                console.log(error);
            }
        },

        formatMoney(money) {
            return formatMoney(money);
        },

        formatStatus(quantity) {
            return formatStatusProduct(quantity);
        },

        filterAndPaging() {
            this.showLoading = true;
            this.listFilter = [
                {
                    FieldName: "ProductCode",
                    Operator: enumAUTO.Operator.Like,
                    FilterValue: this.textSearch,
                },
                {
                    FieldName: "ProductName",
                    Operator: enumAUTO.Operator.Like,
                    FilterValue: this.textSearch,
                },
                {
                    FieldName: "PlaceOrigin",
                    Operator: enumAUTO.Operator.Like,
                    FilterValue: this.textSearch,
                },
            ];
            setTimeout(() => {
                let objectFilter = {
                    pageIndex: this.pageIndex,
                    pageSize: this.pageSize,
                    listFilter: this.listFilter,
                    listOrderBy: this.orderBy
                }
                // console.log(objectFilter);
                axios.post("https://localhost:7129/api/v1/Product/PagingProductByFilter", objectFilter)
                    .then((res) => {
                        if (res.status == 200 && res.data.data.length > 0) {
                            this.showLoading = false;
                            this.noData = false;
                            this.dataProduct = res.data.data;
                            this.showSeeMore = true;
                            this.showTablePaging = true;
                            // Gán dữ liệu số trang trả về bằng Data trả về
                            this.totalPage = res.data.totalPage;
                            // Gán dữ liệu số bản ghi cho form bằng Data trả về
                            this.totalRecord = res.data.totalRecord;
                            // Gán số trang được chọn bằng số trang được chọn
                            this.currentPage = this.pageChoice;
                            // Set số page
                            this.setPageNumber();
                        } else {
                            this.showLoading = false;
                            this.noData = true;
                            this.dataProduct = null;
                            this.showSeeMore = false;
                            this.showTablePaging = false;
                        }
                    })
                // axios.get(ApiProduct.filterProduct(this.textSearch, this.pageSize, this.pageChoice))
                //     .then((res) => {
                //         if (res.status == 200) {
                //             if (res.data.totalRecord > 0) {
                //                 this.showLoading = false;
                //                 this.noData = false;
                //                 this.dataProduct = res.data.data;
                //                 this.showSeeMore = true;
                //                 // console.log(res.data.data.length);
                //                 // for (let i = 0; i < res.data.data.length; i++) {
                //                 //     this.quantity = res.data.data[i].quantity
                //                 //     this.quantitySell = res.data.data[i].quantitySell;
                //                 // }
                //                 // res.data.data.forEach(element => {
                //                 //     this.numberOfInventory = element.quantity[i] - element.quantitySell[i];
                //                 // });

                //                 this.showTablePaging = true;
                //                 // Gán dữ liệu số trang trả về bằng Data trả về
                //                 this.totalPage = res.data.totalPage;
                //                 // Gán dữ liệu số bản ghi cho form bằng Data trả về
                //                 this.totalRecord = res.data.totalRecord;
                //                 // Gán số trang được chọn bằng số trang được chọn
                //                 this.currentPage = this.pageChoice;
                //                 // Set số page
                //                 this.setPageNumber();
                //                 // console.log(res);
                //             } else {
                //                 this.showLoading = false;
                //                 this.noData = true;
                //                 this.dataProduct = null;
                //                 this.showSeeMore = false;
                //                 this.showTablePaging = false;
                //             }
                //         }
                //     })
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
        numberOfInventory(newVal) {
            this.numberOfInventory = newVal;
        },
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
                this.pageSize = this.pageSize;
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

        orderBy(newVal) {
            this.orderBy = newVal;
            this.filterAndPaging();
        }
    },
    computed: {
        // numberQuantity(){
        //     return this.quantity - this.quantitySell;
        // }
    },
}
</script>

<style>
@import url(../../css/admin/adminproduct.css);
</style>