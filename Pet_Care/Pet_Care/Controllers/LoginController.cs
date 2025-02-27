using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NuGet.Protocol;
using Pet_Care.Models;
using System.Security.Policy;

namespace Pet_Care.Controllers
{
    public class LoginController : Controller
    {
        private readonly PetCareContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public LoginController(PetCareContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        public IActionResult Index(string url)
        {
            return View();
        }

        // GET: Đăng ký
        public IActionResult Register()
        {
            return View();
        }

        // POST: Đăng ký
        [HttpPost]
        public IActionResult Register(Customer model)
        {

            try
            {
                if (model == null || string.IsNullOrEmpty(model.Password) || string.IsNullOrEmpty(model.Email))
                {
                    TempData["errorRegister"] = "Thông tin đăng ký không hợp lệ.";
                    return RedirectToAction("Index");
                }

                // Thiết lập thông tin cần thiết cho khách hàng
                model.Password = model.Password; // Đây là nơi mã hóa mật khẩu có thể được thực hiện nếu cần

                // Thêm khách hàng vào cơ sở dữ liệu
                _context.Add(model);
                _context.SaveChanges();

                TempData["successRegister"] = "Đăng ký thành công. Vui lòng đăng nhập!";
                return RedirectToAction("Login");
            }
            catch (Exception ex)
            {
                TempData["errorRegister"] = "Lỗi đăng ký: " + ex.Message;
                return RedirectToAction("Index");
            }
        }

        // GET: Đăng nhập
        public IActionResult Login()
        {
            return View();
        }

        // POST: Đăng nhập
        [HttpPost]
        public IActionResult Login(string userOrEmail, string password)
        {
            // Kiểm tra thông tin đăng nhập
            bool isAuthenticated = Authenticate(userOrEmail, password);

            if (isAuthenticated)
            {
                var customer = _context.Customers
                               .FirstOrDefault(c => c.Email == userOrEmail);
                // Lưu thông tin vào session
                _httpContextAccessor.HttpContext.Session.SetString("Member", customer.ToJson());
                _httpContextAccessor.HttpContext.Session.SetString("Id", customer.CustomerId.ToString());
                return RedirectToAction("Index", "Home");
            }

            TempData["errorLogin"] = "Thông tin đăng nhập không chính xác!";
            return View();
        }

        // Đăng xuất
        public IActionResult Logout()
        {
            // Xóa session
            _httpContextAccessor.HttpContext.Session.Remove("Member");

            // Điều hướng về trang chủ
            return RedirectToAction("Index", "Home");
        }

        private bool Authenticate(string userOrEmail, string password)
        {
            var customer = _context.Customers
                               .FirstOrDefault(c => c.Email == userOrEmail);  // Kiểm tra theo email

            if (customer != null && customer.Password == password)
            {
                return true;
            }

            return false;

            // Kiểm tra thông tin đăng nhập (có thể là so sánh với cơ sở dữ liệu hoặc danh sách người dùng)
            // Ví dụ, so sánh với thông tin cứng:
            return userOrEmail == "vuthao23102003@gmail.com" && password == "123456";
        }

    }
}
