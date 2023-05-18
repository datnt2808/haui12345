using AutoPro.Common.Entities.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities.Param
{
    public class BaseObjectFilter
    {
        public int PageIndex { get; set; }

        public int PageSize { get; set; }

        /// <summary>
        /// Danh sách điều kiện lọc
        /// </summary>
        public List<FilterObject> ListFilter { get; set; }

        public string ListOrderBy { get; set; }
    }
}
