using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Enum
{
    /// <summary>
    /// Mã lỗi
    /// </summary>
    public enum ErrorCode
    {
        /// <summary>
        /// Lỗi ngoại lệ
        /// </summary>
        Exception = 0,

        /// <summary>
        /// Thêm thất bại
        /// </summary>
        InsertFail = 1,

        /// <summary>
        /// Sửa thất bại
        /// </summary>
        UpdateFail = 2,

        /// <summary>
        /// Xóa thất bại
        /// </summary>
        DeleteFail = 3,
        Success = 200,

        NoContent = 204,

        /// <summary>
        /// Lỗi dữ liệu đầu vào không hợp lệ
        /// </summary>
        InvalidData = 400,

        /// <summary>
        /// Lỗi mã không hợp lệ
        /// </summary>
        InvalidCode = 401,

        /// <summary>
        /// Lỗi tên không hợp lệ
        /// </summary>
        InvalidName = 402,

        /// <summary>
        /// Số chứng minh nhân dân không hợp lệ
        /// </summary>
        InvalidId = 403,

        /// <summary>
        /// Lỗi sai url
        /// </summary>
        NotFound = 404,

        /// <summary>
        /// Lỗi email vào không hợp lệ
        /// </summary>
        InvalidEmail = 405,

        /// <summary>
        /// Lỗi trùng mã
        /// </summary>
        DuplicateCode = 407,

        /// <summary>
        /// Lỗi mã trống
        /// </summary>
        NotEmptyCode = 408,

        /// <summary>
        /// Lỗi tên trống
        /// </summary>
        NotEmptyName = 409,

        /// <summary>
        /// Lỗi phòng ban trống
        /// </summary>
        NotEmptyDepartment = 410,

        /// <summary>
        /// Lỗi phía back-end
        /// </summary>
        ServerError = 500,

        NoDefine = 000,

    }
    public enum EntityState
    {
        Add = 1,
        Edit = 2,
        Delete = 3
    }
    public enum Rating
    {

        //HoanToanKhongHaiLong
        StronglyDisagree = 1,
        //KhongHaiLong
        Disagree = 2,
        // Trung lap
        Neutral= 3,
        // Đồng ý
        Agree = 4,
        // Hoàn toàn đồng ý
        StronglyAgree = 5
    }
    public enum Operator
    {
        [Display(Name = "EQUAL")]
        EQUAL = 1,

        [Display(Name = "LIKE")]
        LIKE = 2
    }

    public enum OrderByType
    {
        ASC = 1,
        DESC = 2
    }

    public enum AccountStatus
    {
        [Display(Name = "Chưa kích hoạt")]
        NotActive = 1,

        [Display(Name = "Đã kích hoạt")]
        Active = 2,
    }

    public enum ProductSortOrder
    {
        [Display(Name = "Mới nhất")]
        Newest = 1,

        [Display(Name = "Giá thấp đến cao")]
        PriceAsc = 2,

        [Display(Name = "Giá cao xuống thấp")]
        PriceDes = 3
    }


    public enum OrderStatus
    {
        [Display(Name = "Đặt hàng thành công")]
        Success = 1,

        [Display(Name = "Đang chờ xử lí")]
        WaitingReceive = 2,

        [Display(Name = "Đơn hàng đã bị hủy")]
        Destroy = 3,

        [Display(Name = "Đơn hàng đã duyệt")]
        Aprove = 4,

        [Display(Name = "Hoàn hàng")]
        Cancel = 5,

        [Display(Name = "Đơn hàng hoàn")]
        Return = 6,
    }

    public enum CheckoutType
    {
        [Display(Name = "Thanh toán qua VNPAY")]
        VNPAY = 1,

        [Display(Name = "Thanh toán khi nhận hàng")]
        COD = 2,
    }

    public enum CheckoutStatus
    {
        [Display(Name = "Đã thanh toán")]
        Done = 1,

        [Display(Name = "Chưa thanh toán")]
        NotPay = 2,
    }

    public enum Gender
    {
        Male = 0,
        Female = 1,
        Orther = 2
    }

}
