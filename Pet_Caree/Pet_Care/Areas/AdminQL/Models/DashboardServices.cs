using Microsoft.Data.SqlClient;

namespace Pet_Care.Areas.AdminQL.Models
{
    public class DashboardServices
    {
        private readonly string _connectionString;

        public DashboardServices(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("AppConnectionString");
        }

        public Dashboard GetDashboardData()
        {
            var data = new Dashboard();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();

                // Truy vấn các số liệu thống kê
                string query = @"
                    SELECT 
                        (SELECT COUNT(*) FROM Customers) AS KhachHang,
                        (SELECT COUNT(*) FROM Staffs) AS NhanVien,
                        (SELECT COUNT(*) FROM Pets) AS ThuCung,
                        (SELECT COUNT(*) FROM Services) AS DichVu,
                        (SELECT COUNT(*) FROM Orders) AS DonHang,
                        (SELECT COUNT(*) FROM Appointments) AS LichHen
                ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        data.KhachHang = reader.GetInt32(0);
                        data.NhanVien = reader.GetInt32(1);
                        data.ThuCung = reader.GetInt32(2);
                        data.DichVu = reader.GetInt32(3);
                        data.DonHang = reader.GetInt32(4);
                        data.LichHen = reader.GetInt32(5);
                    }
                }
            }
            return data;
        }
    }
}
