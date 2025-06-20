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
    public class OrderDetailsController : Controller
    {
        private readonly PetCareContext _context;

        public OrderDetailsController(PetCareContext context)
        {
            _context = context;
        }

        // GET: AdminQL/OrderDetails
        public async Task<IActionResult> Index(string account, int page = 1)
        {
            //số bản ghi trên một trang
            int limit = 5;

            var detail = await _context.OrderDetails.OrderBy(a => a.OrderDetailId).ToPagedListAsync(page, limit);
            //nếu có tham số name trên url
            if (!String.IsNullOrEmpty(account))
            {
                detail = await _context.OrderDetails.Where(a => a.Pet.PetName.Contains(account)).OrderBy(a => a.Pet.PetName).ToPagedListAsync(page, limit);
            }
            ViewBag.keyword = account;
            return View(detail);

        }

        // GET: AdminQL/OrderDetails/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderDetail = await _context.OrderDetails
                .Include(o => o.Appointment)
                .Include(o => o.Order)
                .Include(o => o.Pet)
                .Include(o => o.Service)
                .FirstOrDefaultAsync(m => m.OrderDetailId == id);
            if (orderDetail == null)
            {
                return NotFound();
            }

            return View(orderDetail);
        }

        // GET: AdminQL/OrderDetails/Create
        public IActionResult Create()
        {
            ViewData["AppointmentId"] = new SelectList(_context.Appointments, "AppointmentId", "AppointmentDate");
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "OrderId");
            ViewData["PetId"] = new SelectList(_context.Pets, "PetId", "PetName");
            ViewData["ServiceId"] = new SelectList(_context.Services, "ServiceId", "ServiceName");
            return View();
        }

        // POST: AdminQL/OrderDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderDetailId,OrderId,ServiceId,PetId,AppointmentId,SizeId,Quantity,Price,TotalPrice")] OrderDetail orderDetail)
        {
            if (ModelState.IsValid)
            {
                _context.Add(orderDetail);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["AppointmentId"] = new SelectList(_context.Appointments, "AppointmentId", "AppointmentId", orderDetail.AppointmentId);
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "OrderId", orderDetail.OrderId);
            ViewData["PetId"] = new SelectList(_context.Pets, "PetId", "PetId", orderDetail.PetId);
            ViewData["ServiceId"] = new SelectList(_context.Services, "ServiceId", "ServiceId", orderDetail.ServiceId);
            return View(orderDetail);
        }

        // GET: AdminQL/OrderDetails/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderDetail = await _context.OrderDetails.FindAsync(id);
            if (orderDetail == null)
            {
                return NotFound();
            }
            ViewData["AppointmentId"] = new SelectList(_context.Appointments, "AppointmentId", "AppointmentDate", orderDetail.AppointmentId);
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "OrderId", orderDetail.OrderId);
            ViewData["PetId"] = new SelectList(_context.Pets, "PetId", "PetName", orderDetail.PetId);
            ViewData["ServiceId"] = new SelectList(_context.Services, "ServiceId", "ServiceName", orderDetail.ServiceId);
            return View(orderDetail);
        }

        // POST: AdminQL/OrderDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderDetailId,OrderId,ServiceId,PetId,AppointmentId,SizeId,Quantity,Price,TotalPrice")] OrderDetail orderDetail)
        {
            if (id != orderDetail.OrderDetailId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(orderDetail);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderDetailExists(orderDetail.OrderDetailId))
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
            ViewData["AppointmentId"] = new SelectList(_context.Appointments, "AppointmentId", "AppointmentId", orderDetail.AppointmentId);
            ViewData["OrderId"] = new SelectList(_context.Orders, "OrderId", "OrderId", orderDetail.OrderId);
            ViewData["PetId"] = new SelectList(_context.Pets, "PetId", "PetId", orderDetail.PetId);
            ViewData["ServiceId"] = new SelectList(_context.Services, "ServiceId", "ServiceId", orderDetail.ServiceId);
            return View(orderDetail);
        }

        // GET: AdminQL/OrderDetails/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var orderDetail = await _context.OrderDetails
            //    .Include(o => o.Appointment)
            //    .Include(o => o.Order)
            //    .Include(o => o.Pet)
            //    .Include(o => o.Service)
            //    .Include(o => o.Size)
            //    .FirstOrDefaultAsync(m => m.OrderDetailId == id);
            //if (orderDetail == null)
            //{
            //    return NotFound();
            //}

            //return View(orderDetail);
            var orderDetail = _context.OrderDetails.FirstOrDefault(u => u.OrderDetailId == id);
            if (orderDetail == null)
            {
                // Nếu không tìm thấy người dùng, redirect đến danh sách hoặc hiển thị lỗi
                return NotFound();
            }

            // Tiến hành xóa người dùng
            _context.OrderDetails.Remove(orderDetail);
            _context.SaveChanges();

            // Redirect về trang danh sách người dùng hoặc trang khác sau khi xóa thành công
            return RedirectToAction(nameof(Index));  // Giả sử bạn sẽ chuyển hướng về trang danh sách
        }

        private bool OrderDetailExists(int id)
        {
            return _context.OrderDetails.Any(e => e.OrderDetailId == id);
        }
    }
}
