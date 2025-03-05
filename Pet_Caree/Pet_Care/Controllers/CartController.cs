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
    private object _httpContextAccessor;

    public CartController(PetCareContext context)
    {
        _context = context;
    }

    public IActionResult Index()
    {
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
    public async Task<IActionResult> OrderPay()
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

        // Đưa dữ liệu vào ViewBag hoặc Model
        ViewBag.Customer = customer;
        ViewBag.CartItems = carts;

        return View();
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
