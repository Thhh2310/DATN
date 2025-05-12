using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Pet_Care.Models;

namespace Pet_Care.Controllers
{
    public class ContactController : Controller
    {
        private readonly PetCareContext _context;

        public ContactController(PetCareContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            ViewBag.ServiceCategories = _context.CategoryServices.ToList();
            return View();
        }

        // POST: Contact/SubmitContact
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SubmitContact(string Title, string Email, string Phone, string Address, string Content)
        {
            if (ModelState.IsValid)
            {
                // Tạo một bản ghi Contact mới
                var contact = new Contact
                {
                    Email = Email,
                    Phone = Phone,
                    Address = Address,
                    Content = $"Tên: {Title} - Nội dung: {Content}",
                    CreatedDate = DateOnly.FromDateTime(DateTime.Now)
                };

                // Thêm vào cơ sở dữ liệu
                _context.Contacts.Add(contact);
                await _context.SaveChangesAsync();

                // Thêm thông báo thành công vào TempData
                TempData["SuccessMessage"] = "Yêu cầu liên hệ của bạn đã được gửi thành công! Chúng tôi sẽ liên hệ với bạn sớm nhất.";

                // Chuyển hướng về trang Index
                return RedirectToAction(nameof(Index));
            }
            return View("Index");
        }
    }
}
