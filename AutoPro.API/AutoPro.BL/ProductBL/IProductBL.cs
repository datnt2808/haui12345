using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.Param;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.ProductBL
{
    public interface IProductBL : IBaseBL<Product>
    {
        public object listProductByFilter(BaseObjectFilter objectFilter);
    }
}
