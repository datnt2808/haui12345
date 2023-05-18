using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.ProductCategoryDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.ProductCategoryBL
{
    public class ProductCategoryBL : BaseBL<ProductCategory>,IProductCategoryBL
    {
        private IProductCategoryDL _productCategoryDL;

        public ProductCategoryBL(IProductCategoryDL productCategoryDL) : base(productCategoryDL)
        {
            _productCategoryDL = productCategoryDL;
        }
    }
}
