const enumAUTO = {
    /**
     * Giới tính
     * CreateBy: DangPD
     */
    gender: {
        Male: 1,
        Female: 0,
        Other: 2,
    },
    /**
     * Loại form
     * CreateBy: DangPD
     */
    formMode: {
        add: "add",
        edit: "edit",
        copy: "copy",
    },
    /**
     * Keycode
     * CreateBy: DangPD
     */
    KEY_CODE: {
        ENTER: 13, // Phím enter
        ROW_UP: 38, // Phím lên
        ROW_DOWN: 40, // Phím xuống
        TAB: 9, // mã phím tab
        ESC: 27, // Mã phím Esc
        SPACE: 32, // Mã phím Space
        DELETE: 46, // Mã phím Delete
        BACKSPACE: 8, // Mã phím Backspace
        ARROW_LEFT: 37, // Mã phím Arrow Left
        ARROW_RIGHT: 39, // Mã phím Arrow Right

        F1: 112, // Mã phím F1
        S: 83, // Mã phím S
        N: 78, // Mã phím N
        E: 69, // Mã phím E
        R: 82, // Mã phím R
        L: 76, // Mã phím L
        A: 65, // Mã phím A
        C: 67, // Mã phím C
        D: 68, // Mã phím D

        ZERO: 48, // Mã phím 0
        ONE: 49, // Mã phím 1
        TWO: 50, // Mã phím 2
        THREE: 51, // Mã phím 3
    },
    /**
     * Trạng thái respone trả về
     * CreateBy: DangPD
     */
    status: {
        success: 1,
        badRequest: 400,
        exception: 0,
        serverError: 500,
        getSuccess: 200,
    },

    Operator: {
        Equal: 1,
        Like: 2,
    }
}
export default enumAUTO
