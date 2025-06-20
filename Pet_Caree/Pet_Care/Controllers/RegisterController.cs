using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Pet_Care.Common;
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
            ViewBag.CategoryId = new SelectList(_context.Categories.ToList(), "CategoryId", "Type");
            return View();
        }

        // POST: Đăng ký
        [HttpPost]
        public IActionResult Create(Customer model, string FullName, string Email, string Password, string Phone, string Address,
                            string PetName, int CategoryId, int? Age, double? Weight, string Color, string Notes)
        {
            try
            {
                if (_context.Customers.Any(c => c.Email == Email))
                {
                    TempData["errorRegister"] = "Email đã được sử dụng.";
                    return RedirectToAction("Index");
                }

                // Thiết lập thông tin cần thiết cho khách hàng
                model.Password = EasySha256.Hash(model.Password); // Đây là nơi mã hóa mật khẩu có thể được thực hiện nếu cần


                var customer = new Customer
                {
                    FullName = FullName,
                    Email = Email,
                    Password = model.Password,
                    Phone = Phone,
                    Address = Address
                };

                _context.Customers.Add(customer);
                _context.SaveChanges(); // sinh CustomerId

                var pet = new Pet
                {
                    PetName = PetName,
                    CategoryId = CategoryId,
                    Age = Age,
                    Weight = Weight,
                    Color = Color,
                    Notes = Notes,
                    CustomerId = customer.CustomerId // sử dụng ID vừa tạo
                };

                _context.Pets.Add(pet);
                _context.SaveChanges(); // thêm pet

                return RedirectToAction("Index", "Login");
            }
            catch (Exception ex)
            {
                TempData["errorRegister"] = "Đăng ký thất bại.Vui lòng đăng ký lại! ";
                return RedirectToAction("Index");
            }
        }
    }
}
