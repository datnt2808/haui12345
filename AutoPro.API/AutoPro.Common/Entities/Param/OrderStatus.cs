using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities.Param
{
    public class OrderStatus
    {
        public int idOrder { get; set; }

        public int statusOrder { get; set; }

        public string? reason { get; set; }
    }
}
