import base from "./baseService";
class NewsCommentService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}NewsComment`;
        return urlMain;
    }

    getNewsCommentByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addNewsComment() {
        return `${this.getAll()}/`
    }

    updateNewsComment(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteNewsCommentByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterNewsComment(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiNewsComment = new NewsCommentService();
export default ApiNewsComment;