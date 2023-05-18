using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.ProceduceName
{
    public static class ProceduceName
    {
        // Store proceduce Name của lấy tất cả bản ghi
        public static string GetAllRecord = "Proc_{0}_GetAll";

        // Store proceduce Name của lấy 1 bản ghi
        public static string GetRecordByID = "Proc_{0}_GetByID";

        // Store proceduce Name của thêm 1 bản ghi mới
        public static string Insert = "Proc_{0}_Insert";

        // Store proceduce Name của sửa 1 bản ghi 
        public static string Update = "Proc_{0}_Update";

        // Store proceduce Name của xóa 1 bản ghi 
        public static string Delete = "Proc_{0}_Delete";

        // Filter và paging trang 
        public static string PagingAndFilter = "Proc_{0}_Filter";

        // Xóa nhiều
        public static string DeleteMultiple = "Proc_{0}_DeleteMultiple";

        // Kiểm tra tồn tại
        public static string IsExistAccount = "Proc_{0}_DuplicateAccount";

        public static string IsExistEmail = "Proc_{0}_DuplicateEmail";

        // Đăng kí
        public static string Register = "Proc_{0}_Register";

        // Đăng nhập
        public static string Login = "Proc_{0}_Login";

        // Quên mật khẩu
        public static string ForgotPassword = "Proc_{0}_ForgotPassword";

    }
}
