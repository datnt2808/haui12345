using AutoPro.BL.BaseBL;
using AutoPro.BL.ContactBL;
using AutoPro.Common.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ContactController : BaseController<Contact>
    {
        private IContactBL _contactBL;
        public ContactController(IContactBL contactBL) : base(contactBL)
        {
            _contactBL = contactBL;
        }
    }
}
