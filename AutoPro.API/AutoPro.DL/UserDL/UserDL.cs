using AutoPro.Common.Entities;
using AutoPro.Common.Entities.Param;
using AutoPro.Common.ProceduceName;
using AutoPro.DL.BaseDL;
using Dapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace AutoPro.DL.UserDL
{
    public class UserDL : BaseDL<User>, IUserDL
    {


        /// <summary>
        /// Khởi tạo lấy kết nối đường dẫn database
        /// </summary>
        string connectionString = DatabaseContext.ConnectionString;
        public object checkLogin(string Account, string Password)
        {
            // Chuẩn bị tên stored proceduce
            string queryLogin = String.Format(ProceduceName.Login, typeof(User).Name);

            // Tham số đầu vào
            var parameters = new DynamicParameters();
            parameters.Add("v_Account", Account);
            parameters.Add("v_Password", Password);

            // Kết nối db
            using (var mySqlConnection = new MySqlConnection(connectionString))
            {
                var results = mySqlConnection.QueryFirstOrDefault(queryLogin, parameters, commandType: System.Data.CommandType.StoredProcedure);
                // Return kêt quả
                return results;
            }
        }

        public string forgotPassword(Forgot forgot)
        {
            // Chuẩn bị tên stored proceduce
            string queryLogin = "Proc_User_ForgotPassword";

            // Tham số đầu vào
            var parameters = new DynamicParameters();
            parameters.Add("v_Account", forgot.account);
            parameters.Add("v_Email", forgot.email);

            // Kết nối db
            using (var mySqlConnection = new MySqlConnection(connectionString))
            {
                var results = mySqlConnection.QueryFirstOrDefault<string>(queryLogin, parameters, commandType: System.Data.CommandType.StoredProcedure);
                // Return kêt quả
                return results;
            }
        }

        /// <summary>
        /// Kiểm tra tồn tại
        /// </summary>
        /// <param name="idRecord"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public bool IsExistAccount(User? record)
        {
            // Chuẩn bị tên stored proceduce
            string ExistRecord = String.Format(ProceduceName.IsExistAccount, typeof(User).Name);

            // Tham số đầu vào
            var parameter = new DynamicParameters();
            parameter.Add("v_Account", record.Account);

            using (var mySqlConnection = new MySqlConnection(connectionString))
            {
                // Số bản ghi bị tác động
                var numberOfAffectedRow = mySqlConnection.QueryFirstOrDefault<int>(ExistRecord, parameter, commandType: System.Data.CommandType.StoredProcedure);
                if (numberOfAffectedRow > 0)
                {
                    return true;
                }
                return false;
            }
        }

        public bool IsExistEmail(User? record)
        {
            // Chuẩn bị tên stored proceduce
            string ExistRecord = String.Format(ProceduceName.IsExistEmail, typeof(User).Name);

            // Tham số đầu vào
            var parameter = new DynamicParameters();
            parameter.Add("v_Email", record.Email);

            using (var mySqlConnection = new MySqlConnection(connectionString))
            {
                // Số bản ghi bị tác động
                var numberOfAffectedRow = mySqlConnection.QueryFirstOrDefault<int>(ExistRecord, parameter, commandType: System.Data.CommandType.StoredProcedure);
                if (numberOfAffectedRow > 0)
                {
                    return true;
                }
                return false;
            }
        }

        public int UpdateAdmin(User record, int idRecord)
        {
            // Chuẩn bị tên store procedure
            string updateStoredProcedureName = String.Format(ProceduceName.Update, typeof(User).Name);

            var properties = typeof(User).GetProperties();
            var parameters = new DynamicParameters();

            // Lấy key attribute
            foreach (var property in properties)
            {
                // Set key id cập nhật bằng id truyền vào
                var keyAttribute = (KeyAttribute?)property.GetCustomAttribute(typeof(KeyAttribute), false);
                if (keyAttribute != null)
                {
                    parameters.Add($"v_{property.Name}", idRecord);
                }
                var propertyName = $"v_{property.Name}"; // Tạo biến cho đầu vào cho store procedure
                var propertyValue = property.GetValue(record); // Lấy giá có thuộc tính propertyName của record
                parameters.Add(propertyName, propertyValue);
            }
            parameters.Add("v_Role", "Admin");
            parameters.Add("v_ModifiedDate", DateTime.Now);
            parameters.Add("v_ModifiedBy", "DangPD");

            // Số bản ghi bị ảnh hưởng
            int numberOfAffectedRow = 0;
            using (var mySqlConnection = new MySqlConnection(connectionString))
            {
                // Số bản ghi bị tác động
                numberOfAffectedRow = mySqlConnection.Execute(updateStoredProcedureName, parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
            return numberOfAffectedRow;
        }

        public bool updatePass(UpdatePass updatePass)
        {
            string sql = "select tu.Password from tb_user tu where tu.UserID = @id";
            var param = new DynamicParameters();
            param.Add("@id", updatePass.id);
            string data = "";
            using(var mySqlConnection = new MySqlConnection(connectionString))
            {
                data = mySqlConnection.QueryFirstOrDefault<string>(sql, param, commandType: System.Data.CommandType.Text);
            }

            if(data != updatePass.passold)
            {
                return false;
            }
            // Chuẩn bị tên stored proceduce
            string queryLogin = "Proc_User_UpdatePassword";

            // Tham số đầu vào
            var parameters = new DynamicParameters();
            parameters.Add("v_id", updatePass.id);
            parameters.Add("v_Password", updatePass.passnew);

            // Kết nối db
            int numberOfAffectedRow = 0;
            using (var mySqlConnection = new MySqlConnection(connectionString))
            {
                numberOfAffectedRow = mySqlConnection.Execute(queryLogin, parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
            if(numberOfAffectedRow > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
