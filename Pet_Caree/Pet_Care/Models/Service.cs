using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class Service
{
    public int ServiceId { get; set; }

    public int? CategoryServiceId { get; set; }

    public string ServiceName { get; set; } = null!;

    public string? Description { get; set; }

    public double Price { get; set; }

    public string? Status { get; set; }

    public DateOnly? CreatedDate { get; set; }

    public string? Image { get; set; }

    public double? OldPrice { get; set; }

    public virtual CategoryService? CategoryService { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();
}
