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
        public async Task<IActionResult> SubmitContact(Contact contact)
        {
            ViewBag.ServiceCategories = _context.CategoryServices.ToList();

            if (ModelState.IsValid)
            {
               _context.Contacts.Add(contact);
                await _context.SaveChangesAsync();
                ViewBag.Message = "Cảm ơn đã liên hệ với chúng tôi. Hãy đợi thông báo nhé!!!";
            }
            return View("Index", contact);
        }
    }
}
