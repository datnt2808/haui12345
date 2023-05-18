import axios from "axios";
class axiosService {
    postRequest(url, param) {
        return axios.post(url, param);
    }
}
const axiosServiceDefault = new axiosService();
export default axiosServiceDefault;