using AutoPro.BL.MaiBL;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MailController : ControllerBase
    {
        IMailBL _mailBL;

        public MailController(IMailBL mailBL)
        {
            _mailBL = mailBL;
        }

        [HttpPost("send")]
        public IActionResult sendEmail(EmailRequest mailContent)
        {
            try
            {
                // Lấy kết quả trả về bên Bussiness Layer
                var resuLt = _mailBL.sendEmail(mailContent);


                // Thành công return danh sách record
                if (resuLt.IsSuccess)
                {
                    return StatusCode(StatusCodes.Status200OK, 1);
                }
                else
                {
                    // Nếu kq trả về null return lỗi server
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

    }
}
