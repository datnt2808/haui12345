using AutoPro.Common.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities.DTO
{
    public class FilterObject
    {
        public string FieldName { get; set; }

        public Operator Operator { get; set; }

        public string FilterValue { get; set; }
    }
}
