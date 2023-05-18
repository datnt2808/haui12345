using System;
using System.Collections.Generic;
using System.Globalization;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoPro.Common.Enum;

namespace AutoPro.Common.Entities
{
    public class Orders : BaseEntity
    {
        [Key]
        public int orderID { get; set; }

        public string? orderCode { get; set; }

        public DateTime orderDate { get; set; }

        public int idUser { get; set; }

        public string? fullName { get; set; }

        public string? address { get; set; }

        public string? phoneNumber { get; set; }
        public string? description { get; set; }
        public int totalAmount { get; set; }

        /// <summary>
        /// Trạng thái đơn hàng
        /// 1-Thành công,2-Chờ tiếp nhận,3-Đã tiếp nhận,4-Chờ giao hàng,5-Đang giao hàng,6-Giao hàng thất bại,7-Đổi hàng,8-Trả hàng,9-Hủy
        /// </summary>
        public int statusOrders { get; set; }

        public string? statusOrdersName
        {
            get
            {
                foreach(OrderStatus item in System.Enum.GetValues(typeof(OrderStatus)))
                {
                    if (statusOrders == (int)item)
                    {
                        return item.GetDisplayName();
                    }
                }
                return "";
            }
        }
        /// <summary>
        /// HÌnh thức thanh toán (1-VNPay - 2-Tại nhà)
        /// </summary>
        public int checkOutTypeID { get; set; }

        public string? CheckOutTypeName
        {
            get
            {
                foreach (CheckoutType item in System.Enum.GetValues(typeof(CheckoutType)))
                {
                    if (checkOutTypeID == (int)item)
                    {
                        return item.GetDisplayName();
                    }
                }
                return "";
            }
        }

        /// <summary>
        /// Trạng thái thanh toán(1-ok 2-chưa)
        /// </summary>
        public int checkOutStatusID { get; set; }
        public string? CheckoutStatusName 
        {
            get
            {
                foreach (CheckoutStatus item in System.Enum.GetValues(typeof(CheckoutStatus)))
                {
                    if (checkOutTypeID == (int)item)
                    {
                        return item.GetDisplayName();
                    }
                }
                return "";
            }
        }

        public string? reason { get; set; }
    }
}
