using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.NewsCommentDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.NewsCommentBL
{
    public class NewsCommentBL : BaseBL<NewsComment>,INewsCommentBL
    {
        private INewsCommentDL _newsCommentDL;

        public NewsCommentBL(INewsCommentDL newsCommentDL) : base(newsCommentDL)
        {
            _newsCommentDL = newsCommentDL;
        }
    }
}
