﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AutoPro.Common.Resource {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "17.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class DataResource {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal DataResource() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("AutoPro.Common.Resource.DataResource", typeof(DataResource).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Server không tìm thấy bất kì tài nguyên nào, bản ghi không tồn tại.
        /// </summary>
        public static string DevMsg_DeleteFailed {
            get {
                return ResourceManager.GetString("DevMsg_DeleteFailed", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Bắt được exception.
        /// </summary>
        public static string DevMsg_Exception {
            get {
                return ResourceManager.GetString("DevMsg_Exception", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Server không tìm thấy bất kì tài nguyên nào, gọi procedure trong database thất bại.
        /// </summary>
        public static string DevMsg_InsertFailed {
            get {
                return ResourceManager.GetString("DevMsg_InsertFailed", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Dữ liệu đầu vào không hợp lệ.
        /// </summary>
        public static string DevMsg_InvalidData {
            get {
                return ResourceManager.GetString("DevMsg_InvalidData", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Lỗi xảy ra server.
        /// </summary>
        public static string DevMsg_ServerError {
            get {
                return ResourceManager.GetString("DevMsg_ServerError", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Server không tìm thấy bất kì tài nguyên nào, bản ghi không tồn tại.
        /// </summary>
        public static string DevMsg_UpdateFailed {
            get {
                return ResourceManager.GetString("DevMsg_UpdateFailed", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Xoá thất bại, vui lòng thử lại.
        /// </summary>
        public static string UserMsg_DeleteFailed {
            get {
                return ResourceManager.GetString("UserMsg_DeleteFailed", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Mã đã tồn tại trong hệ thống.
        /// </summary>
        public static string UserMsg_DuplicateCode {
            get {
                return ResourceManager.GetString("UserMsg_DuplicateCode", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Có lỗi xảy ra, vui lòng liên hệ AutoPro để được hỗ trợ.
        /// </summary>
        public static string UserMsg_Exception {
            get {
                return ResourceManager.GetString("UserMsg_Exception", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Thêm mới thất bại, vui lòng thử lại.
        /// </summary>
        public static string UserMsg_InsertFailed {
            get {
                return ResourceManager.GetString("UserMsg_InsertFailed", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Dữ liệu đầu vào không hợp lệ.
        /// </summary>
        public static string UserMsg_InvalidData {
            get {
                return ResourceManager.GetString("UserMsg_InvalidData", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Có lỗi xảy ra vui lòng liên hệ AutoPro.
        /// </summary>
        public static string UserMsg_ServerError {
            get {
                return ResourceManager.GetString("UserMsg_ServerError", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Sửa thất bại, vui lòng thử lại.
        /// </summary>
        public static string UserMsg_UpdateFailed {
            get {
                return ResourceManager.GetString("UserMsg_UpdateFailed", resourceCulture);
            }
        }
    }
}
