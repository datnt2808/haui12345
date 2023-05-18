using AutoPro.Common.Entities;
using AutoPro.Common.Entities.Param;
using AutoPro.DL.BaseDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.DL.OrdersDL
{
    public interface IOrdersDL : IBaseDL<Orders>
    {
        /// <summary>
        /// Thêm mới product
        /// </summary>
        /// <param name="product"></param>
        /// <param name="listProductDetail"></param>
        /// <returns></returns>
        public Orders InsertOrderDetail(Orders order, List<OrderDetail> listOrderDetail, List<Product> listProductDetail);

        /// <summary>
        /// Lấy chi tiết đơn hàng
        /// </summary>
        /// <param name="entityId"></param>
        /// <returns></returns>
        object getOrderDetail(int entityId);

        /// <summary>
        /// Sửa đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <param name="listOrderDetail"></param>
        /// <returns></returns>
        public bool UpdateOrderDetail(Orders order, List<OrderDetail> listOrderDetail,List<Product> listProduct);

        public object Filter(string? textSearch, long pageSize, long pageNumber,int status);

        /// <summary>
        /// lấy thông order code cuối ucngf
        /// </summary>
        /// <returns></returns>
        public Orders GetLastestOrder();

        public Product GetListProductByListID(int id);
        object getOrderByUserID(int userId);
        /// <summary>
        /// lấy doanh số theo chi nhánh 
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public List<ParamQueryByBrand> getReportRevenueByBranch(TimeParam param);

        public List<ParamQueryByYear> getReportByYear(int year);
    }
}
