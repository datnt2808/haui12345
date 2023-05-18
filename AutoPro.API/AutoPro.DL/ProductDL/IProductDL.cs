﻿using AutoPro.Common.Entities;
using AutoPro.DL.BaseDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.DL.ProductDL
{
    public interface IProductDL : IBaseDL<Product>
    {
        public object returnObject(string filter,string order,int pageSize);
    }
}
