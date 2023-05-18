using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Entities
{
    public class ProductFavorite : BaseEntity
    {
        [Key]
        public int FavoriteID { get; set; }

        public int ProductID { get; set; }

        public int UserID { get; set; }

    }
}
