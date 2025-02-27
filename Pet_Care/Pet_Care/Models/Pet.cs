using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class Pet
{
    public int PetId { get; set; }

    public int? CustomerId { get; set; }

    public int? CategoryId { get; set; }

    public string PetName { get; set; } = null!;

    public int? Age { get; set; }

    public double? Weight { get; set; }

    public string? Color { get; set; }

    public string? Notes { get; set; }

    public virtual Category? Category { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
