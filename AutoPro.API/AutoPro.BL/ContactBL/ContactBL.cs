using AutoPro.BL.BaseBL;
using AutoPro.Common.Entities;
using AutoPro.DL.ContactDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.ContactBL
{
    public class ContactBL : BaseBL<Contact>,IContactBL
    {
        private IContactDL _contactDL;

        public ContactBL(IContactDL contactDL) : base(contactDL)
        {
            _contactDL = contactDL;
        }
    }
}
