using Microsoft.AspNetCore.Mvc;
using Pet_Care.Areas.AdminQL.Models;
using Pet_Care.Models;

namespace Pet_Care.Areas.AdminQL.Controllers
{
    public class DashboardController : BaseController
    {
        private readonly DashboardServices _dashboardService;
        private readonly PetCareContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public DashboardController(DashboardServices dashboardService, PetCareContext context, IHttpContextAccessor httpContextAccessor)
        {
            _dashboardService = dashboardService;
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }
        public IActionResult Index()
        {
            var data = _dashboardService.GetDashboardData(); // Lấy dữ liệu cho Admin
            return View("Index", data); // Truyền dữ liệu vào view AdminDashboard
        }
    }
}
