using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class OrderDetail
{
    public int OrderDetailId { get; set; }

    [Display(Name = "Đơn hàng")]
    public int? OrderId { get; set; }

    [Display(Name = "Dịch vụ")]
    public int? ServiceId { get; set; }

    [Display(Name = "Thú cưng")]
    public int? PetId { get; set; }

    [Display(Name = "Lịch hẹn")]
    public int? AppointmentId { get; set; }

    [Display(Name = "Số lượng")]
    public int? Quantity { get; set; }

    [Display(Name = "Đơn giá")]
    [DataType(DataType.Currency)]
    [DisplayFormat(DataFormatString = "{0:#,0}", ApplyFormatInEditMode = true)]
    public double Price { get; set; }

    [Display(Name = "Thành tiền")]
    [DataType(DataType.Currency)]
    [DisplayFormat(DataFormatString = "{0:#,0}", ApplyFormatInEditMode = true)]
    public double? TotalPrice { get; set; }

    public virtual Appointment? Appointment { get; set; }

    public virtual Order? Order { get; set; }

    public virtual Pet? Pet { get; set; }

    public virtual Service? Service { get; set; }
}
