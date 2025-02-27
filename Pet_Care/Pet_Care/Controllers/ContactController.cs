using Microsoft.AspNetCore.Mvc;

namespace Pet_Care.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
