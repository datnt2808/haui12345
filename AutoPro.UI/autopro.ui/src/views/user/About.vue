<template>
    <div>
        <TheHeader></TheHeader>
        <TheNavbar></TheNavbar>
        <div class="about" id="main">
            <MLoading v-if="showLoading"></MLoading>
            <TheLineLink name="Giới thiệu"></TheLineLink>
            <div class="about1">
                <div class="title-about">GIỚI THIỆU VỀ HaUI</div>
                <div class="content-about">Hệ thống quản lý đồng phục trường đại học công nghiệp Hà Nội - Trang phân phối độc
                    quyền về đồng phục của Trường đại học Công nghiệp Hà Nội
                </div>
                <img src="../../assets/Image/a1.jpg" alt="" style="width: 200px; height:200px ; margin-left: 40%;">
            </div>
            <div class="about1">
                <div class="title-about">Đại học Công nghiệp Hà Nội </div>
                <div class="content-about">Trường Đại học Công nghiệp Hà Nội là cơ sở giáo dục đại học công lập với bề dày
                    lịch sử 125 năm xây dựng và phát triển luôn được đánh giá là cơ sở đào tạo cán bộ kinh tế - kỹ thuật hàng
                    đầu của cả nước. Đến nay, Nhà trường đã được trao tặng Huân chương Hồ Chí Minh, danh hiệu Anh hùng thời 
                    kỳ đổi mới và nhiều danh hiệu cao quý khác. Là cơ sở giáo dục đại học đạt chuẩn kiểm định quốc gia, nhiều
                    ngành và chương trình đào tạo đạt chuẩn kiểm định quốc gia, quốc tế, với trên 30% giảng viên có trình độ
                    tiến sĩ có học hàm giáo sư, phó giáo sư, hệ thống giảng đường, phòng thực hành, thí nghiệm, khu ký túc xá,
                    khu dịch vụ sinh viên khang trang hiện đại trên diện tích gần 50 ha, Nhà trường có đủ điều kiện đảm bảo quy
                     mô đào tạo trên 32.000 học viên, sinh viên các cấp trình độ.<br>
                     Chiến lược phát triển của Nhà trường gắn đào tạo với thị trường lao động trong đó chú trọng phát triển 
                     năng lực toàn diện của người học thông qua môi trường học tập, sinh hoạt, rèn luyện mang tính mở, năng 
                     động và sáng tạo. Tỷ lệ sinh viên có việc làm sau khi tốt nghiệp 1 năm đạt trên 95%. Danh tiếng và vị thế
                      của Nhà trường đã được khảng định và từng bước được nâng cao trong nước và khu vực, trung bình mỗi năm có
                     trên 100.000 nguyện vọng xét tuyển vào trường.
                </div>
            </div>
            <div class="about1">
                <div class="title-about">Quá trình hình thành</div>
                <div class="content-about">Hằng năm, số lượng sinh viên Trường Đại học Công nghiệp Hà Nội đăng ký đặt mua quần áo
                     đồng phục lên đến con số hàng nghìn.Tuy nhiên hiện tại, công việc quản lý đồng phục vẫn phải thực hiện thủ công: 
                     Giáo viên thể chất và giáo viên quân sự sẽ yêu cầu sinh viên điền thông tin vào danh sách đăng kí đặt mua, thuê đồng phục
                      và gửi lên trung tâm giáo dục thể chất. Điều đó gây khó khăn và tốn rất nhiều thời gian công sức trong quá trình quản lý. 
                      Đặc biệt với bối cảnh hiện nay, với số lượng sinh viên ngày càng gia tăng, thì việc quản lý càng trở nên khó khăn . Xuất phát
                     từ vấn đề đó, bản thân là sinh viên của Trường Đại học Công nghiệp Hà Nội, muốn góp phần nhỏ để giúp đỡ các thầy cô trong việc
                      quản lý đồng phục nên em đã xây dựng phần mềm “Quản lí Đồng phục”.
                </div>
            </div>
            <div class="about1">
                <div class="title-about">Mục tiêu
                </div>
                <div class="content-about">Trở thành trang quản lý hàng đầu tại Việt Nam. Không chỉ giúp cho sinh viên không chỉ Trường đại học Công nghiệp HÀ Nội
                    mà hướng đến sinh viên khắp khu vực miền Bắc có thể dễ dàng đặt mua đồng phục một cách nhanh gọn và dễ dàng nhất.
                </div>
            </div>
           <!--  <div class="about1">
                <div class="title-about">Giá trị cốt lõi
                </div>
                <div class="content-about">TÂM: AUTOPRO luôn lấy chữ TÂM để phục vụ Khách hàng, Đối tác
                </div>
                <div class="content-about">TÍN: AUTOPRO luôn lấy chữ TÍN để xây dựng thương hiệu và bảo vệ chữ TÍN như bảo
                    vệ tính mạng của chính mình</div>
                <div class="content-about">NHÂN: AUTOPRO luôn lấy chữ NHÂN để tạo dựng doanh nghiệp phát triển bền vững và
                    trường tồn</div>
            </div>
            <div class="about1">
                <div class="title-about"></div>
                <div class="content-about">
                    Với phương châm cùng hợp tác - cùng phát triển bền vững, chúng tôi cam kết luôn mang đến cho Quý Đối
                    tác: CHẤT LƯỢNG TỐT NHẤT - GIÁ CẢ HỢP LÝ NHẤT - DỊCH VỤ TỐT NHẤT. Chúng tôi rất tin tưởng vào sự thành
                    công tốt đẹp và lâu dài trong quá trình hợp tác giữa chúng tôi và Quý Khách hàng - Quý Đối tác.
                </div>
            </div> -->
        </div>
        <TheFooter></TheFooter>
    </div>
</template>
  
<script>
import TheFooter from '@/layout/TheFooter.vue';
import TheHeader from '@/layout/TheHeader.vue';
import TheLineLink from '@/layout/TheLineLink.vue';
import TheNavbar from '@/layout/TheNavbar.vue';
import MLoading from '@/components/MLoading.vue';

export default {
    /**
     * Tên component
     */
    name: 'About',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { TheHeader, TheNavbar, TheFooter, TheLineLink, MLoading },
    /**
     * Emit sự thay đổi
     */
    emits: ["update:showLoading"],
    directives: {

    },
    /**
     * Data
     */
    data() {
        return {
            showLoading: false,
        }
    },
    /**
     * Phương thức
     */
    methods: {

    },
    created() {
        this.showLoading = true;
        setTimeout(async () => {
            this.showLoading = false;
        }, 500);
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    },
    mounted() {

    }
}
</script>
  
<style>
@import url(../../css/about.css);
</style>