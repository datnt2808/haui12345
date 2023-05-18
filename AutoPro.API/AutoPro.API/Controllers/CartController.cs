using AutoPro.BL.BaseBL;
using AutoPro.BL.CartBL;
using AutoPro.Common.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class CartController : BaseController<Cart>
    {
        private ICartBL _cartBL;
        public CartController(ICartBL cartBL) : base(cartBL)
        {
            _cartBL = cartBL;
        }
    }
}
