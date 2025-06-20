using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Pet_Care.Models;
using X.PagedList;

namespace Pet_Care.Areas.AdminQL.Controllers
{
    [Area("AdminQL")]
    public class OrdersController : Controller
    {
        private readonly PetCareContext _context;

        public OrdersController(PetCareContext context)
        {
            _context = context;
        }

        // GET: AdminQL/Orders
        public async Task<IActionResult> Index(string account, int page = 1)
        {
            //số bản ghi trên một trang
            int limit = 5;

            var order = await _context.Orders.OrderBy(a => a.OrderId).ToPagedListAsync(page, limit);
            //nếu có tham số name trên url
            if (!String.IsNullOrEmpty(account))
            {
                order = await _context.Orders.Where(a => a.Status.Contains(account)).OrderBy(a => a.Status).ToPagedListAsync(page, limit);
            }
            ViewBag.keyword = account;
            return View(order);

        }

        // GET: AdminQL/Orders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .Include(o => o.Customer)
                .Include(o => o.PaymentMethod)
                .Include(o => o.Staff)
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }

        // GET: AdminQL/Orders/Create
        public IActionResult Create()
        {
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName");
            ViewData["PaymentMethodId"] = new SelectList(_context.PaymentMethods, "PaymentMethodId", "MethodName");
            ViewData["StaffId"] = new SelectList(_context.Staffs, "StaffId", "FullName");
            return View();
        }

        // POST: AdminQL/Orders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderId,CustomerId,StaffId,PaymentMethodId,OrderDate,Status,TotalAmount,Notes")] Order order)
        {
            if (ModelState.IsValid)
            {
                _context.Add(order);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "CustomerId", order.CustomerId);
            ViewData["PaymentMethodId"] = new SelectList(_context.PaymentMethods, "PaymentMethodId", "PaymentMethodId", order.PaymentMethodId);
            ViewData["StaffId"] = new SelectList(_context.Staffs, "StaffId", "StaffId", order.StaffId);
            return View(order);
        }

        // GET: AdminQL/Orders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName", order.CustomerId);
            ViewData["PaymentMethodId"] = new SelectList(_context.PaymentMethods, "PaymentMethodId", "MethodName", order.PaymentMethodId);
            ViewData["StaffId"] = new SelectList(_context.Staffs, "StaffId", "FullName", order.StaffId);
            return View(order);
        }

        // POST: AdminQL/Orders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderId,CustomerId,StaffId,PaymentMethodId,OrderDate,Status,TotalAmount,Notes")] Order order)
        {
            if (id != order.OrderId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(order);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderExists(order.OrderId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "CustomerId", order.CustomerId);
            ViewData["PaymentMethodId"] = new SelectList(_context.PaymentMethods, "PaymentMethodId", "PaymentMethodId", order.PaymentMethodId);
            ViewData["StaffId"] = new SelectList(_context.Staffs, "StaffId", "StaffId", order.StaffId);
            return View(order);
        }

        // GET: AdminQL/Orders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var order = await _context.Orders
            //    .Include(o => o.Customer)
            //    .Include(o => o.PaymentMethod)
            //    .Include(o => o.Staff)
            //    .FirstOrDefaultAsync(m => m.OrderId == id);
            //if (order == null)
            //{
            //    return NotFound();
            //}

            //return View(order);
            var order = _context.Orders.FirstOrDefault(u => u.OrderId == id);
            if (order == null)
            {
                // Nếu không tìm thấy người dùng, redirect đến danh sách hoặc hiển thị lỗi
                return NotFound();
            }

            // Tiến hành xóa người dùng
            _context.Orders.Remove(order);
            _context.SaveChanges();

            // Redirect về trang danh sách người dùng hoặc trang khác sau khi xóa thành công
            return RedirectToAction(nameof(Index));  // Giả sử bạn sẽ chuyển hướng về trang danh sách
        }

        private bool OrderExists(int id)
        {
            return _context.Orders.Any(e => e.OrderId == id);
        }
    }
}
