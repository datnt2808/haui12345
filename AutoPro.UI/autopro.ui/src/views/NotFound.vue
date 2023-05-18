<template>
    <div>
        <div class="not-found">
            <img src="../assets/Image/404.jpg" alt="">
        </div>
    </div>
</template>

<script>

export default {
    /**
 * Tên component
 */
    name: 'NotFound ',
    /**
     * Hứng nhận
     */
    props: [""],
    /**
     * Component được sử dụng
     */
    components: { },
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

        }
    },
    /**
     * Phương thức
     */
    methods: {

    },
    created() {

    },
    /**
     * Theo dõi sự thay đổi
     */
    watch: {

    }
}
</script>

<style>
.not-found {
    margin: 140px 100px 0;
}

.not-found img {
    display: flex;
    align-items: center;
    margin: 0 auto;
    width: 500px;
    height: 500px;
}
</style>