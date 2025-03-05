using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class Category
{
    public int CategoryId { get; set; }

    public string? Type { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Pet> Pets { get; set; } = new List<Pet>();
}
