using AutoPro.BL.BaseBL;
using AutoPro.BL.ProductBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductController : BaseController<Product>
    {
        private IProductBL _productBL;
        public ProductController(IProductBL productBL) : base(productBL)
        {
            _productBL = productBL;
        }

        [HttpPost("PagingProductByFilter")]
        public IActionResult getProductPaging([FromBody] BaseObjectFilter baseObjectFilter)
        {
            try
            {
                var result = _productBL.listProductByFilter(baseObjectFilter);
                // Thành công return danh sách record
                if (result != null)
                {
                    return StatusCode(StatusCodes.Status200OK, result);
                }
                else if (result == null)
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
            catch(Exception ex)
            {
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
