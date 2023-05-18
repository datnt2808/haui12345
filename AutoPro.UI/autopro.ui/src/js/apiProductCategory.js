import base from "./baseService";
class ProductCategoryService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}ProductCategory`;
        return urlMain;
    }

    getProductCategoryByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addProductCategory() {
        return `${this.getAll()}/`
    }

    updateProductCategory(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteProductCategoryByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterProductCategory(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiProductCategory = new ProductCategoryService();
export default ApiProductCategory;