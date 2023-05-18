using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.Common.Entities
{
    public class NewsComment : BaseEntity
    {
        [Key]
        public int CommentID { get; set; }

        [CommentNewsNameNotEmpty]
        public string? Name { get; set; }

        [CommentNewsDetailNotEmpty]
        public string? Detail { get; set; }

        public int NewsID { get; set; }
    }
}
