<template>
    <div>
        <div style="display: flex;">
            <div style="width: 150px;">Hình ảnh :</div>
            <input type="file" ref="fileInput" @change="handleFileUpload()" />
        </div>
        <img :class="{ 'ImageNone': ImageNone }" :src="srcImage" alt="" style="height: 100px;width: 100px;display: none;">
    </div>
</template>

<script>
export default {
    /**
     * Tên component
     */
    name: "UploadFile",
    /**
     * Hứng nhận
     */
    props: ["FolderName"],
    /**
     * Component được sử dụng
     */
    components: {},
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
            srcImage: "",
            ImageNone: false,
            Folder: ""
        };
    },
    /**
     * Phương thức
     */
    methods: {
        handleFileUpload: async function () {
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
            const storageRef = ref(storage, "Brand/" + file.name);
            const uploadTask = uploadBytesResumable(
                storageRef,
                this.$refs.fileInput.files[0]
                // metadata
            );
            uploadTask.on(
                "state_changed",
                (snapshot) => {
                    let process = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    // console.log(process);
                    if (process == 100) {
                        console.log("tải lên thành công");
                    }
                },
                (error) => {
                    console.log(error);
                    alert("Tải ảnh lỗi");
                },
                () => {
                    // Handle successful uploads on complete
                    // For instance, get the download URL: https://firebasestorage.googleapis.com/...
                    alert("Đã tải ảnh xong");
                    getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
                        console.log(downloadURL);
                        this.srcImage = downloadURL;
                        this.ImageNone = true;
                    });
                    // uploadTask.snapshot.ref.getDownloadURL().then((downloadURL) => {
                    //   console.log(downloadURL);
                    //   //   this.product.images.push(downloadURL);
                    // });
                }
            );
        },
    },
    created() {
        this.Folder = this.FolderName;
    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {},
}
</script>

<style>
@import url(../css/upload.css);
</style>