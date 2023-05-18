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
    
    getALProductComment(){
        let urlMain = `${this.getBaseService()}ProductComment`;
        return urlMain;
    }

    filterComment(key = '', pageSize, pageNumber) {
        return `${this.getALProductComment()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }

    deleteComment(id) {
        return `${this.getALProductComment()}/${id}`;
    }

}

const ApiUser = new UserService();
export default ApiUser;