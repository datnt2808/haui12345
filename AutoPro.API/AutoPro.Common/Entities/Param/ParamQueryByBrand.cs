using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities.Param
{
    public class ParamQueryByBrand
    {
        public int month { get; set; }

        public int year { get; set; }

        public string? brandName { get; set; }

        public decimal totalPrice { get; set; }

    }
}
