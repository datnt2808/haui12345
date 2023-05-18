<template>
    <div class="admin-content">
        <AdminLineLink name="Thống kê doanh thu"></AdminLineLink>
        <div v-if="showLoading">
            <MLoading></MLoading>
        </div>
        <div v-else>
            <div style="font-weight:bold;margin-left: 350px;">Thống kê doanh thu của từng nhãn hàng theo tháng (Đơn vị %)
            </div>
            <div style="display: flex;align-items: center;margin: 20px 0;margin-left: 300px;">
                <div style="display: flex;align-items: center;">
                    <div>
                        Lựa chọn tháng:
                    </div>
                    <MSelectBoxDown :data="[
                        { feildShow: 'Tháng 1', feildValue: 1 },
                        { feildShow: 'Tháng 2', feildValue: 2 },
                        { feildShow: 'Tháng 3', feildValue: 3 },
                        { feildShow: 'Tháng 4', feildValue: 4 },
                        { feildShow: 'Tháng 5', feildValue: 5 },
                        { feildShow: 'Tháng 6', feildValue: 6 },
                        { feildShow: 'Tháng 7', feildValue: 7 },
                        { feildShow: 'Tháng 8', feildValue: 8 },
                        { feildShow: 'Tháng 9', feildValue: 9 },
                        { feildShow: 'Tháng 10', feildValue: 10 },
                        { feildShow: 'Tháng 11', feildValue: 11 },
                        { feildShow: 'Tháng 12', feildValue: 12 },
                    ]" v-model="month" style="margin: 0 30px 0 10px;"></MSelectBoxDown>
                </div>
                <div style="display: flex;align-items: center;">
                    <div>Năm</div>
                    <MYear v-model="year" style="margin: 0 200px 0 10px;"></MYear>
                </div>
            </div>
            <div style="margin-left: 450px;">
                <Doughnut :data="dataChartDought" :options="optionsChartDought" />
                <div style="margin: 10px 0;">
                    Kết quả thống kê doanh thu của từng nhãn hàng
                </div>
            </div>
            <div v-if="showLoading2">
                <MLoading></MLoading>
            </div>
            <div v-else>
                <div style="display: flex;align-items: center;margin: 20px 0 20px 320px;font-weight:bold">
                    <div>Thống kê doanh thu từng tháng theo năm (Đơn vị vnd). Vui lòng chọn năm: </div>
                    <div>
                        <select v-model="byYear"
                            style="height: 36px;width: 100px;magin-left:20px;border: 1px solid #bbb;border-radius: 4px;">
                            <option v-for="year in years" :key="year" :value="year">{{ year }}</option>
                        </select>
                    </div>
                </div>
                <Bar :data="dataBar" :options="optionsBar" />
            </div>
            <div v-if="showLoading3">
                <MLoading></MLoading>
            </div>
            <div v-else>
                <div style="display: flex;align-items: center;margin: 20px 0 20px 320px;font-weight:bold">
                    <div>Thống kê doanh thu từng quý theo năm (Đơn vị vnd). Vui lòng chọn năm: </div>
                    <div>
                        <select v-model="byYearQuarterly"
                            style="height: 36px;width: 100px;magin-left:20px;border: 1px solid #bbb;border-radius: 4px;">
                            <option v-for="year2 in years2" :key="year2" :value="year2">{{ year2 }}</option>
                        </select>
                    </div>
                </div>
                <Bar :data="dataBarQuarterly" :options="optionsBarQuarterly" />
            </div>
            <!-- <Bar :data="data" :options="options" /> -->
        </div>

    </div>
</template>

<script>
import AdminLineLink from '@/layout/AdminLineLink.vue';
import {
    Chart as ChartJS,
    Title,
    Tooltip,
    Legend,
    BarElement,
    CategoryScale,
    LinearScale,
    ArcElement
} from 'chart.js'
import { Bar, Doughnut } from 'vue-chartjs'
import axios from 'axios';
import MLoading from '@/components/MLoading.vue';
import MCombobox from '@/components/MCombobox.vue';
import MSelectBoxDown from '@/components/MSelectBoxDown.vue';
import MYear from '@/components/MYear.vue';
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend, ArcElement)

export default {
    /**
               * Tên component
               */
    name: 'AdminRevenueStatistics',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { AdminLineLink, Bar, Doughnut, MLoading, MCombobox, MSelectBoxDown, MYear },
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
            dataChartDought: {
                labels: [],
                datasets: [
                    {
                        data: [],
                        hoverBackgroundColor: [
                            '#FF6384',
                            '#36A2EB',
                            '#FFCE56',
                            '#4BC0C0',
                            '#9966FF',
                            '#FF8A80'
                        ]
                    }
                ]
            },
            optionsChartDought: {
                responsive: false,
                maintainAspectRatio: true,
                width: 600,
                height: 600
            },
            dataBar: {
                labels: [
                ],
                datasets: [
                    {
                        label: 'Tổng tiền',
                        backgroundColor: '#f87979',
                        data: []
                    }
                ]
            },
            optionsBar: {
                responsive: true,
                maintainAspectRatio: true,
                width: 1000,
                height: 1000
            },
            dataBarQuarterly: {
                labels: [1, 2, 3, 4],
                datasets: [
                    {
                        label: 'Tổng tiền',
                        backgroundColor: '#f87979',
                        data: []
                    }
                ]
            },
            optionsBarQuarterly: {
                responsive: true,
                maintainAspectRatio: true,
                width: 1000,
                height: 1000
            },
            listBrand: [],
            listPersent: [],
            showLoading: false,
            month: 5,
            year: 2023,
            showLoading2: false,
            listMonth: [],
            listTotal: [],
            byYear: 2023,
            years: [],
            showLoading3: false,
            byYearQuarterly: 2023,
            year2: 2023,
            years2: [],
            listTotalByQuarterly: [],
        }
    },
    /**
     * Phương thức
     */
    methods: {
        thongKeTheoNhanHangTheoThang() {
            this.showLoading = true;
            axios.post("https://localhost:7129/api/v1/Orders/getReportRevenueByBranch", { month: this.month, year: this.year })
                .then((res) => {
                    if (res.status = 200 && res.data.length > 0) {
                        for (let i = 0; i < res.data.length; i++) {
                            this.listBrand.push(res.data[i].brandName)
                            let phanTram = res.data[i].persent + " %";
                            this.listPersent.push(res.data[i].persent)
                        }
                        this.dataChartDought.labels = this.listBrand;
                        let tong = 0;
                        this.listPersent.forEach(x => {
                            tong += x;
                        });
                        this.dataChartDought.datasets[0].data = this.listPersent;
                        this.dataChartDought.datasets[0].backgroundColor = [
                            '#FF6384',
                            '#36A2EB',
                            '#FFCE56',
                            '#4BC0C0',
                            '#9966FF',
                            '#FF8A80'
                        ];
                        if (tong == 0) {
                            this.dataChartDought.labels = ['Không có dữ liệu'];
                            this.dataChartDought.datasets[0].data = [0.00001];
                            this.dataChartDought.datasets[0].backgroundColor = ['#FF6384'];
                        }
                        this.listBrand = [];
                        this.listPersent = [];
                        this.showLoading = false;
                    } else {
                        this.dataChartDought.labels = this.listBrand;
                        this.dataChartDought.datasets[0].data = [0, 0, 0, 0, 0, 0];
                    }
                })
        },

        thongKeTheoNam() {
            this.showLoading2 = true;
            axios.get("https://localhost:7129/api/v1/Orders/getReportRevenueByYear", { params: { byYear: this.byYear } })
                .then((res) => {
                    // console.log(res.data);
                    // this.showLoading = false;
                    if (res.status = 200 && res.data.length > 0) {
                        this.listMonth = [];
                        for (let i = 0; i < res.data.length; i++) {
                            this.listMonth.push(res.data[i].thang)
                            this.listTotal.push(res.data[i].tongtien)
                        }
                        this.dataBar.labels = this.listMonth;
                        this.dataBar.datasets[0].data = this.listTotal;
                        this.listMonth = [];
                        this.listTotal = [];
                        this.showLoading2 = false;
                    } else {
                        // Xử lý khi không nhận được dữ liệu
                        this.listMonth = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
                        this.dataBar.labels = this.listMonth;
                        this.dataBar.datasets[0].data = [];
                        this.showLoading2 = false;
                    }
                })
                .catch(error => {
                    if (error.response.status === 204) {
                        this.listMonth = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
                        this.dataBar.labels = this.listMonth;
                        this.dataBar.datasets[0].data = [];
                        this.showLoading2 = false;
                    } else {
                        console.log(error.response.data);
                    }
                });
        },

        thongKeTheoQuy() {
            this.showLoading3 = true;
            axios.get("https://localhost:7129/api/v1/Orders/getReportRevenueByYear", { params: { byYear: this.byYearQuarterly } })
                .then((res) => {
                    // console.log(res.data);
                    // this.showLoading = false;
                    if (res.status = 200 && res.data.length > 0) {
                        for (let i = 0; i < res.data.length; i += 3) {
                            let tongtientheoquy = res.data[i].tongtien + res.data[i + 1].tongtien + res.data[i + 2].tongtien;
                            this.listTotalByQuarterly.push(tongtientheoquy);
                        }
                        this.dataBarQuarterly.datasets[0].data = this.listTotalByQuarterly;
                        this.listTotalByQuarterly = [];
                        this.showLoading3 = false;
                    } else {
                        // Xử lý khi không nhận được dữ liệu
                        this.dataBarQuarterly.datasets[0].data = [];
                        this.showLoading3 = false;
                    }
                })
                .catch(error => {
                });
        }
    },
    created() {
        this.thongKeTheoNhanHangTheoThang();
        this.thongKeTheoNam();
        this.thongKeTheoQuy();
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        month(newVal) {
            this.month = newVal;
            this.dataChartDought
            this.thongKeTheoNhanHangTheoThang();
            console.log(newVal);
        },

        year(newVal) {
            this.year = newVal;
            this.thongKeTheoNhanHangTheoThang();
            console.log(newVal);
        },

        byYear(newVal) {
            this.byYear = newVal;
            this.thongKeTheoNam();
            console.log(newVal);
        },

        byYearQuarterly(newVal) {
            this.byYearQuarterly = newVal;
            this.thongKeTheoQuy();
        }
    },
    mounted() {
        const currentYear = new Date().getFullYear();
        const years = [];
        for (let i = currentYear; i >= 1900; i--) {
            years.push(i);
        }
        this.years = years;
        const currentYear2 = new Date().getFullYear();
        const years2 = [];
        for (let i = currentYear; i >= 1900; i--) {
            years2.push(i);
        }
        this.years2 = years2;
    }
}
</script>

<style></style>