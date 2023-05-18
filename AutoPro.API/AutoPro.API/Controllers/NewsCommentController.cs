using AutoPro.BL.BaseBL;
using AutoPro.BL.NewsCommentBL;
using AutoPro.Common.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class NewsCommentController : BaseController<NewsComment>
    {
        private INewsCommentBL _newsCommentBL;
        public NewsCommentController(INewsCommentBL newsCommentBL) : base(newsCommentBL)
        {
            _newsCommentBL = newsCommentBL;
        }
    }
}
