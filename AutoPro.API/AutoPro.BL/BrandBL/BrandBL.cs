using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.BrandDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.BrandBL
{
    public class BrandBL : BaseBL<Brand>,IBrandBL
    {
        private IBrandDL _brandDL;

        public BrandBL(IBrandDL brandDL) : base(brandDL)
        {
            _brandDL = brandDL;
        }
    }
}
