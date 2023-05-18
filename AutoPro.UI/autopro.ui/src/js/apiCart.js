import base from "./baseService";
class BrandService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}Brand`;
        return urlMain;
    }

    getBrandByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addBrand() {
        return `${this.getAll()}/`
    }

    updateBrand(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteBrandByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterBrand(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiBrand = new BrandService();
export default ApiBrand;