using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities.DTO
{
    public class PagingData<T>
    {


        /// <summary>
        /// Tổng số lượng
        /// </summary>
        public long TotalRecord { get; set; }

        /// <summary>
        /// Tổng số lượng
        /// </summary>
        public long TotalPage { get; set; }

        /// <summary>
        /// Dữ liệu danh sách
        /// </summary>
        public List<T> Data { get; set; } = new List<T>();

    }
}
