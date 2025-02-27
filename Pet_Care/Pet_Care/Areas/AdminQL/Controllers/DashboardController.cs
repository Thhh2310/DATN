using Microsoft.AspNetCore.Mvc;

namespace Pet_Care.Areas.AdminQL.Controllers
{
    public class DashboardController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
