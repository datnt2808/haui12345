<template>
  <div>
    <router-view />
  </div> 
</template>

<script>
import {useToast} from "vue-toastification";
export default {
  setup(){
    const toast = useToast(); 
    return { toast }
  }, 
  name: 'App', 
  data() {
    return { 
      roleApp: '', 
    }
  },
  components: {
  },
  created() {
    // this.$toast.success("ToastPlugin")   
    // this.$toast.success("Thành công")   
  }, 
  watch: {
    // roleApp(newVal) {
    //   if (newVal == "Admin") {
    //     this.$router.push('/admin/dashload');
    //   } else if (newVal == "User" || newVal == null) {
    //     this.$router.push('/');
    //   }
    // }
  }
}
</script>

<style>
@import url(../src/css/main.css);
</style>
