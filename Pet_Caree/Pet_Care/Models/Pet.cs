using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Pet
{
    public int PetId { get; set; }

    [Display(Name = "Khách hàng")]
    public int? CustomerId { get; set; }

    [Display(Name = "Loại thú cưng")]
    public int? CategoryId { get; set; }

    [Display(Name = "Tên thú cưng")]
    public string PetName { get; set; } = null!;

    [Display(Name = "Tuổi")]
    public int? Age { get; set; }

    [Display(Name = "Cân nặng (kg)")]
    public double? Weight { get; set; }

    [Display(Name = "Màu sắc")]
    public string? Color { get; set; }

    [Display(Name = "Ghi chú")]
    public string? Notes { get; set; }

    public virtual Category? Category { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
