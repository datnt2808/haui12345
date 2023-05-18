import base from "./baseService";
class ContactService extends base {
    getAll() {
        let urlMain = `${this.getBaseService()}Contact`;
        return urlMain;
    }

    getContactByID(id) {
        return `${this.getAll()}/${id}`;
    }

    addContact() {
        return `${this.getAll()}/`
    }

    updateContact(id) {
        return `${this.getAll()}/${id}`;
    }

    deleteContactByID(id) {
        return `${this.getAll()}/${id}`;
    }

    filterContact(key = '', pageSize, pageNumber) {
        return `${this.getAll()}/Filter?textSearch=${key}&pageSize=${pageSize}&pageNumber=${pageNumber}`;
    }
}

const ApiContact = new ContactService();
export default ApiContact;