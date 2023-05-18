using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities
{
    public class Cart : BaseEntity
    {
        [Key]
        public int CartID { get; set; }

        public Decimal Price { get; set; }

        public int Quantity { get; set; }

        public int Status { get; set; }

        public int UserID { get; set; }

    }
}
