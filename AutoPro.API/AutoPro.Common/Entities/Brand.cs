using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.Common.Entities
{
    public class Brand : BaseEntity
    {
        [Key]
        public int BrandID { get; set; }

        public string? BrandCode { get; set; }

        [BrandNameNotEmpty]
        public string? BrandName { get; set; }

        [BrandImageNotEmpty]
        public string? Image { get; set; }   

        public string? Description { get; set; }
    }
}
