using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Order
{
    public int OrderId { get; set; }

    [Display(Name = "Khách hàng")]
    public int? CustomerId { get; set; }

    [Display(Name = "Nhân viên")]
    public int? StaffId { get; set; }

    [Display(Name = "Phương thức thanh toán")]
    public int? PaymentMethodId { get; set; }

    [Display(Name = "Ngày đặt")]
    public DateOnly? OrderDate { get; set; }

    [Display(Name = "Trạng thái")]
    public string? Status { get; set; }

    [Display(Name = "Tổng tiền")]
    public double? TotalAmount { get; set; }

    [Display(Name = "Ghi chú")]
    public string? Notes { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual PaymentMethod? PaymentMethod { get; set; }

    public virtual Staff? Staff { get; set; }
}
