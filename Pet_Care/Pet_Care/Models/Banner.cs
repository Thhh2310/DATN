using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class Banner
{
    public int BannerId { get; set; }

    public string Image { get; set; } = null!;

    public string? Title { get; set; }

    public DateOnly? CreatedDate { get; set; }
}
