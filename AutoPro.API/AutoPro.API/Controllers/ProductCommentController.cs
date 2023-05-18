using AutoPro.BL.BaseBL;
using AutoPro.BL.ProductCommentBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using AutoPro.DL;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using System.Web.Http.Results;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductCommentController : BaseController<ProductComment>
    {
        private IProductCommentBL _productCommentBL;
        public ProductCommentController(IProductCommentBL productCommentBL) : base(productCommentBL)
        {
            _productCommentBL = productCommentBL;
        }
        // Khởi tạo lấy kết nối đường dẫn database
        string connectionString = DatabaseContext.ConnectionString;
        [HttpPost("UpdateCommentbyOrderDetailProduct")]
        public IActionResult updateCommentProduct(ProductDetailComment comment)
        {
            try
            {
                // Lấy kết quả trả về bên Bussiness Layer
                string proc = "Proc_UpdateOrderDetailCommentProduct";

                //Truyền tham số cho procedure
                var parameters = new DynamicParameters();
                parameters.Add("v_IdOrderDetail", comment.IdOrderDetail);
                parameters.Add("v_IdOrder", comment.IdOrder);
                parameters.Add("v_IdProduct", comment.IdProduct);
                int number = 0;
                using (var mySqlConnection = new MySqlConnection(connectionString))
                {
                    // Query
                    number = mySqlConnection.Execute(proc, parameters, commandType: System.Data.CommandType.StoredProcedure);
                }
                // Thành công return danh sách record

                if (number > 0)
                {
                    return StatusCode(StatusCodes.Status200OK, 1);
                }
                else
                {
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

        [HttpGet("ListCommentByPorduct")]
        public IActionResult getComment([FromQuery] int idProduct)
        {
            try
            {
                // Lấy kết quả trả về bên Bussiness Layer
                string proc = "Proc_ProductComment_ListConmentGetByID";

                //Truyền tham số cho procedure
                var parameters = new DynamicParameters();
                parameters.Add("v_ProductID", idProduct);
                List<object> result = new List<object>();
                using (var mySqlConnection = new MySqlConnection(connectionString))
                {
                    // Query
                    result =  mySqlConnection.Query(proc, parameters, commandType: System.Data.CommandType.StoredProcedure).ToList();
                }

                // Thành công return danh sách record
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

    }
}
