using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Pet_Care.Models;

namespace Pet_Care.Controllers
{
    public class RegisterController : Controller
    {
        private readonly PetCareContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public RegisterController(PetCareContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        // GET: Đăng ký
        public IActionResult Index()
        {
            ViewBag.ServiceCategories = _context.CategoryServices.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult Index(Customer model)
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
                return RedirectToAction("Index","Login");
            }
            catch (Exception ex)
            {
                TempData["errorRegister"] = "Lỗi đăng ký: " + ex.Message;
                return RedirectToAction("Index");
            }
        }
    }
}
