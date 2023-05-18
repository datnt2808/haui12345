using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.CartDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.CartBL
{
    public class CartBL : BaseBL<Cart>,ICartBL
    {
        private ICartDL _cartDL;

        public CartBL(ICartDL cartDL) : base(cartDL)
        {
            _cartDL = cartDL;
        }
    }
}
