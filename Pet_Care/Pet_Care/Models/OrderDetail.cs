using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class OrderDetail
{
    public int OrderDetailId { get; set; }

    public int? OrderId { get; set; }

    public int? ServiceId { get; set; }

    public int? PetId { get; set; }

    public int? AppointmentId { get; set; }

    public int? Quantity { get; set; }

    public double Price { get; set; }

    public double? TotalPrice { get; set; }

    public virtual Appointment? Appointment { get; set; }

    public virtual Order? Order { get; set; }

    public virtual Pet? Pet { get; set; }

    public virtual Service? Service { get; set; }
}
