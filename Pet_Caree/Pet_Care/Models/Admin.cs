using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Admin
{
    public int AdminId { get; set; }

    [Display(Name = "Tên quản trị viên")]
    public string AdminName { get; set; } = null!;

    [Display(Name = "Email")]
    public string Email { get; set; } = null!;

    [Display(Name = "Mật khẩu")]
    public string Password { get; set; } = null!;

    [Display(Name = "Ảnh đại diện")]
    public string? Avatar { get; set; }
}
