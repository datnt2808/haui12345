<template>
    <div>
        <TheHeader></TheHeader>
        <TheNavbar></TheNavbar>
        <div class="content" id="main">
            <MLoading v-if="showLoading"></MLoading>
            <TheLineLink name="Tin tức"></TheLineLink>
            <div class="content-news">
                <div class="nav-list-news">
                    <div class="title-news">TIN TỨC</div>
                    <div class="list-content" v-for="(item, index) in dataNews" :key="index" @click="trClick(item.newsID)" @dblclick="rowOnDblClick(item)" :class="{'row-selected': rowSelected == item.newsID}">
                        <router-link :to="'/news/' + item.newsID" style="text-decoration: none;color: black;"
                            @click="detailNews(item.newsID)" :value="item.newsID">
                            <div class="news">
                                <div class="news-image">
                                    <img :src="item.image" alt="">
                                </div>
                                <div class="news-right">
                                    <div class="news-title">{{ item.newsTitle }}</div>
                                    <div class="news-time">Ngày tạo :{{ formatDate(item.newsDate) }}</div>
                                    <div class="news-content">{{ item.contentShorted }}</div>
                                </div>
                            </div>
                        </router-link>
                    </div>
                    <div class="see-more" v-show="showSeeMore" @click="seeMore">Xem thêm</div>
                </div>
                <div class="new-news">
                    <div class="title-news" style="padding-left: 10px;">BÀI VIẾT MỚI NHẤT</div>
                    <div class="list-news-new" v-for="(item, index) in dataNewsNew" :key="index"
                        @click="trClick(item.newsID)" @dblclick="rowOnDblClick(item)" :class="{
                                'row-selected': rowSelected == item.newsID,
                            }">
                        <router-link :to="'/news/' + item.newsID" style="text-decoration: none;color: black;"
                            @click="detailNews(item.newsID)" :value="item.newsID">
                            <div class="news-new">
                                <div class="news-new-image">
                                    <img :src="item.image" alt="">
                                </div>
                                <div class="news-new-right">
                                    <div class="news-new-title">{{ item.newsTitle }}</div>
                                    <div class="news-new-time">Ngày tạo :{{ formatDate(item.newsDate) }}</div>
                                </div>
                            </div>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <MLoading v-if="showLoading"></MLoading>
        <TheFooter></TheFooter>
    </div>
</template>
  
<script>
import TheFooter from '@/layout/TheFooter.vue';
import TheHeader from '@/layout/TheHeader.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import Resource from '../../js/gResource';
import axios from 'axios';
import { formatDate } from '@/js/gCommon'
import MLoading from '@/components/MLoading.vue';
import { getStorage, ref, deleteObject } from "firebase/storage";
import ApiNews from '../../js/apiNews';
import DetailsNews from './DetailsNews.vue';
export default {
    /**
     * Tên component
     */
    name: 'News',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, TheLineLink, TheFooter, MLoading, DetailsNews },
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
            showLoading: false,
            noData: false,
            id: '',
            type: '',
            dataNews: {},
            dataNewsNew: {},
            rowSelected: -1,
            reloadTable: false,
            showLoading: false,
            textSearch: "",
            pageSize: 3,
            pageNumber: 1,
            showSeeMore: false,
            idDetail: '',
        }
    },
    /**
     * Phương thức
     */
    methods: {
        trClick(idRow) {
            this.rowSelected = idRow;
            this.idDetail = idRow;
        },

        rowOnDblClick(data) {
            try {
                this.showPopup = true;
                this.idDetail = data.newsID;
                this.type = Resource.FormAdminType.Update;
            } catch (error) {
                console.log(error);
            }
        },

        detailNews(item) {
            this.$router.push({ name: 'news', params: { id: item }})
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
                axios.get(ApiNews.filterNews(this.textSearch, this.pageSize, this.pageNumber))
                    .then((res) => {
                        if (res.status == 200) {
                            if (res.data.totalRecord > 0) {
                                this.showLoading = false;
                                this.noData = false;
                                this.dataNews = res.data.data;
                                this.showSeeMore = true;
                                // console.log(res);
                            } else {
                                this.showLoading = false;
                                this.noData = true;
                                this.dataNews = null;
                                this.showSeeMore = false;
                            }
                        }
                    })
            }, 500)
        },

        filterAndPaging2() {
            this.showLoading = true;
            setTimeout(() => {
                axios.get(ApiNews.filterNews(this.textSearch, 3, this.pageNumber))
                    .then((res) => {
                        if (res.status == 200) {
                            if (res.data.totalRecord > 0) {
                                this.showLoading = false;
                                this.noData = false;
                                this.dataNewsNew = res.data.data;
                                this.showSeeMore = true;
                                // console.log(res);
                            } else {
                                this.showLoading = false;
                                this.noData = true;
                                this.dataNewsNew = null;
                                this.showSeeMore = false;
                            }
                        }
                    })
            }, 500)
        },

        seeMore() {
            this.pageSize = this.pageSize + 3;
            this.pageNumber = 1;
            this.filterAndPaging();
        },

    },
    created() {
        this.filterAndPaging();
        this.filterAndPaging2();
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>
  
<style>
@import url(../../css/news.css);
</style>