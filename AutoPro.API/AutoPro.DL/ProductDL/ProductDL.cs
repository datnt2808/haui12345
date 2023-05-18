using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.DL.BaseDL;
using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.DL.ProductDL
{
    public class ProductDL : BaseDL<Product>, IProductDL
    {

        // Khởi tạo lấy kết nối đường dẫn database
        string connectionString = DatabaseContext.ConnectionString;
        public object returnObject(string filter,string order,int pageSize)
        {
            string proc = "Proc_Product_Search";
            string where = filter;
            string orderby = order;
            int size = pageSize;
            string sql = $"select * from tb_product p where {where} order by {orderby} limit {size};select count(*) from tb_product p where {where} limit {size};";
            DynamicParameters parameters = new DynamicParameters();
            //parameters.Add("p_TextSearch", where);
            //parameters.Add("p_OrderBy", orderby);
            //parameters.Add("p_PageSize", pageSize);
            //parameters.Add("p_PageNumber", 1);
            using (var myconnect = new MySqlConnection(connectionString))
            {
                var result = myconnect.QueryMultiple(sql, parameters, commandType: System.Data.CommandType.Text);
                var data = result.Read<Product>().ToList();
                var totalCount = result.Read<int>().Single();
                //if(data.Count == 0)
                //{
                //    return null;
                //}
                // Return kêt quả
                return new PagingData<Product>
                {
                    TotalRecord = totalCount,
                    TotalPage = (totalCount % pageSize) > 0 ? ((totalCount / pageSize) + 1) : (totalCount / pageSize),
                    Data = data,
                };
            }
        }
    }
}
