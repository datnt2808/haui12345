using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using AutoPro.DL.ProductDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.ProductBL
{
    public class ProductBL : BaseBL<Product>,IProductBL
    {
        private IProductDL _productDL;

        public ProductBL(IProductDL productDL) : base(productDL)
        {
            _productDL = productDL;
        }

        public object listProductByFilter(BaseObjectFilter objectFilter)
        {
            List<FilterObject> listFilterS = new List<FilterObject>();
            string listOrder = "";
            listFilterS = objectFilter.ListFilter;
            listOrder = objectFilter.ListOrderBy;
            string filter = BuildWhereFilter(listFilterS);
            var result = _productDL.returnObject(filter,listOrder,objectFilter.PageSize);
            if(result != null)
            {
                return result;
            }
            return null;

        }

        private string BuildWhereFilter(List<FilterObject> listFilter)
        {
            string baseWhere = "";
            string[] listFilterBuild = new string[listFilter.Count];
            int i = 0;
            foreach (var item in listFilter)
            {
                string filterBuild = "";
                switch (item.Operator)
                {
                    case Common.Enum.Operator.LIKE:
                        filterBuild = $" p.{item.FieldName} like '%{item.FilterValue}%'";
                        break;
                    case Common.Enum.Operator.EQUAL:
                        filterBuild = $" p.{item.FieldName} = {item.FilterValue}";
                        break;
                    default:
                        break;
                }
                listFilterBuild[i] = filterBuild;
                if(i == 0)
                {
                    baseWhere += $" {filterBuild}";
                }
                else
                {
                    baseWhere += $" OR {filterBuild}";
                }
                i++;
                
            }
            return baseWhere;
        }
    }
}
