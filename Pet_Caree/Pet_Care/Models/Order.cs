using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public int? CustomerId { get; set; }

    public int? StaffId { get; set; }

    public int? PaymentMethodId { get; set; }

    public DateOnly? OrderDate { get; set; }

    public string? Status { get; set; }

    public double? TotalAmount { get; set; }

    public string? Notes { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual PaymentMethod? PaymentMethod { get; set; }

    public virtual Staff? Staff { get; set; }
}
