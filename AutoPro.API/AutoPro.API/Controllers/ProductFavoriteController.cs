using AutoPro.BL.BaseBL;
using AutoPro.BL.ProductFavoriteBL;
using AutoPro.Common.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductFavoriteController : BaseController<ProductFavorite>
    {
        private IProductFavoriteBL _productFavorite;
        public ProductFavoriteController(IProductFavoriteBL productFavoriteBL) : base(productFavoriteBL)
        {
            _productFavorite = productFavoriteBL;
        }
    }
}
