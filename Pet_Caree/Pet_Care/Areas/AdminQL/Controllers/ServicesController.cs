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
    public class ServicesController : Controller
    {
        private readonly PetCareContext _context;

        public ServicesController(PetCareContext context)
        {
            _context = context;
        }

        // GET: AdminQL/Services
        public async Task<IActionResult> Index(string account, int page = 1)
        {
            //số bản ghi trên một trang
            int limit = 5;

            var service = await _context.Services.OrderBy(a => a.ServiceId).ToPagedListAsync(page, limit);
            //nếu có tham số name trên url
            if (!String.IsNullOrEmpty(account))
            {
                service = await _context.Services.Where(a => a.ServiceName.Contains(account)).OrderBy(a => a.ServiceName).ToPagedListAsync(page, limit);
            }
            ViewBag.keyword = account;
            return View(service);

        }

        // GET: AdminQL/Services/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var service = await _context.Services
                .Include(s => s.CategoryService)
                .FirstOrDefaultAsync(m => m.ServiceId == id);
            if (service == null)
            {
                return NotFound();
            }

            return View(service);
        }

        // GET: AdminQL/Services/Create
        public IActionResult Create()
        {
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceName");
            return View();
        }

        // POST: AdminQL/Services/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ServiceId,CategoryServiceId,ServiceName,Description,Price,Status,CreatedDate")] Service service)
        {
            if (ModelState.IsValid)
            {
                _context.Add(service);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceId", service.CategoryServiceId);
            return View(service);
        }

        // GET: AdminQL/Services/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var service = await _context.Services.FindAsync(id);
            if (service == null)
            {
                return NotFound();
            }
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceName", service.CategoryServiceId);
            return View(service);
        }

        // POST: AdminQL/Services/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ServiceId,CategoryServiceId,ServiceName,Description,Price,Status,CreatedDate")] Service service)
        {
            if (id != service.ServiceId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(service);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ServiceExists(service.ServiceId))
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
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceId", service.CategoryServiceId);
            return View(service);
        }

        // GET: AdminQL/Services/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var service = await _context.Services
            //    .Include(s => s.CategoryService)
            //    .FirstOrDefaultAsync(m => m.ServiceId == id);
            //if (service == null)
            //{
            //    return NotFound();
            //}

            //return View(service);
            var service = _context.Services.FirstOrDefault(u => u.ServiceId == id);
            if (service == null)
            {
                // Nếu không tìm thấy người dùng, redirect đến danh sách hoặc hiển thị lỗi
                return NotFound();
            }

            // Tiến hành xóa người dùng
            _context.Services.Remove(service);
            _context.SaveChanges();

            // Redirect về trang danh sách người dùng hoặc trang khác sau khi xóa thành công
            return RedirectToAction(nameof(Index));  // Giả sử bạn sẽ chuyển hướng về trang danh sách
        }

        private bool ServiceExists(int id)
        {
            return _context.Services.Any(e => e.ServiceId == id);
        }
    }
}
