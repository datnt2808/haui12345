using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.ProductCommentDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.ProductCommentBL
{
    public class ProductCommentBL : BaseBL<ProductComment>,IProductCommentBL
    {
        private IProductCommentDL _productCommentDL;

        public ProductCommentBL(IProductCommentDL productCommentDL) : base(productCommentDL)
        {
            _productCommentDL = productCommentDL;
        }
    }
}
