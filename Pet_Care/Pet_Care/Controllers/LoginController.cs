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

        // GET: Đăng nhập
        public IActionResult Index()
        {
            ViewBag.ServiceCategories = _context.CategoryServices.ToList();
            return View();
        }

        // POST: Đăng nhập
        [HttpPost]
        public IActionResult Index(string userOrEmail, string password)
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
