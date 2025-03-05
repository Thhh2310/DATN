using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models
{
    public class Cart
    {
        public int Id { get; set; }

        [Display(Name = "Tên sản phẩm")]
        public string Name { get; set; }

        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [Display(Name = "Đơn giá")]
        public float Price { get; set; }

        [Display(Name = "Mã danh mục")]
        public int CategoryServiceId { get; set; }

        [Display(Name = "Mã khách hàng")]
        public int CustomerId { get; set; }
    }
}
