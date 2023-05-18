using AutoPro.BL.BaseBL;
using AutoPro.BL.MaiBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using AutoPro.DL.OrdersDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace AutoPro.BL.OrdersBL
{
    public class OrdersBL : BaseBL<Orders>,IOrdersBL
    {
        private IOrdersDL _ordersDL;
        private IMailBL _mailBL;

        public OrdersBL(IOrdersDL ordersDL) : base(ordersDL)
        {
            _ordersDL = ordersDL;
        }


        public object Filter(string? textSearch, long pageSize = 10, long pageNumber = 1,int status = 1)
        {
            // Nếu trang được chọn truyền vào là 0 thì set trang chọn là trang 1
            if (pageNumber == 0)
            {
                pageNumber = 1;
            }
            // Số bản ghi trên trang = 0 return null bắn lỗi nhập liệu
            if (pageSize == 0)
            {
                pageSize = 10;
            }
            if(status == 0)
            {
                status = 1;
            }
            //Gọi DL lấy danh sách
            return _ordersDL.Filter(textSearch, pageSize, pageNumber,status);
        }

        public string CreateAutoOrderCode()
        {
            string newCode = "";
            Orders lastOrder = _ordersDL.GetLastestOrder();
            if (lastOrder != null)
            {
                string lastCode = lastOrder.orderCode;
                int codenumber = int.Parse(lastCode.Substring(2)) + 1;
                newCode = "DH" + codenumber.ToString();
            }
            else
            {
                newCode = "DH100001";
            }
            return newCode;
        }

        public object getOrderDetail(int entityId)
        {
            return _ordersDL.getOrderDetail(entityId);
        }

        public ServiceResult InsertOrderDetail(OrderDetailParam param)
        {
            Orders order = new Orders();
            List<OrderDetail> listOrderDetail = new List<OrderDetail>();
            // Thoông tin user người dừng gửi lên
            order = JsonSerializer.Deserialize<Orders>(param.order);
            // Thoông tin sản phẩm người dùng mua gửi lên
            listOrderDetail = JsonSerializer.Deserialize<List<OrderDetail>>(param.orderdetail);
            // Thông tin sản phẩm trong database để kiểm tra số lương sản phẩm người dùng mua nhiều hơn số lượng sản phẩm trong db thfi bắn lỗi
            List<Product> listProduct = new List<Product>();
            foreach(var item in listOrderDetail)
            {
               var kqs = _ordersDL.GetListProductByListID(item.productID);
                if(kqs != null)
                {
                    listProduct.Add(kqs);
                }
                else
                {
                    return new ServiceResult
                    {
                        IsSuccess = false,
                        Data = new ErrorResult
                        {
                            ErrorCode = Common.Enum.ErrorCode.InvalidData,
                            UserMsg = "Sản phẩm không tồn tại trong hệ thống"
                        }
                    };
                }
            }
            // Kiểm tra số lượng sản phẩm trong db và số lượng gửi lên
            var kq = this.validateOrder(order, listOrderDetail, listProduct);
            if (!kq.IsSuccess)
            {
                return kq;
            }
            // Tạo mã đơn hàng tự động
            order.orderCode = CreateAutoOrderCode();

            var result = _ordersDL.InsertOrderDetail(order, listOrderDetail, listProduct);
            if (result == null)
            {
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.ServerError,
                        DevMsg = "Lỗi insert",
                        UserMsg = "Lỗi insert",
                        MoreInfo = "Lỗi insert"
                    }
                };
            }
            if (order != null)
            {
                //Task.Run(() => sendEmailOrders(order,listOrderDetail));

                // gửi mail
                return new ServiceResult
                {
                    IsSuccess = true,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.Success,
                        MoreInfo = order,
                    }
                };
            }
            return new ServiceResult { IsSuccess = true };
        }

        private void sendEmailOrders(Orders orders, List<OrderDetail> listOrderDetail)
        {
            EmailRequest mailContent = new EmailRequest();
            mailContent.ToEmail = orders.fullName;
            mailContent.Subject = "Đơn hàng được đặt thành công";
            string bodyContent = "Đơn hàng được đặt thành công";
            mailContent.Body = bodyContent;
            _mailBL.sendEmail(mailContent);
        }

        public ServiceResult UpdateOrderDetail(OrderDetailParam param)
        {
            Orders order = new Orders();
            List<OrderDetail> listOrderDetail = new List<OrderDetail>();
            order = JsonSerializer.Deserialize<Orders>(param.order);
            listOrderDetail = JsonSerializer.Deserialize<List<OrderDetail>>(param.orderdetail);
            List<Product> listProduct = new List<Product>();
            foreach (var item in listOrderDetail)
            {
                var kqs = _ordersDL.GetListProductByListID(item.productID);
                if (kqs != null)
                {
                    listProduct.Add(kqs);
                }
                else
                {
                    return new ServiceResult
                    {
                        IsSuccess = false,
                        Data = new ErrorResult
                        {
                            ErrorCode = Common.Enum.ErrorCode.InvalidData,
                            UserMsg = "Sản phẩm không tồn tại trong hệ thống"
                        }
                    };
                }
            }
            bool result = _ordersDL.UpdateOrderDetail(order, listOrderDetail,listProduct);
            if (!result)
            {
                return new ServiceResult
                {
                    IsSuccess = false,
                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                        UserMsg = "Cập nhật sản phẩm thất bại"
                    }
                };
            }
            //serviceResult.Data = (Orders)result;
            return new ServiceResult { IsSuccess = true};
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="order">Thông tin người dùng</param>
        /// <param name="orderDetail">Thông tin sản phầm người dùng mua</param>
        /// <param name="listProductDetail">Thông tin sản phẩm trong đb</param>
        /// <returns></returns>
        public ServiceResult validateOrder(Orders order, List<OrderDetail> orderDetail, List<Product> listProductDetail)
        {

            List<string> productcode = new List<string>();
            // Kiểm tra nếu có lõi thì bắn lên
            foreach (var item in orderDetail)
            {
                Product currentProduct = listProductDetail.Find(x => x.ProductID == item.productID);
                int inventory = currentProduct.Quantity;
                if (item.quantitys > inventory)
                {
                    productcode.Add(item.productCode);
                }
            }

            // Bắn lỗi
            if (productcode.Count > 0)
            {
                return new ServiceResult
                {
                    IsSuccess = false,

                    Data = new ErrorResult
                    {
                        ErrorCode = Common.Enum.ErrorCode.InvalidData,
                        DevMsg = "Sản phẩm đặt vượt số lượng trong kho",
                        UserMsg = "Sản phẩm đặt vượt số lượng trong kho",
                        MoreInfo = $"{productcode}"
                    }
                };
            }

            // Trừ sản phẩm trong database
            foreach (var item in listProductDetail)
            {
                OrderDetail currentProduct = orderDetail.Find(x => x.productID == item.ProductID);
                int quantity = currentProduct != null ? currentProduct.quantitys : 0;
                item.Quantity -= quantity;
                item.QuantitySell += quantity;
            }
            return new ServiceResult
            {
                IsSuccess  = true
            };
        }

        public object getByUserID(int userId)
        {
            return _ordersDL.getOrderByUserID(userId);
        }

        public List<ParamQueryByYear> getReportRevenueByYear(int year)
        {
            // trả về list order theo chi nhánh trong năm của param
            List<ParamQueryByYear> listSaleOrder = _ordersDL.getReportByYear(year);
            decimal tong = 0;
            foreach(ParamQueryByYear item in listSaleOrder)
            {
                tong += item.tongtien;
            }
            if(tong == 0)
            {
                return null;
            }
            return listSaleOrder;
        }

        /// <summary>
        /// lấy báo cáo doanh thu các chi nhánh biểu đồ tròn
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public List<BrandPersent> getReportRevenueByBranch(TimeParam param)
        {
            List<BrandPersent> result = new List<BrandPersent>();
            decimal tong = 0;
            List<ParamQueryByBrand> listRevenue = _ordersDL.getReportRevenueByBranch(param);
            foreach (var item in listRevenue)
            {
                tong += item.totalPrice;
            }
            if (tong == 0)
            {
                foreach (var item in listRevenue)
                {
                    BrandPersent brandPersent = new BrandPersent();
                    brandPersent.brandName = item.brandName;
                    brandPersent.persent = 0;
                    //brandPersent.persent = (double)item.totalPrice;
                    result.Add(brandPersent);
                }
                return result;
            }
            foreach (var item in listRevenue)
            {
                BrandPersent brandPersent = new BrandPersent();
                brandPersent.brandName = item.brandName;
                brandPersent.persent = (double)(item.totalPrice / tong) * 100;
                //brandPersent.persent = (double)item.totalPrice;
                result.Add(brandPersent);
            }
            return result;
        }   
    }
}
