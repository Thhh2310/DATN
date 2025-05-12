using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Service
{
    public int ServiceId { get; set; }

    [Display(Name = "Loại dịch vụ")]
    public int? CategoryServiceId { get; set; }

    [Display(Name = "Tên dịch vụ")]
    public string ServiceName { get; set; } = null!;

    [Display(Name = "Mô tả")]
    public string? Description { get; set; }

    [Display(Name = "Giá dịch vụ")]
    [DataType(DataType.Currency)]
    public double Price { get; set; }

    [Display(Name = "Trạng thái")]
    public string? Status { get; set; }

    [Display(Name = "Ngày tạo")]
    public DateOnly? CreatedDate { get; set; }

    [Display(Name = "Hình ảnh")]
    public string? Image { get; set; }

    [Display(Name = "Giá cũ")]
    [DataType(DataType.Currency)]
    public double? OldPrice { get; set; }

    public virtual CategoryService? CategoryService { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();
}
