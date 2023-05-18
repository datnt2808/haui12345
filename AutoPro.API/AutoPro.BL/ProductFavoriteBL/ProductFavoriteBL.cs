using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.ProductFavoriteDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.ProductFavoriteBL
{
    public class ProductFavoriteBL : BaseBL<ProductFavorite>,IProductFavoriteBL
    {
        private IProductFavoriteDL _productFavoriteDL;

        public ProductFavoriteBL(IProductFavoriteDL productFavoriteDL) : base(productFavoriteDL)
        {
            _productFavoriteDL = productFavoriteDL;
        }
    }
}
