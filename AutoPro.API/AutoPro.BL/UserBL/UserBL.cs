using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using AutoPro.DL.UserDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.BL.UserBL
{
    public class UserBL : BaseBL<User>, IUserBL
    {

        private IUserDL _userDL;

        public UserBL(IUserDL userDL) : base(userDL)
        {
            _userDL = userDL;
        }

        public object checkLogin(string Account, string Password)
        {
            return _userDL.checkLogin(Account, Password);
        }

        public ServiceResult UpdateAdmin(User record, int idRecord)
        {
            // Lấy kết quả trả về bên Data Layer
            var validateResults = ValidateRequestData(record);

            // thất bại return lỗi
            if (validateResults != null)
            {
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = validateResults.Data
                };
            }

            // thành công chạy proceduce
            var numberOfAffectedRows = _userDL.UpdateAdmin(record, idRecord);
            // Xử lí kết quả thành công
            if (numberOfAffectedRows > 0)
            {
                return new ServiceResult
                {
                    IsSuccess = true,
                };
            }
            else
            {
                // Thất bại lỗi server
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.ServerError,
                        DevMsg = Common.Resource.DataResource.DevMsg_ServerError,
                        UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        MoreInfo = Common.Resource.Resource.UserMsg_ServerError
                    }
                };
            }
        }

        protected virtual ServiceResult ValidateRequestData(User? record)
        {
            // Xử lý
            bool isValid = true;

            List<string> errorList = new List<string>();

            // Lấy các thuộc tính của record
            //var props = record.GetType().GetProperties();
            var props = typeof(User).GetProperties();


            foreach (var prop in props)
            {
                // Value của thuộc tính
                var propValue = prop.GetValue(record);

                // Lấy danh sách các trường cần validate
                var attrCustoms = prop.GetCustomAttributes(true);
                foreach (var attrCustom in attrCustoms)
                {
                    var typeofAttr = attrCustom.GetType();
                    // Validate mã nhân viên bỏ trống
                    if (typeofAttr == typeof(AccountNotEmpty))
                    {
                        if (string.IsNullOrEmpty(propValue?.ToString()?.Trim()))
                        {
                            isValid = false;
                            errorList.Add(Common.Resource.Resource.UserMsg_AccountEmpty);
                        }
                    }
                    // Validate tên nhân viên bỏ trống
                    if (typeofAttr == typeof(FullNameNotEmpty))
                    {
                        if (string.IsNullOrEmpty(propValue?.ToString()?.Trim()))
                        {
                            isValid = false;
                            errorList.Add(Common.Resource.Resource.UserMsg_FullNameEmpty);
                        }
                    }
                    // Validate phòng ban bỏ trống

                    if (typeofAttr == typeof(PassWordNotEmpty))
                    {
                        if (string.IsNullOrEmpty(propValue?.ToString()?.Trim()))
                        {
                            isValid = false;
                            errorList.Add(Common.Resource.Resource.UserMsg_PasswordEmpty);
                        }
                    }

                    // Validate email bỏ trống

                    if (typeofAttr == typeof(EmailNotEmpty))
                    {
                        if (string.IsNullOrEmpty(propValue?.ToString()?.Trim()))
                        {
                            isValid = false;
                            errorList.Add(Common.Resource.Resource.UserMsg_EmailEmpty);
                        }
                    }

                    // Validate password có độ dài hơn 20
                    if (typeofAttr == typeof(MaxLengthPassword))
                    {
                        if (propValue?.ToString()?.Trim()?.Length > 20)
                        {
                            isValid = false;
                            errorList.Add(Common.Resource.Resource.UserMsg_PasswordMaxlength);
                        }
                    }


                    // Validate ngày sinh lớn hơn ngày hiện tại
                    if (typeofAttr == typeof(DateOfBirthLongerNow) && propValue?.ToString()?.Trim()?.Length > 0)
                    {
                        if ((DateTime)propValue > DateTime.Now)
                        {
                            isValid = false;
                            errorList.Add(Common.Resource.Resource.UserMsg_DateOfBirthLongerNow);
                        }
                    }

                    Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                    // Validate email
                    if (typeofAttr == typeof(RegexEmail) && propValue?.ToString()?.Trim()?.Length > 0)
                    {
                        var Success = regex.Match(input: propValue?.ToString()?.Trim());
                        if (!Success.Success)
                        {
                            isValid = false;
                            errorList.Add(Common.Resource.Resource.UserMsg_EmailRegex);
                        }
                    }

                }
            }

            // isValid bằng false thì moreinfo bằng list errorList
            if (!isValid)
            {
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                        MoreInfo = errorList
                    }
                };
            }

            // Kiểm tra custom validate(trường kiểm tra trùng mã)
            //var validateCustom = ValidateCustom(record);
            // Có lõi trùng return lỗi
            //if (!validateCustom.IsSuccess)
            //{
            //    return validateCustom;
            //}

            return null;
        }
        protected override ServiceResult ValidateCustom(User? record)
        {
            var isValid = true;

            // Trả về chuỗi lỗi
            List<string> errorList = new List<string>();

            // Lấy kết quả exist
            bool duplicateAccount = _userDL.IsExistAccount(record);
            bool duplicateEmail = _userDL.IsExistEmail(record);

            // Lấy các thuộc tính của record
            var props = typeof(User).GetProperties();

            foreach (var prop in props)
            {
                // Kiểm tra account
                var duplicateAccountAttribute = prop.GetCustomAttribute(typeof(DuplicateAccount), true);
                if (duplicateAccountAttribute != null)
                {
                    // Kiểm tra tồn tại
                    if (duplicateAccount)
                    {
                        isValid = false;
                        errorList.Add(Common.Resource.Resource.UserMsg_DuplicateAccount);
                    }
                }

                // Kiểm tra email
                var duplicateEmailAttribute = prop.GetCustomAttribute(typeof(DuplicateAccount), true);
                if (duplicateEmailAttribute != null)
                {
                    // Kiểm tra tồn tại
                    if (duplicateEmail)
                    {
                        isValid = false;
                        errorList.Add(Common.Resource.Resource.UserMsg_DuplicateEmail);
                    }
                }

            }
            if (!isValid)
            {
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                        MoreInfo = errorList
                    }
                };
            }
            return null;
        }

        public string forgotPassword(Forgot forgot)
        {
            if(string.IsNullOrEmpty(forgot.email) || string.IsNullOrEmpty(forgot.email))
            {
                return null;
            }
            return _userDL.forgotPassword(forgot);
        }

        public bool updatePass(UpdatePass updatePass)
        {
            if(updatePass.id == null || string.IsNullOrEmpty(updatePass.passold) || string.IsNullOrEmpty(updatePass.passnew))
            {
                return false;
            }
            return _userDL.updatePass(updatePass);
        }
    }
}
