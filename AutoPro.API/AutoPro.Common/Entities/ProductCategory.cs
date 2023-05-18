using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.Common.Entities
{
    public class ProductCategory : BaseEntity
    {
        [Key]
        public int CategoryID { get; set; }

        [CategoryCodeNotEmpty]
        public string? CategoryCode { get; set; }

        [CategoryNameNotEmpty]
        public string? CategoryName { get; set; }

        public string? Description { get; set; }

    }
}
