
/**
 * Ẩn khi click outside
 * CreateBy: DangPD
 */
const clickoutside = {
    mounted(el, binding) {
        el.clickOutsideEvent = (event) => {
            // Nếu element hiện tại không phải là element đang click vào
            // Hoặc element đang click vào không phải là button trong combobox hiện tại thì ẩn đi.
            if (
                !(
                    (
                        el === event.target || // click phạm vi của combobox__data
                        el.contains(event.target) || //click vào element con của combobox__data
                        el.previousElementSibling.contains(event.target)
                    ) //click vào element button trước combobox data (nhấn vào button thì hiển thị)
                )
            ) {
                // Thực hiện sự kiện tùy chỉnh:
                binding.value(event, el);
                // vnode.context[binding.expression](event); // vue 2
            }
        };
        document.body.addEventListener('click', el.clickOutsideEvent);
    },
    beforeUnmount: (el) => {
        document.body.removeEventListener('click', el.clickOutsideEvent);
    },
};

/**
 * hàm format giới tính
 * CreateBy: DangPD
 * @param {*} data 
 * @returns 
 */
function formatGender(data) {
    try {
        if (data == '0') {
            return 'Nam';
        } else if (data == '1') {
            return 'Nữ';
        } else if (data == '2') {
            return 'Khác';
        }
        return '';
    } catch (error) {
        console.log(error);
    }
}

/**
 * Hàm format thời gian
 * CreateBy: DangPD
 * @param {*} datetime 
 * @returns 
 */
function formatDate(datetime) {
    try {
        if (datetime != null && datetime != undefined) {
            //Chuyển thành dữ liệu ngày tháng
            datetime = new Date(datetime);
            let date = datetime.getDate();
            date = date < 10 ? `0${date}` : date;
            let month = datetime.getMonth() + 1;
            month = month < 10 ? `0${month}` : month;
            let year = datetime.getFullYear();
            return `${date}/${month}/${year}`;
        } else {
            return "";
        }
    } catch (error) {
        return "";
    }
}

function formatStatusProduct(quantity) {
    try {
        if (quantity <= 0) {
            return 'Đã hết hàng';
        } else if (quantity > 0 && quantity <= 10) {
            return 'Sắp hết hàng';
        } else {
            return 'Còn hàng';
        }
        return '';
    } catch (err) {
        console.log(err);
    }
}
function formatMoney(money) {
    try {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(money);
    } catch (error) {
        console.log(error);
        return "";
    }
}

function ketquaVNpay(status) {
    try {
        if (status == 0) {
            return "Giao dịch thành công";
        } else if (status == 9) {
            return "Thanh toán không thành công";
        } else {
            return "Thanh toán không thành công";
        }
    } catch (err) {
        console.log(err);
    }
}

function statusOrders(status) {
    try {
        if (status == 1) {
            return "Đơn hàng thành công";
        } else if (status == 2) {
            return "Đơn hàng đang xử lí";
        } else if (status == 3) {
            return "Đơn hàng  đã bị hủy";
        } else if (status == 4) {
            return "Đơn hàng đã được duyệt";
        } else if (status == 5) {
            return "Đơn hàng hoàn chờ duyệt";
        } else if (status == 6) {
            return "Đơn hàng hoàn đã được duyệt";
        } else {
            return "";
        }
    } catch (err) {
        console.log(err);
    }
}

function formatNumber(number) {
    return new Intl.NumberFormat("de-DE").format(number);
}

/**
 * Fetch Api
 * CreateBy: DangPD
 * @param {*} url 
 * @param {*} method 
 * @param {*} fnCallBack 
 * @param {*} data 
 * @param {*} typeRes 
 * @returns 
 */
function fetchAPI(url, method, fnCallBack, data, typeRes) {
    return fetch(url, {
        method: method,
        headers: {
            Accept: 'application/json, text/plain',
            'Content-Type': 'application/json;charset=UTF-8',
        },
        body: JSON.stringify(data),
    })
        .then((res) => {
            switch (typeRes) {
                case 'blob':
                    return res.blob();
                default:
                    break;
            }
            return res.json();
        })
        .then((res) => {
            return fnCallBack(res)
        })
        .catch(err => console.log(err));
}
export { clickoutside, statusOrders,ketquaVNpay, formatNumber, formatStatusProduct, formatMoney, formatDate, formatGender, fetchAPI };
