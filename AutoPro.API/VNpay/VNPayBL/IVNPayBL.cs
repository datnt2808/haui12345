using AutoPro.Common.Entities.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VNpay.Model;

namespace VNpay.VNPayBL
{
    public interface IVNPayBL
    {
        public ServiceResult paymentVNPay(Payment payment);
    }
}
