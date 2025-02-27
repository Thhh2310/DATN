using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class CategoryService
{
    public int CategoryServiceId { get; set; }

    public string CategoryServiceName { get; set; } = null!;

    public string? Description { get; set; }

    public virtual ICollection<Service> Services { get; set; } = new List<Service>();
}
