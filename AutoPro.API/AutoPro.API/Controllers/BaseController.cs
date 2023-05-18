using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BaseController<T> : ControllerBase
    {
        #region Feild
        private IBaseBL<T> _baseBL;

        #endregion

        #region Contructor
        public BaseController(IBaseBL<T> baseBL)
        {
            _baseBL = baseBL;
        }
        #endregion
        #region Method
        [HttpGet("Filter")]
        public IActionResult Filter([FromQuery] string? textSearch, [FromQuery] long pageSize =10, [FromQuery] long pageNumber =1)
        {
            try
            {
                // Lấy kết quả trả về bên Bussiness Layer
                var filterEmployee = _baseBL.Filter(textSearch, pageSize, pageNumber);

                // Thành công return danh sách record
                if (filterEmployee != null)
                {
                    return StatusCode(StatusCodes.Status200OK, filterEmployee);
                }else if(filterEmployee == null)
                {
                    return StatusCode(StatusCodes.Status204NoContent, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.NoContent,
                        DevMsg = Common.Resource.DataResource.DevMsg_ServerError,
                        UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        MoreInfo = Common.Resource.Resource.NoContent,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }
                // Nếu null thất bại return lỗi nhập liệu
                //else if ((object)filterEmployee == null)
                //{
                //    return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                //    {
                //        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                //        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                //        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                //        MoreInfo = Common.Resource.Resource.UserMsg_PasswordMaxlength,
                //        TraceId = HttpContext.TraceIdentifier
                //    });
                //}
                else
                {
                    // Nếu kq trả về null return lỗi server
                    return StatusCode(StatusCodes.Status204NoContent, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.NoContent,
                        DevMsg = Common.Resource.DataResource.DevMsg_ServerError,
                        UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        MoreInfo = Common.Resource.Resource.NoContent,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }
            }
            catch (Exception ex)
            {
                // Lỗi exception
                Console.WriteLine(ex.ToString());
                return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.Exception,
                    DevMsg = Common.Resource.DataResource.DevMsg_ServerError,
                    UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                    MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                    TraceId = HttpContext.TraceIdentifier
                });
            }
        }
        /// <summary>
        /// Lấy tất cả bản ghi 
        /// </summary>
        /// <returns>Danh sách các bản ghi </returns>
        [HttpGet]
        public virtual IActionResult GetAllRecords()
        {
            try
            {
                // Lấy kết quả trả về bên Bussiness Layer
                var listRecord = _baseBL.GetAllRecords();

                // Nếu kq trả về null return lỗi server
                if (listRecord == null)
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.ServerError,
                        DevMsg = Common.Resource.DataResource.DevMsg_ServerError,
                        UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }
                // Thành công return danh sách record
                return StatusCode(StatusCodes.Status200OK, listRecord);
            }
            catch (Exception ex)
            {
                // Lỗi exception
                Console.WriteLine(ex.ToString());
                return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.Exception,
                    DevMsg = Common.Resource.DataResource.DevMsg_Exception,
                    UserMsg = Common.Resource.DataResource.UserMsg_Exception,
                    MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                    TraceId = HttpContext.TraceIdentifier
                });
            }
        }

        /// <summary>
        /// Lấy 1 bản ghi 
        /// </summary>
        /// <param name="idRecord"> id bản ghi cần lấy </param>
        /// <returns> Bản ghi </returns>
        [HttpGet("{idRecord}")]
        public virtual IActionResult GetRecordById(int idRecord)
        {
            try
            {
                // Lấy kết quả trả về bên Bussiness Layer
                var recordGetByID = _baseBL.GetRecordByID(idRecord);
                // Nếu kq trả về null return lỗi dữ liệu định dạng không hợp lệ
                if (recordGetByID == null)
                {
                    return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                        MoreInfo = Common.Resource.Resource.UserMsg_GetByIDFail,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }

                // Thành công return id record
                return StatusCode(StatusCodes.Status200OK, recordGetByID);
            }
            catch (Exception ex)
            {
                // Lỗi exception
                Console.WriteLine(ex.ToString());
                return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.Exception,
                    DevMsg = Common.Resource.DataResource.DevMsg_Exception,
                    UserMsg = Common.Resource.DataResource.UserMsg_Exception,
                    MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                    TraceId = HttpContext.TraceIdentifier
                });
            }
        }

        /// <summary>
        /// Thêm mới 1 bản ghi
        /// </summary>
        /// <param name="record">Thêm mới bản ghi</param>
        /// <returns>Bản ghi</returns>
        [HttpPost]
        public virtual IActionResult InsertRecord(T record)
        {
            // Lấy kết quả trả về bên Bussiness Layer

            try
            {
                var result = _baseBL.InsertRecord(record);

                // Thành công return 1
                if (result.IsSuccess)
                {
                    return StatusCode(StatusCodes.Status201Created, 1);
                }

                // Nếu result bằng false và errorcode == invalid data return lỗi nhập liệu
                else if (!result.IsSuccess && result.Data.ErrorCode == Common.Enum.ErrorCode.InvalidData)
                {
                    return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                    {
                        ErrorCode = result.Data.ErrorCode,
                        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                        MoreInfo = result.Data.MoreInfo,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }

                // Nếu kq trả về null return lỗi server
                else
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.ServerError,
                        DevMsg = Common.Resource.DataResource.DevMsg_Exception,
                        UserMsg = Common.Resource.DataResource.UserMsg_Exception,
                        MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }
            }
            catch (MySqlException mySqlException)
            {
                return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.DuplicateCode,
                    DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                    UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                    MoreInfo = "trung ma",
                    TraceId = HttpContext.TraceIdentifier
                });
            }
            catch (Exception ex)
            {
                // lỗi exception
                Console.WriteLine(ex.ToString());
                return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.Exception,
                    DevMsg = Common.Resource.DataResource.DevMsg_Exception,
                    UserMsg = Common.Resource.DataResource.UserMsg_Exception,
                    MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                    TraceId = HttpContext.TraceIdentifier
                });
            }
        }

        /// <summary>
        /// Cập nhập 1 bản ghi 
        /// </summary>
        /// <param name="record"> Thông tin bản ghi cần cập nhập <typeparamref name="T"/> </param>
        /// <param name="idRecord"> id bản ghi cần cập nhập </param>
        /// <returns> Số bản ghi bị tác động </returns>
        [HttpPut("{idRecord}")]
        public virtual IActionResult UpdateRecord([FromBody] T record, [FromRoute] int idRecord)
        {
            // Lấy kết quả trả về bên Bussiness Layer
            try
            {
                var result = _baseBL.UpdateRecord(record, idRecord);
                // Thành công return 1
                if (result.IsSuccess)
                {
                    return StatusCode(StatusCodes.Status200OK, 1);
                }

                // Nếu result bằng false và errorcode == invalid data return lỗi nhập liệu
                else if (!result.IsSuccess && result.Data.ErrorCode == Common.Enum.ErrorCode.InvalidData)
                {
                    return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                        MoreInfo = result.Data.MoreInfo,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }

                // Nếu kq trả về null return lỗi server
                else
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.ServerError,
                        DevMsg = Common.Resource.DataResource.DevMsg_ServerError,
                        UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }
            }
            catch (MySqlException mySqlException)
            {
                return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.DuplicateCode,
                    DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                    UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                    MoreInfo = "trung ma",
                    TraceId = HttpContext.TraceIdentifier
                });
            }
            catch (Exception ex)
            {
                // lỗi exception
                Console.WriteLine(ex.ToString());
                return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.Exception,
                    DevMsg = Common.Resource.DataResource.DevMsg_Exception,
                    UserMsg = Common.Resource.DataResource.UserMsg_Exception,
                    MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                    TraceId = HttpContext.TraceIdentifier
                });
            }
        }

        /// <summary>
        /// Xóa 1 bản ghi
        /// </summary>
        /// <param name="idRecord"> id bản ghi cần xóa </param>
        /// <returns> Số bản ghi bị tác động </returns>
        [HttpDelete("{idRecord}")]
        public virtual IActionResult DeleteOneRecord([FromRoute] int idRecord)
        {
            // Lấy kết quả trả về bên Bussiness Layer
            var result = _baseBL.DeleteRecord(idRecord);
            try
            {
                // Thành công return 1
                if (result.IsSuccess)
                {
                    return StatusCode(StatusCodes.Status200OK, 1);
                }

                // Nếu result bằng false và errorcode == invalid data return lỗi nhập liệu
                else if (!result.IsSuccess && result.Data.ErrorCode == Common.Enum.ErrorCode.InvalidData)
                {
                    return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.DeleteFail,
                        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                        MoreInfo = result.Data.MoreInfo,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }

                // Nếu result bằng false và errorcode == invalid data return lỗi nhập liệu
                else
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.ServerError,
                        DevMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        UserMsg = Common.Resource.DataResource.UserMsg_ServerError,
                        MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.Exception,
                    DevMsg = Common.Resource.DataResource.DevMsg_Exception,
                    UserMsg = Common.Resource.DataResource.UserMsg_Exception,
                    MoreInfo = Common.Resource.Resource.UserMsg_ServerError,
                    TraceId = HttpContext.TraceIdentifier
                });
            }
        }

        #endregion

    }
}
