using Microsoft.AspNetCore.Mvc;
using Pet_Care.Areas.AdminQL.Models;
using Pet_Care.Models;

namespace Pet_Care.Areas.AdminQL.Controllers
{
    [Area("AdminQL")]
    public class RevenueController : Controller
    {
        private readonly PetCareContext _context;

        public RevenueController(PetCareContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var orders = _context.Orders
                .Where(o => o.OrderDate != null && o.TotalAmount != null)
                .ToList();

            var model = new RevenueSummaryViewModel
            {
                Daily = orders
                    .GroupBy(o => o.OrderDate.Value)
                    .Select(g => new RevenueReport
                    {
                        Label = g.Key.ToString("dd/MM/yyyy"),
                        TotalRevenue = g.Sum(x => x.TotalAmount ?? 0)
                    }).ToList(),

                Monthly = orders
                    .GroupBy(o => new { o.OrderDate.Value.Year, o.OrderDate.Value.Month })
                    .Select(g => new RevenueReport
                    {
                        Label = $"Tháng {g.Key.Month:D2}/{g.Key.Year}",
                        TotalRevenue = g.Sum(x => x.TotalAmount ?? 0)
                    }).ToList(),

                Quarterly = orders
                    .GroupBy(o => new
                    {
                        o.OrderDate.Value.Year,
                        Quarter = (o.OrderDate.Value.Month - 1) / 3 + 1
                    })
                    .Select(g => new RevenueReport
                    {
                        Label = $"Quý {g.Key.Quarter} - {g.Key.Year}",
                        TotalRevenue = g.Sum(x => x.TotalAmount ?? 0)
                    }).ToList(),

                Yearly = orders
                    .GroupBy(o => o.OrderDate.Value.Year)
                    .Select(g => new RevenueReport
                    {
                        Label = $"Năm {g.Key}",
                        TotalRevenue = g.Sum(x => x.TotalAmount ?? 0)
                    }).ToList()
            };

            return View(model);
        }
    }
}
