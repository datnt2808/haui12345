using AutoPro.Common.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities.DTO
{
    public class OrderBy
    {
        public int SortOrder { get; set; }

        public string FieldName { get; set; }

        public OrderByType MyProperty { get; set; }
    }
}
