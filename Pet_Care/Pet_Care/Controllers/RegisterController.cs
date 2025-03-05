using Microsoft.AspNetCore.Mvc;
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

        // POST: Đăng ký
        [HttpPost]
        public IActionResult Index(Customer customer, Pet pet)
        {

            try
            {
                // Kiểm tra email đã tồn tại chưa
                var existingCustomer = _context.Customers.FirstOrDefault(c => c.Email == customer.Email);
                if (existingCustomer != null)
                {
                    TempData["errorRegister"] = "Email đã được sử dụng!";
                    return View(customer);
                }

                // Lưu thông tin khách hàng
                customer.RegistrationDate = DateOnly.FromDateTime(DateTime.UtcNow);
                _context.Customers.Add(customer);
                _context.SaveChanges(); // Lưu trước để có CustomerId

                // Lưu thông tin thú cưng
                pet.CustomerId = customer.CustomerId;
                _context.Pets.Add(pet);
                _context.SaveChanges();

                TempData["successRegister"] = "Đăng ký thành công! Vui lòng đăng nhập.";
                return RedirectToAction("Login");
            }
            catch (Exception ex)
            {
                TempData["errorRegister"] = "Lỗi đăng ký: " + ex.Message;
                return RedirectToAction("Index");
            }
        }
    }
}
