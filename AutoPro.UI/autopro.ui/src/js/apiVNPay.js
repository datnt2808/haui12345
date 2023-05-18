import axios from 'axios';
import base from './baseService';
class PaymentService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}Payment`;
        return urlMain;
    }
    /**
     * lấy link thanh toán vnpay
     * @returns 
     */
    getVNPayLink(param) {
        return axios
            .post(`${this.getAll()}/redirect - vnpay`, param);
    }

}
const ApiVNPayService = new PaymentService();
export default ApiVNPayService;