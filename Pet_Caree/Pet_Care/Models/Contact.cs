using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Contact
{
    public int ContactId { get; set; }

    [Display(Name = "Tiêu đề")]
    public string Title { get; set; } = null!;

    [Display(Name = "Email")]
    public string Email { get; set; } = null!;

    [Display(Name = "Số điện thoại")]
    public string? Phone { get; set; }

    [Display(Name = "Địa chỉ")]
    public string? Address { get; set; }

    [Display(Name = "Nội dung")]
    public string? Content { get; set; }

    [Display(Name = "Ngày tạo")]
    public DateOnly? CreatedDate { get; set; }
}
