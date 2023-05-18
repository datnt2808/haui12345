using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities
{
    public class OrderDetail
    {
        [Key]
        public int orderDetailID { get; set; }
        public int orderID { get; set; }

        public int productID { get; set; }

        public string? productCode { get; set; }

        public string? productName { get; set; }

        public decimal? price { get; set; }

        public int quantitys { get; set; }

        public Boolean isComment { get; set; }
    }
}
