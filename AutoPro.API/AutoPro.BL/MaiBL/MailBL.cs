using AutoPro.Common.Entities.DTO;
using AutoPro.Common.Entities.Param;
using AutoPro.DL.MailDL;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.BL.MaiBL
{
    public class MailBL : IMailBL
    {
        IMailDL _mailDL;
        private IConfiguration _configuration;

        public MailBL(IMailDL mailDL, IConfiguration configuration)
        {
            _mailDL = mailDL;
            _configuration = configuration;
        }

        public ServiceResult sendEmail(EmailRequest mailContent)
        {
            var mailSetting = _configuration.GetSection("MailSettings");
            MailMessage mail = new MailMessage();
            mail.To.Add(mailContent.ToEmail);
            mail.From = new MailAddress(mailSetting["Mail"], mailSetting["DisplayName"]);
            mail.Subject = mailContent.Subject;
            mail.Body = mailContent.Body;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();

            smtp.Port = int.Parse(mailSetting["Port"]);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = mailSetting["Host"];
            smtp.Credentials = new NetworkCredential(mailSetting["Mail"], mailSetting["Password"]);
            try
            {
                smtp.Send(mail);
                return new ServiceResult { IsSuccess = true };
            }
            catch
            {
                return new ServiceResult { IsSuccess = false };
            }
        }
    }
}
