import base from "./baseService";
class NewsService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}News`;
        return urlMain;
    }

    getNewsByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addNews() {
        return `${this.getAll()}/`
    }

    updateNews(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteNewsByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterNews(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiNews = new NewsService();
export default ApiNews;