using AutoPro.Common.Entities.DTO;
using AutoPro.DL;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using System.Data;
using System.Data.SqlClient;

namespace AutoPro.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class DashloadController : ControllerBase
    {

        [HttpGet]
        public IActionResult GetStatistics()
        {
            // Khởi tạo lấy kết nối đường dẫn database
            string connectionString = DatabaseContext.ConnectionString;
            int tongsp = 0;
            int tonguser = 0;
            int tongdonhang = 0;
            decimal tongdoanhthu = 0;
            int tongtintuc = 0;
            int tongnhanhang = 0;
            int tongdanhmuc = 0;
            int sanphamsaphethang = 0;
            int tongdanhgia = 0;

            using (var conn = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand("Proc_DashLoad",conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "Proc_DashLoad";
                    conn.Open();

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                string columnName = reader.GetName(0);

                                switch (columnName)
                                {
                                    case "tongsp":
                                        tongsp = reader.GetInt32(0);
                                        break;

                                    case "tonguser":
                                        tonguser = reader.GetInt32(0);
                                        break;

                                    case "tongdonhang":
                                        tongdonhang = reader.GetInt32(0);
                                        break;

                                    case "tongdoanhthu":
                                        tongdoanhthu = reader.GetDecimal(0);
                                       break;

                                    case "tongtintuc":
                                        tongtintuc = reader.GetInt32(0);
                                        break;

                                    case "tongnhanhang":
                                        tongnhanhang = reader.GetInt32(0);
                                        break;

                                    case "tongdanhmuc":
                                        tongdanhmuc = reader.GetInt32(0);
                                        break;

                                    case "sanphamsaphethang":
                                        sanphamsaphethang = reader.GetInt32(0);
                                        break;

                                    case "tongsodanhgia":
                                        tongdanhgia = reader.GetInt32(0);
                                        break;

                                    default:
                                        break;
                                }
                            }

                            reader.NextResult();
                        }
                    }
                    //}
                }

                return Ok(new
                {
                    TongSanPham = tongsp,
                    TongUser = tonguser,
                    TongDonHang = tongdonhang,
                    TongDoanhThu = tongdoanhthu,
                    TongTinTuc = tongtintuc,
                    TongNhanHang = tongnhanhang,
                    TongDanhMuc = tongdanhmuc,
                    SanPhamSapHetHang = sanphamsaphethang,
                    TongDanhgia = tongdanhgia,
                }) ;
            }
        }
    }
}
