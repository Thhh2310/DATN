using Microsoft.AspNetCore.Mvc;
using Pet_Care.Models;

namespace Pet_Care.Controllers
{
    public class AboutController : Controller
    {
        private readonly PetCareContext _context;

        public AboutController(PetCareContext context)
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
