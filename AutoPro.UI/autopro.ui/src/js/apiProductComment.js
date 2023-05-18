import base from "./baseService";
class ProductCommentService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}ProductComment`;
        return urlMain;
    }

    getProductCommentByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addProductComment() {
        return `${this.getAll()}/`
    }

    updateProductComment(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteProductCommentByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterProductComment(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiProductComment = new ProductCommentService();
export default ApiProductComment;