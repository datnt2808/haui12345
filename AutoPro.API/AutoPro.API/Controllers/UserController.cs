using AutoPro.BL.BaseBL;
using AutoPro.BL.UserBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using AutoPro.DL.BaseDL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserController : BaseController<User>
    {
        private IUserBL _userBL;
        public UserController(IUserBL userBL) : base(userBL)
        {
            _userBL = userBL;
        }

        /// <summary>
        /// Đăng nhập
        /// </summary>
        /// <param name="userLogin"></param>
        /// <returns></returns>
        [HttpPost("login")]
        public IActionResult LoginApplication([FromBody] AccountLogin userLogin)
        {
            try
            {
                var result = _userBL.checkLogin(userLogin.Account, userLogin.Password);
                if (result == null)
                {
                    return StatusCode(StatusCodes.Status400BadRequest, new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                        DevMsg = Common.Resource.DataResource.DevMsg_InvalidData,
                        UserMsg = Common.Resource.DataResource.UserMsg_InvalidData,
                        MoreInfo = Common.Resource.Resource.UserMsg_LoginFail,
                        TraceId = HttpContext.TraceIdentifier
                    });
                }
                return StatusCode(StatusCodes.Status200OK, result);
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
        /// Cập nhập 1 bản ghi 
        /// </summary>
        /// <param name="record"> Thông tin bản ghi cần cập nhập <typeparamref name="T"/> </param>
        /// <param name="idRecord"> id bản ghi cần cập nhập </param>
        /// <returns> Số bản ghi bị tác động </returns>
        [HttpPut("admin/{idRecord}")]
        public IActionResult UpdateAdminRecord([FromBody] User record, [FromRoute] int idRecord)
        {
            // Lấy kết quả trả về bên Bussiness Layer
            try
            {
                var result = _userBL.UpdateAdmin(record, idRecord);
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

        [HttpPost("forgotpassword")]
        public IActionResult forgot([FromBody] Forgot forgot)
        {
            try
            {
                var result = _userBL.forgotPassword(forgot);
                if (result != null)
                {
                    return StatusCode(StatusCodes.Status200OK, result);
                }
                else
                {
                    return StatusCode(StatusCodes.Status500InternalServerError);
                }
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPut("updatePassword")]
        public IActionResult updatePass([FromBody] UpdatePass updatePass)
        {
            try
            {
                bool result = _userBL.updatePass(updatePass);
                if (result)
                {
                    return StatusCode(StatusCodes.Status200OK, 1);
                }
                else
                {
                    return StatusCode(StatusCodes.Status500InternalServerError);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
