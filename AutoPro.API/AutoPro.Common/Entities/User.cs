using AutoPro.Common.Enum;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AutoPro.Common.Attributes.Attributes;

namespace AutoPro.Common.Entities
{
    public class User : BaseEntity
    {
        [Key]
        public int UserID { get; set; }

        [AccountNotEmpty]
        [DuplicateAccount]
        public string? Account { get; set; }

        [PassWordNotEmpty]
        [MaxLengthPassword]
        public string? Password { get; set; }

        [RoleUser]
        public string? Role { get; set; }

        public string? FirstName { get; set; }

        public string? LastName { get; set; }

        [FullNameNotEmpty]
        public string? FullName { get; set; }

        /// <summary>
        /// File ảnh
        /// </summary>
        //public IFormFile Img { get; set; }
        public string? Image { get; set; }

        [DateOfBirthLongerNow]
        public DateTime DateOfBirth { get; set; }

        public Gender Gender { get; set; }

        public string? Address { get; set; }

        [EmailNotEmpty]
        [RegexEmail]
        [DuplicateEmail]
        public string? Email { get; set; }

        public string? PhoneNumber { get; set; }

    }
}
