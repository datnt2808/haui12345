using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.OrderDetailDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.OrderDetailBL
{
    public class OrderDetailBL : BaseBL<OrderDetail>,IOrderDetailBL
    {
        private IOrderDetailDL _orderDetailDL;

        public OrderDetailBL(IOrderDetailDL orderDetailDL) : base(orderDetailDL)
        {
            _orderDetailDL = orderDetailDL;
        }
    }
}
