using System;
using System.Collections.Generic;

namespace Pet_Care.Models;

public partial class Contact
{
    public int ContactId { get; set; }

    public string Title { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public string? Content { get; set; }

    public DateOnly? CreatedDate { get; set; }
}
