using AutoPro.Common.Entities.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using VNpay.Model;
using VNpay.VNPayBL;

namespace AutoPro.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PayMentController : ControllerBase
    {
        IVNPayBL _iVNpayBL;

        public PayMentController(IVNPayBL iVNpayBL)
        {
            _iVNpayBL = iVNpayBL;
        }

        [HttpPost("redirect-vnpay")]
        public IActionResult redirectVNPay(Payment payment)
        {
            try
            {
                var result = _iVNpayBL.paymentVNPay(payment);
                if (result.IsSuccess)
                {
                    return StatusCode(StatusCodes.Status200OK, result.Data.UserMsg);
                }else if(!result.IsSuccess && result.Data.ErrorCode == Common.Enum.ErrorCode.InvalidData)
                {
                    return  StatusCode(StatusCodes.Status400BadRequest,result.Data.UserMsg);
                }
                return StatusCode(StatusCodes.Status500InternalServerError, result.Data.UserMsg);
            }
            catch (Exception ex)
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

    }
}
