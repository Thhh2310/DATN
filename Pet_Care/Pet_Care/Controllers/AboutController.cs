using Microsoft.AspNetCore.Mvc;

namespace Pet_Care.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
