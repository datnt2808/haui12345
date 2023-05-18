import base from "./baseService";
class ProductFavoriteService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}ProductFavorite`;
        return urlMain;
    }

    getProductFavoriteByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addProductFavorite() {
        return `${this.getAll()}/`
    }

    updateProductFavorite(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteProductFavoriteByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterProductFavorite(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiProductFavorite = new ProductFavoriteService();
export default ApiProductFavorite;