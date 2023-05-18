<template>
    <div>
        <TheHeader></TheHeader>
        <TheNavbar></TheNavbar>
        <div class="content" id="main">
            <TheLineLink name="Tin tức" :detail="'/ ' + news.newsTitle"></TheLineLink>
            <div class="details-news-title">Tiêu đề: {{ news.newsTitle }}</div>
            <div class="details-news-time">Ngày tạo: {{ formatDate(news.newsDate) }}</div>
            <div class="details-news-image">
                <img :src="news.image" alt="">
            </div>
            <div class="details-news-content">Nội dung: {{ news.content }}</div>
        </div>
        <TheFooter></TheFooter>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>

<script>
import TheFooter from '@/layout/TheFooter.vue';
import TheHeader from '@/layout/TheHeader.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import {
    getDownloadURL,
    getStorage,
    ref,
    uploadBytesResumable,
} from "firebase/storage";
import MLoading from '@/components/MLoading.vue';
import ApiNews from '../../js/apiNews';
import axios from 'axios';
import { formatDate } from '@/js/gCommon'
export default {
    /**
     * Tên component
     */
    name: 'DetailsNews',
    /**
     * Hứng nhận
     */
    props: {
        id: {
            type: String,
            required: true
        }
    },
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, TheFooter, TheLineLink, MLoading },
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
            news: {},
            showLoading: false,
        }
    },
    /**
     * Phương thức
     */
    methods: {
        formatDate(datetime) {
            try {
                return formatDate(datetime);
            } catch (error) {
                console.log(error);
            }
        },
    },
    created() {
        // Khởi tạo lấy giá trị id truyền vào
        if (this.id) {
            // Bật loadding
            this.showLoading = true;
            setTimeout(async () => {
                //Lấy dữ liệu
                await axios.get(ApiNews.getNewsByID(this.id))
                    .then((res) => {
                        this.showLoading = false;
                        this.news = res.data;
                        // console.log("news", this.news);
                        // console.log(res);
                    })
            }, 500)
        }
    },
    mounted() {

    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>

<style>
@import url(../../css/detailsnews.css);
</style>