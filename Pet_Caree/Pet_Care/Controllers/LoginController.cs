using Microsoft.AspNetCore.Mvc;
using Pet_Care.Models;
using Microsoft.AspNetCore.Http;
using System.Linq;
using NuGet.Protocol;
using Pet_Care.Common;

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
            var member = _httpContextAccessor.HttpContext.Session.GetString("Member");
            if (member != null && member != "")
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.ServiceCategories = _context.CategoryServices.ToList();
            return View();
        }

        // POST: Xử lý đăng nhập
        [HttpPost]
        public IActionResult Index(string userOrEmail, string password)
        {

            var customer = _context.Customers
                .FirstOrDefault(c => c.Email == userOrEmail || c.FullName == userOrEmail); // Kiểm tra cả Email & Username

            if (customer != null && customer.Password == EasySha256.Hash(password))
            {
                // Lưu thông tin vào session
                _httpContextAccessor.HttpContext.Session.SetString("Member", customer.ToJson());
                _httpContextAccessor.HttpContext.Session.SetString("Id", customer.CustomerId.ToString());
                _httpContextAccessor.HttpContext.Session.SetString("Email", customer.Email);

                return RedirectToAction("Index", "Home");
            }

            TempData["errorLogin"] = "Thông tin đăng nhập không chính xác!";
            return RedirectToAction("Index", "Login");
        }

        // Đăng xuất
        public IActionResult Logout()
        {
            _httpContextAccessor.HttpContext.Session.Clear(); // Xóa tất cả session
            return RedirectToAction("Index", "Home");
        }
    }
}
