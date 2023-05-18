import base from "./baseService";
class UserService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}User`;
        return urlMain;
    }

    getUserById(id) {
        return `${this.getAll()}/${id}`;
    }

    addUser() {
        return `${this.getAll()}/`
    }

    login() {
        return `${this.getAll()}/login`
    }

    updateUser(id) {
        return `${this.getAll()}/${id}`;
    }

    updateAdmin(id) {
        return `${this.getAll()}/admin/${id}`;
    }

    updateAdmin(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteUserByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterUser(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }

    filterComment(key = '', pageSize, pageNumber) {
        return `https://localhost:7129/api/v1/ProductComment/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }

    deleteComment(id) {
        return `https://localhost:7129/api/v1/ProductComment/${id}`;
    }

}

const ApiUser = new UserService();
export default ApiUser;