<template>
  <div>
    <div class="ahomecontent">
      <AdminNavbar @infoAdmin="infoAdmin" @showUpdate="showUpdate"></AdminNavbar>
      <div class="arouter-view-content" style="z-index: 1;">
        <router-view></router-view>
      </div>
    </div>
    <AdminInfo v-if="showPopup" @onClose="showPopup = false" :id="userID" @success="success"></AdminInfo>
    <UpdatePassword v-if="showUpdateAdmin" @onClose="showUpdateAdmin = false"></UpdatePassword>
  </div>
</template>

<script>
import AdminNavbar from '@/layout/AdminNavbar.vue';
import AdminInfo from './AdminInfo.vue';
import axios from 'axios';
import ApiUser from '@/js/apiUser';
import UpdatePassword from '../user/UpdatePassword.vue';
export default {
  /**
         * Tên component
         */
  name: 'AdminHome',
  /**
   * Hứng nhận
   */
  props: [""],
  /**
   * Component được sử dụng
   */
  components: { AdminNavbar, AdminInfo, UpdatePassword },
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
      showLoading: false,
      admin: {},
      userID: '',
      showUpdateAdmin: false,
      nombreRuta: '',
    }
  },
  /**
   * Phương thức
   */
  methods: {
    infoAdmin() {
      this.showPopup = true;
    },

    showUpdate() {
      this.showUpdateAdmin = true;
    },

    success() {

    },
    getAdmin() {
      const login = localStorage.getItem("UserID");
      const role = localStorage.getItem("Role");
      if (role == "User" || role == null) {
        this.$router.push('/forbidden');
        return;
      }

      this.userID = login;
      // console.log(this.userID);
      if (this.userID != null) {
        axios.get(ApiUser.getUserById(login))
          .then((res) => {
            if (res.status == 200) {
              this.admin = res.data;
              // console.log(this.admin);
              let fullpath = this.currentRoute;
              if (fullpath == '/admin/' || fullpath == '/admin') {
                this.$router.push('/admin/dashload')
              }
            }
          })
      }
      else {
        this.$router.push('/account/sign-up')
      }
    }
  },
  created() {
    this.getAdmin();
  },
  /**
   * Theo dõi sự thay đổi
   */
  watch: {

  },
  computed: {
    currentRoute: function () {
      let path = this.$route.path;
      // console.log(path);
      return path;
    }
  }
}
</script>

<style>
@import url(../../css/admin/adminhome.css);
</style>