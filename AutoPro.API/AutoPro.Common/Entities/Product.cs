using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.Common.Entities
{
    public class Product : BaseEntity
    {
        [Key]
        public int ProductID { get; set; }

        [ProductCodeNotEmpty]
        public string? ProductCode { get; set; }

        [ProductNameNotEmpty]
        public string? ProductName { get; set; }

        [ProductPriceNotEmpty]
        public decimal? Price { get; set; }
        [ProductPlaceOriginNotEmpty]

        public string? PlaceOrigin { get; set; }

        [ProductStatusNotEmpty]
        public int Status { get; set; }

        [ProductImageNotEmpty]
        public string? Image { get; set; }
        public int QuantitySell { get; set; }

        [ProductQuantityNotEmpty]
        public int Quantity { get; set; }

        public string? Description { get; set; }

        public int BrandID { get; set; }

        public string? BrandName { get; set; }

        public int CategoryID { get; set; }

        public string? CategoryName { get; set; }

    }
}
