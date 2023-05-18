using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.MaiBL
{
    public interface IMailBL
    {
        ServiceResult sendEmail(EmailRequest mailContent);
    }
}
