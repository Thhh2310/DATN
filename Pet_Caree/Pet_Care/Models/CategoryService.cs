using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class CategoryService
{
    public int CategoryServiceId { get; set; }

    [Required(ErrorMessage = "Vui lòng nhập tên danh mục dịch vụ")]
    [Display(Name = "Tên danh mục dịch vụ")]
    public string CategoryServiceName { get; set; } = null!;

    [Display(Name = "Mô tả")]
    public string? Description { get; set; }

    public virtual ICollection<Service> Services { get; set; } = new List<Service>();
}
