import base from "./baseService";
class ProductService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}Product`;
        return urlMain;
    }

    getProductByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addProduct() {
        return `${this.getAll()}/`
    }

    updateProduct(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteProductByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterProduct(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiProduct = new ProductService();
export default ApiProduct;