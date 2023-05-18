using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.NewsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.NewsBL
{
    public class NewsBL : BaseBL<News>,INewsBL
    {
        private INewsDL _newsDL;

        public NewsBL(INewsDL newsDL) : base(newsDL)
        {
            _newsDL = newsDL;
        }
    }
}
