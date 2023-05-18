import base from "./baseService";
class OrderService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}Orders`;
        return urlMain;
    }

    getOrderByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addOrder() {
        return `${this.getAll()}/`
    }

    updateOrder(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteOrderByID(id) {
        return `${this.getAll()}/${id}`;
    }

    getOrderDeatilByID(id) {
        return `${this.getAll()}/getOrderDetail/${id}`;
    }

    insertOrderDetail() {
        return `${this.getAll()}/insertOrderDetail`;
    }
    
    updateOrderDetail() {
        return `${this.getAll()}/updateOrderDetail`;
    }

    filterOrder(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }

    filterOrderByStatus(key = '', pageSize, pageNumber,status){
        return `${this.getAll()}/FilterByStatus?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}&status=${status}`;
    }

    getByUserID(id){
        return `${this.getAll()}/GetOrderByID?id=${id}`;
    }
}

const ApiOrder = new OrderService();
export default ApiOrder;