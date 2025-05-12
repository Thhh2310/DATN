using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Appointment
{
    public int AppointmentId { get; set; }

    [Display(Name = "Ngày hẹn")]
    public DateOnly AppointmentDate { get; set; }

    [Display(Name = "Giờ hẹn")]
    public TimeOnly AppointmentTime { get; set; }

    [Display(Name = "Trạng thái")]
    public string? Status { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
