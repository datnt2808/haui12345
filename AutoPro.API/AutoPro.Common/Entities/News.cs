using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.Common.Entities
{
    public class News : BaseEntity
    {
        [Key]
        public int NewsID { get; set; }

        [NewsTitleNotEmpty]
        public string? NewsTitle { get; set; }

        public DateTime NewsDate { get; set; }

        public string? Image { get; set; }

        [ContentShortedNewsNotEmpty]
        public string? ContentShorted { get; set; }

        [ContentNewsNotEmpty]
        public string? Content { get; set; }
    }
}
