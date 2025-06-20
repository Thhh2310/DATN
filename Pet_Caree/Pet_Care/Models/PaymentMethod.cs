using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class PaymentMethod
{
    public int PaymentMethodId { get; set; }

    [Display(Name = "Phương thức thanh toán")]
    public string MethodName { get; set; } = null!;

    [Display(Name = "Mô tả")]
    public string? Description { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
