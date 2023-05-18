using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.Common.Attributes
{
    public class Attributes
    {
        /// <summary>
        /// User Attribute
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class AccountNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class PassWordNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class FullNameNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class EmailNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class RegexEmail : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class MaxLengthPassword : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class DateOfBirthLongerNow : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class RoleUser : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class DuplicateAccount : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class DuplicateEmail : Attribute { }

        /// <summary>
        /// Brand
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class BrandNameNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class BrandImageNotEmpty : Attribute { }

        /// <summary>
        /// Contact
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class ContactNameNotEmpty : Attribute { }

        [AttributeUsage(AttributeTargets.Property)]
        public class ContactEmailNotEmpty : Attribute { }

        [AttributeUsage(AttributeTargets.Property)]
        public class ContactPhoneNotEmpty : Attribute { }

        [AttributeUsage(AttributeTargets.Property)]
        public class ContactContentNotEmpty : Attribute { }

        /// <summary>
        /// News
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class ContentNewsNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class ContentShortedNewsNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class NewsTitleNotEmpty : Attribute { }

        /// <summary>
        /// Comment News
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class CommentNewsNameNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class CommentNewsDetailNotEmpty : Attribute { }

        /// <summary>
        /// Product
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class ProductCodeNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class ProductNameNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class ProductPriceNotEmpty : Attribute { }

        [AttributeUsage(AttributeTargets.Property)]
        public class ProductPlaceOriginNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class ProductStatusNotEmpty : Attribute { }

        [AttributeUsage(AttributeTargets.Property)]
        public class ProductImageNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class ProductQuantityNotEmpty : Attribute { }

        /// <summary>
        /// Category
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class CategoryCodeNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class CategoryNameNotEmpty : Attribute { }

        /// <summary>
        /// Comment Product
        /// </summary>
        [AttributeUsage(AttributeTargets.Property)]
        public class CommentProductNameNotEmpty : Attribute { }


        [AttributeUsage(AttributeTargets.Property)]
        public class CommentProductDetailNotEmpty : Attribute { }


        /// <summary>
        /// News
        /// </summary>
        //[AttributeUsage(AttributeTargets.Property)]
        //public class ContentNewsNotEmpty : Attribute { }


        //[AttributeUsage(AttributeTargets.Property)]
        //public class ContentShortedNewsNotEmpty : Attribute { }


        //[AttributeUsage(AttributeTargets.Property)]
        //public class NewsTitleNotEmpty : Attribute { }

        ///// <summary>
        ///// News
        ///// </summary>
        //[AttributeUsage(AttributeTargets.Property)]
        //public class ContentNewsNotEmpty : Attribute { }


        //[AttributeUsage(AttributeTargets.Property)]
        //public class ContentShortedNewsNotEmpty : Attribute { }


        //[AttributeUsage(AttributeTargets.Property)]
        //public class NewsTitleNotEmpty : Attribute { }

    }
}
