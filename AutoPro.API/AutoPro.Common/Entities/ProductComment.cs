using AutoPro.Common.Enum;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.Common.Entities
{
    public class ProductComment : BaseEntity
    {
        [Key]
        public int CommentID { get; set; }

        public int UserID { get; set; }

        [CommentProductNameNotEmpty]
        public string? Name { get; set; }
        public string? Image { get; set; }
        [CommentProductDetailNotEmpty]
        public string? Detail { get; set; }

        public int ProductID { get; set; }

        public Rating RatingID { get; set; }
    }
}
