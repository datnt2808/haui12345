using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.UserBL
{
    public interface IUserBL : IBaseBL<User>
    {
        public object checkLogin(string Account, string Password);

        public ServiceResult UpdateAdmin(User record, int idRecord);

        public string forgotPassword(Forgot forgot);

        public bool updatePass(UpdatePass updatePass);
    }
}
