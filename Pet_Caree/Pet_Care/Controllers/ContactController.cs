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
    }
}
