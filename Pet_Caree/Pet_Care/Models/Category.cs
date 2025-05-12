using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Category
{
    public int CategoryId { get; set; }

    [Display(Name = "Loại thú cưng")]
    public string? Type { get; set; }

    [Display(Name = "Mô tả")]
    public string? Description { get; set; }

    public virtual ICollection<Pet> Pets { get; set; } = new List<Pet>();
}
