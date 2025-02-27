using Microsoft.AspNetCore.Mvc;
using Pet_Care.Models;

namespace Pet_Care.Controllers
{
    public class ServiceController : Controller
    {
        private readonly PetCareContext _context;

        public ServiceController(PetCareContext context)
        {
            _context = context;
        }
        public IActionResult Index(int id)
        {
            //var category = _context.CategoryServices.FirstOrDefault(c => c.CategoryServiceId == id);
            //if (category == null) return NotFound();

            //// Lấy danh sách sản phẩm thuộc danh mục này
            //var services = _context.Services
            //                       .Where(s => s.CategoryServiceId == id)
            //                       .ToList();

            //ViewBag.ServiceName = category.CategoryServiceName;    // Gửi tên danh mục qua View
            //return View(services);
            var category = _context.CategoryServices.Find(id);
            if (category == null)
            {
                return NotFound();
            }

            var services = _context.Services
                .Where(s => s.CategoryServiceId == id)
                .ToList();

            ViewBag.ServiceName = category.CategoryServiceName;
            return View(services);
        }

    }
}
