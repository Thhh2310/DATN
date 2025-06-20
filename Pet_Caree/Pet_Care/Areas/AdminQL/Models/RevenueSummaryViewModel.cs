namespace Pet_Care.Areas.AdminQL.Models
{
    public class RevenueReport
    {
        public string Label { get; set; } = null!;
        public double TotalRevenue { get; set; }
    }
    public class RevenueSummaryViewModel
    {
        public List<RevenueReport> Daily { get; set; } = new();
        public List<RevenueReport> Monthly { get; set; } = new();
        public List<RevenueReport> Quarterly { get; set; } = new();
        public List<RevenueReport> Yearly { get; set; } = new();
    }
}
