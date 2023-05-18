<template>
    <div class="aform-detail">
        <div class="aform-account">
            <div class="aform-title">
                <div class="aform-title-left">
                    {{ this.title }}
                </div>
                <div class="onClose" @click="onClose">
                    <i class="fa-regular fa-circle-xmark"></i>
                </div>
            </div>
            <div style="display: flex;width:100%;height: 300px;">
                <div class="agroup1n" style="width: 48%;">
                    <div class="acol1n">
                        <div class="acol1n-text">
                            Tiêu đề :
                        </div>
                        <MInput type="text" v-model="news.newsTitle" ref="newsTitle" messError="Tiêu đề không được bỏ trống"
                            styleInput="width: 400px; height: 30px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;">
                        </MInput>
                    </div>
                    <div class="acol1n">
                        <div class="acol1n-text">
                            Nội dung ngắn :
                        </div>
                        <textarea type="text" v-model="news.contentShorted"
                            style="width: 400px;height:250px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"></textarea>
                    </div>
                </div>
                <div class="agroup1n" style="width: 50%;">
                    <div class="acol1n">
                        <div class="acol1n-text">
                            Nội dung :
                        </div>
                        <textarea type="text" v-model="news.content"
                            style="width: 500px;height: 290px; font-size:13px; padding-left:15px; border-radius:4px;box-sizing: border-box;"></textarea>
                    </div>
                </div>
            </div>
            <div class="agroup1image">
                <div class="acol1-image">
                    <div class="aco1-image-file">
                        <div class="acol1-text">
                            Hình ảnh :
                        </div>
                        <input type="file" ref="fileInput" @change="handleFileUpload()" />
                    </div>
                    <img :class="{ 'ImageNone': ImageNone }" :src="srcImage" alt=""
                        style="height: 100px;width: 100px;display: none;border: 1px solid #bbb;margin-left: 150px;margin-top: 10px;">
                </div>
            </div>
            <div class="acol2-link">
                <div class="acol1-text" style="width: 150px;display: none;">
                    Linh đường dẫn :
                </div>
                <MInput type="text" v-model="news.image" styleInput="width: 900px; height: 30px;display: none;">
                </MInput>
            </div>
            <div class="aformSave" @click="save(news)">
                <button>Lưu</button>
            </div>
        </div>
        <MLoading v-if="showLoading"></MLoading>
    </div>
</template>
  
<script>
import MInput from '@/components/MInput.vue'; import Resource from '../../js/gResource';
import axios from 'axios';
import {
    getDownloadURL,
    getStorage,
    ref,
    uploadBytesResumable,
} from "firebase/storage";
import MLoading from '@/components/MLoading.vue';
import ApiNews from '../../js/apiNews';
import MDatePicker from '@/components/MDatePicker.vue';
export default {
    /**
     * Tên component
     */
    name: "AdminNewsDetail",
    /**
     * Hứng nhận
     */
    props: ["id", "type"],
    /**
     * Component được sử dụng
     */
    components: { MInput, MLoading, MDatePicker },
    /**
     * Emit sự thay đổi
     */
    emits: ["onClose", "success"],
    directives: {},
    /**
     * Data
     */
    data() {
        return {
            news: {
                newsDate: new Date(),
                newsTitle: "",
            },
            showLoading: false,
            title: '',
            srcImage: "",
            ImageNone: false
        };
    },
    /**
     * Phương thức
     */
    methods: {
        questionSaveItem(item) {
            let text = `Bạn có muốn lưu tin tức ${item.newsTitle} không ?`;
            if (confirm(text) == true) {
                this.saveNews();
            } else {
                this.$emit("onClose");
            }
        },

        async handleFileUpload() {
            //   const storageRef = ref(storage, "user/" + this.file.name);
            //   console.log(this.$refs.fileInput.files[0]);
            //   uploadBytes(storageRef,this.$refs.fileInput.files[0])
            //   .then((snapshot) => {
            //     console.log("ok");
            //   });
            let file = this.$refs.fileInput.files[0];
            const storage = getStorage();
            //   const metadata = {
            //     contentType: "image/jpeg/png",
            //   };
            const storageRef = ref(storage, "News/" + file.name);
            const uploadTask = uploadBytesResumable(
                storageRef,
                this.$refs.fileInput.files[0]
                // metadata
            );

            uploadTask.on(
                "state_changed",
                (snapshot) => {
                    // console.log(snapshot);
                    let process = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    // console.log(process);
                    if (process == 100) {
                        console.log("tải ảnh lên thành công");
                    }
                },
                (error) => {
                    console.log(error);
                    alert("Tải ảnh lỗi");
                },
                () => {
                    // uploadTask.pause();
                    // Handle successful uploads on complete
                    // For instance, get the download URL: https://firebasestorage.googleapis.com/...
                    getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
                        // console.log(downloadURL);
                        this.srcImage = downloadURL;
                        this.ImageNone = true;
                        this.news.image = downloadURL;
                        alert("Đã tải ảnh xong");
                    });
                }
            );
        },
        onClose() {
            // uploadTask.cancel();
            this.$emit("onClose");
        },

        formatDate(datetime) {
            try {
                return formatDate(datetime);
            } catch (error) {
                console.log(error);
            }
        },
        validateForm() {
            let validate = true;
            if (this.news.newsTitle.trim().length <= 0) {
                this.$refs.newsTitle.validate();
                validate = false;
            }
            return validate;
        },
        
        save(data) {
            if (!this.validateForm()) {
                alert("Bạn đã nhập thiếu thông tin")
            } else {
                this.questionSaveItem(data);
            }
        },

        async saveNews() {
            setTimeout(async () => {
                if (this.type == Resource.FormAdminType.Add) {
                    await axios.post(ApiNews.addNews(), this.news)
                        .then((res) => {
                            if (res.status == 201) {
                                this.$toast.success("Tạo thành công");
                                this.$emit("onClose");
                                this.$emit("success");
                            }
                        })
                        .catch((err) => {
                            this.$toast.error("Tạo thất bại");
                            console.log(err);
                        })
                } else {
                    this.news.image = this.srcImage;
                    await axios.put(ApiNews.updateNews(this.id), this.news)
                        .then((res) => {
                            if (res.status == 200) {
                                this.$toast.success("Cập nhật thành công");
                                this.$emit("success");
                                this.$emit("onClose");
                            }
                        })
                        .catch((err) => {
                            this.$toast.error("Cập nhật thất bại");
                            console.log(err);
                        })
                }
            }, 500)
        }
    },
    created() {
        this.srcImage = "";
        // Khởi tạo lấy giá trị id truyền vào
        if (this.id) {
            // Bật loadding
            this.showLoading = true;
            setTimeout(() => {
                this.title = Resource.TitleFormAdmin.UpdateNews;
                //Lấy dữ liệu
                axios.get(ApiNews.getNewsByID(this.id))
                    .then((res) => {
                        this.showLoading = false;
                        this.news = res.data;
                        this.srcImage = res.data.image;
                        if (this.srcImage) {
                            this.ImageNone = true;
                        }
                        // console.log(this.srcImage);
                    })
            }, 500)
        } else {
            this.title = Resource.TitleFormAdmin.AddNews;
        }
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {
        srcImage(newVal) {
            this.news.image = newVal;
        }
    },
};
</script>
  
<style>
@import url(../../css/admin/adminaccount.css);
</style>