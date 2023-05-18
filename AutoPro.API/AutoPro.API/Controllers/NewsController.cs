using AutoPro.BL.BaseBL;
using AutoPro.BL.NewsBL;
using AutoPro.Common.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class NewsController : BaseController<News>
    {
        private INewsBL _newsBL;
        public NewsController(INewsBL newsBL) : base(newsBL)
        {
            _newsBL = newsBL;
        }
    }
}
