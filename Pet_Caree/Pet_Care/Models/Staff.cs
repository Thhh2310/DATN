using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Staff
{
    public int StaffId { get; set; }

    [Display(Name = "Họ và tên")]
    public string FullName { get; set; } = null!;

    [Display(Name = "Số điện thoại")]
    public string Phone { get; set; } = null!;

    [Display(Name = "Email")]
    public string Email { get; set; } = null!;

    [Display(Name = "Ngày sinh")]
    public DateOnly? DateOfBirth { get; set; }

    [Display(Name = "Mức lương")]
    [DataType(DataType.Currency)]
    public double Salary { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
