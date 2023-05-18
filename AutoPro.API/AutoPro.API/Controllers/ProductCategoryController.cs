using AutoPro.BL.BaseBL;
using AutoPro.BL.ProductCategoryBL;
using AutoPro.Common.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductCategoryController : BaseController<ProductCategory>
    {
        private IProductCategoryBL _productCategoryBL;
        public ProductCategoryController(IProductCategoryBL productCategoryBL) : base(productCategoryBL)
        {
            _productCategoryBL = productCategoryBL;
        }
    }
}
