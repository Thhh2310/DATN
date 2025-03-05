using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class Staff
{
    public int StaffId { get; set; }

    public string FullName { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Email { get; set; } = null!;

    public DateOnly? DateOfBirth { get; set; }

    public double Salary { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
