using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using Pet_Care.Models;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System;

public class CartController : Controller
{
    private readonly PetCareContext _context;
    //private object _httpContextAccessor;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public CartController(PetCareContext context, IHttpContextAccessor httpContextAccessor)
    {
        _context = context;
        _httpContextAccessor = httpContextAccessor;
    }

    public IActionResult Index()
    {
        var member = _httpContextAccessor.HttpContext.Session.GetString("Member");
        if (member == null || member == "")
        {
            return RedirectToAction("Index", "Login");
        }
        ViewBag.ServiceCategories = _context.CategoryServices.ToList();

        var carts = HttpContext.Session.GetObjectFromJson<List<Cart>>("My-Cart") ?? new List<Cart>();
        return View(carts);
    }

    /// <summary>
    /// Thêm sản phẩm vào giỏ hàng
    /// </summary>
    /// <param name="id">ID sản phẩm</param>
    /// <returns></returns>
    public IActionResult Add(int id)
    {
        // Lấy giỏ hàng từ session (nếu chưa có thì tạo mới)
        List<Cart> carts = HttpContext.Session.GetObjectFromJson<List<Cart>>("My-Cart") ?? new List<Cart>();

        // Tìm sản phẩm cần mua trong database
        var p = _context.Services.Find(id);
        if (p == null)
        {
            return NotFound();
        }

        // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
        var existingItem = carts.FirstOrDefault(item => item.Id == id);
        if (existingItem == null)
        {
            // Thêm sản phẩm vào giỏ hàng
            var item = new Cart()
            {
                Id = p.ServiceId,
                Name = p.ServiceName,
                Price = (float)p.Price,
                Image = p.Image
            };
            carts.Add(item);
        }
        else
        {
            // Nếu sản phẩm đã tồn tại, có thể tăng số lượng (nếu cần)
            // existingItem.Quantity += 1;
        }

        // Lưu giỏ hàng vào session
        HttpContext.Session.SetObjectAsJson("My-Cart", carts);

        return RedirectToAction("Index");
    }


    /// <summary>
    /// Chức năng xoá sản phẩm khỏi giỏ hàng
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public IActionResult Remove(int id)
    {
        var carts = HttpContext.Session.GetObjectFromJson<List<Cart>>("My-Cart") ?? new List<Cart>();

        var itemToRemove = carts.FirstOrDefault(item => item.Id == id);
        if (itemToRemove != null)
        {
            carts.Remove(itemToRemove);
        }

        HttpContext.Session.SetObjectAsJson("My-Cart", carts);
        return RedirectToAction("Index");
    }


    /// <summary>
    /// Chức năng đặt đơn hàng
    /// </summary>
    /// <returns></returns>
    [HttpPost]
    public async Task<IActionResult> OrderPay(DateTime AppointmentDate, TimeSpan AppointmentTime)
    {
        // Lấy giỏ hàng từ session
        var carts = HttpContext.Session.GetObjectFromJson<List<Cart>>("My-Cart") ?? new List<Cart>();

        if (carts.Count == 0)
        {
            TempData["Error"] = "Giỏ hàng trống! Vui lòng chọn dịch vụ trước khi thanh toán.";
            return RedirectToAction("Index");
        }

        // Lấy ID khách hàng từ session
        var userId = HttpContext.Session.GetString("Id");
        if (string.IsNullOrEmpty(userId) || !int.TryParse(userId, out int customerId))
        {
            TempData["Error"] = "Bạn cần đăng nhập để đặt hàng!";
            return RedirectToAction("Index");
        }

        // Truy vấn thông tin khách hàng từ database
        var customer = await _context.Customers.FirstOrDefaultAsync(c => c.CustomerId == customerId);
        if (customer == null)
        {
            TempData["Error"] = "Tài khoản không hợp lệ!";
            return RedirectToAction("Index");
        }

        // Lấy danh sách thú cưng của khách hàng
        var pets = _context.Pets.FirstOrDefault(p => p.CustomerId == customer.CustomerId);
        ViewBag.Pets = pets;

        ViewBag.Customer = customer;

        // Tính tổng tiền
        double totalAmount = carts.Sum(c => c.Price);

        // Tạo đơn hàng mới
        var order = new Order
        {
            CustomerId = customer.CustomerId,
            OrderDate = DateOnly.FromDateTime(DateTime.Now),
            Status = "Chờ xử lý",
            TotalAmount = totalAmount
        };
        _context.Orders.Add(order);
        await _context.SaveChangesAsync();

        // Tạo lịch hẹn
        var appointment = new Appointment
        {
            AppointmentDate = DateOnly.FromDateTime(AppointmentDate),
            AppointmentTime = TimeOnly.FromTimeSpan(AppointmentTime),
            Status = "Chờ xác nhận"
        };
        _context.Appointments.Add(appointment);
        await _context.SaveChangesAsync();

        // Tạo chi tiết đơn hàng cho mỗi dịch vụ
        foreach (var item in carts)
        {
            var detail = new OrderDetail
            {
                OrderId = order.OrderId,
                ServiceId = item.Id,
                Price = item.Price,
                Quantity = 1,
                TotalPrice = item.Price,
                PetId = pets.PetId,
                AppointmentId = appointment.AppointmentId
            };
            _context.OrderDetails.Add(detail);
        }

        await _context.SaveChangesAsync();

        // Xoá giỏ hàng
        HttpContext.Session.Remove("My-Cart");


        TempData["success"] = "Đặt lịch thành công!";
        return RedirectToAction("OrderSuccess", "Cart");
    }


    public IActionResult OrderSuccess()
    {
        return View();
    }

}

public static class SessionExtensions
{
    public static void SetObjectAsJson(this ISession session, string key, object value)
    {
        session.SetString(key, JsonConvert.SerializeObject(value));
    }

    public static T GetObjectFromJson<T>(this ISession session, string key)
    {
        var value = session.GetString(key);
        return value == null ? default : JsonConvert.DeserializeObject<T>(value);
    }
}
