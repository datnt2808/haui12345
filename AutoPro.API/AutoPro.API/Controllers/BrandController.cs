using AutoPro.BL.BaseBL;
using AutoPro.BL.BrandBL;
using AutoPro.Common.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BrandController : BaseController<Brand>
    {
        private IBrandBL _brandBL;
        public BrandController(IBrandBL brandBL) : base(brandBL)
        {
            _brandBL = brandBL;
        }
    }
}
