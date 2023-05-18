using AutoPro.Common.Entities.DTO;
using AutoPro.DL.BaseDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoPro.Common.Enum;
using System.Text.RegularExpressions;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.BL.BaseBL
{
    public class BaseBL<T> : IBaseBL<T>
    {
        #region Feild

        private IBaseDL<T> _baseDL;

        #endregion

        #region Contructor

        public BaseBL(IBaseDL<T> baseDL)
        {
            _baseDL = baseDL;
        }

        #endregion

        #region Method
        public object Filter(string? textSearch, long pageSize = 10, long pageNumber = 1)
        {
            // Nếu trang được chọn truyền vào là 0 thì set trang chọn là trang 1
            if (pageNumber == 0)
            {
                pageNumber = 1;
            }
            // Số bản ghi trên trang = 0 return null bắn lỗi nhập liệu
            if (pageSize == 0)
            {
                pageSize =  10;
            }
            //Gọi DL lấy danh sách
            return _baseDL.Filter(textSearch, pageSize, pageNumber);
        }
        /// <summary>
        /// Lấy tất cả bản ghi <typeparamref name="T"/>
        /// </summary>
        /// <returns>Danh sách các bản ghi <typeparamref name="T"/></returns>
        public List<T> GetAllRecords()
        {
            return _baseDL.GetAllRecord();
        }

        /// <summary>
        /// Lấy 1 bản ghi <typeparamref name="T"/>
        /// </summary>
        /// <param name="idRecord"> id bản ghi cần lấy </param>
        /// <returns> Bản ghi <typeparamref name="T"/> </returns>
        public T GetRecordByID(int idRecord)
        {

            return _baseDL.GetRecordByID(idRecord);
        }

        /// <summary>
        /// Thêm mới 1 bản ghi
        /// </summary>
        /// <param name="record"></param>
        /// <returns></returns>
        public ServiceResult InsertRecord(T record)
        {
            // validate
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
            var numberOfAffectedRows = _baseDL.InsertRecord(record);
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
                // Thất bại return lỗi server
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.Exception,
                        DevMsg = Common.Resource.DataResource.DevMsg_ServerError,
                        UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        MoreInfo = Common.Resource.Resource.UserMsg_ServerError

                    }
                };
            }

        }

        /// <summary>
        /// Cập nhật bản ghi
        /// </summary>
        /// <param name="record"></param>
        /// <param name="idRecord"></param>
        /// <returns></returns>
        public ServiceResult UpdateRecord(T record, int idRecord)
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
            var numberOfAffectedRows = _baseDL.UpdateRecord(record, idRecord);
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

        /// <summary>
        /// Xóa bản ghi
        /// </summary>
        /// <param name="idRecord"></param>
        /// <returns></returns>
        public ServiceResult DeleteRecord(int idRecord)
        {
            // thành công chạy proceduce
            var numberOfAffectedRows = _baseDL.DeleteRecord(idRecord);
            // Xử lí kết quả
            if (numberOfAffectedRows > 0)
            {
                // Thành công
                return new ServiceResult
                {
                    IsSuccess = true,
                };
            }
            else
            {
                // Thất bại
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.ServerError,
                        DevMsg = "",
                        UserMsg = "",
                        MoreInfo = ""
                    }
                };
            }
        }

        /// <summary>
        /// Validate chung
        /// </summary>
        /// <param name="record"></param>
        /// <returns></returns>
        protected virtual ServiceResult ValidateRequestData(T? record)
        {
            // Xử lý
            bool isValid = true;

            List<string> errorList = new List<string>();

            // Lấy các thuộc tính của record
            //var props = record.GetType().GetProperties();
            var props = typeof(T).GetProperties();


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

        /// <summary>
        /// Validate riêng
        /// </summary>
        /// <param name="record"></param>
        /// <returns></returns>
        protected virtual ServiceResult ValidateCustom(T? record)
        {
            return new ServiceResult 
            { 
                IsSuccess = true,
            };
        }

        #endregion

    }
}
