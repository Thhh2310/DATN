using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Pet_Care.Models;

public partial class Customer
{
    public int CustomerId { get; set; }

    [DisplayName("Họ và tên")]
    public string FullName { get; set; } = null!;

    [DisplayName("Địa chỉ")]
    public string? Address { get; set; }

    [DisplayName("Số điện thoại")]
    public string Phone { get; set; } = null!;

    public string Email { get; set; } = null!;

    [DisplayName("Mật khẩu")]
    public string Password { get; set; } = null!;

    [DisplayName("Ngày sinh")]
    public DateOnly? DateOfBirth { get; set; }

    [DisplayName("Ngày đăng kí")]
    public DateOnly? RegistrationDate { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<Pet> Pets { get; set; } = new List<Pet>();

    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();

    //internal string ToJson()
    //{
    //    throw new NotImplementedException();
    //}
}
